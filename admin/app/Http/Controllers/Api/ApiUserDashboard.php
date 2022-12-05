<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\OrganizationResource;
use App\Http\Resources\VenueResource;
use App\Http\Resources\OrderResource;
use App\Http\Resources\VenueEditResource;
use App\Models\Category;
use App\Models\Amenity;
use App\Models\Occasion;
use App\Models\Division;
use App\Models\District;
use App\Models\City;
use App\Models\Venue;
use App\Models\EventCalendar;
use App\Models\Order;
use App\Models\User;
use App\Models\Organization;
use Validator;
use Storage;
use Hash;

class ApiUserDashboard extends Controller
{
    public function get_profile(Request $request){
        return $request->user();
    }

    public function update_profile(Request $request){
        $rules = [
             'name' => ['required', 'string', 'max:255'],
             'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email,'.$request->user()->id],
             'username' => [
                 'required', 'string', 'min:3', 'max:20', 'unique:users,username,'.$request->user()->id,
                 function ($attribute, $value, $fail) {
                     $words = ['username', '_username', 'username_', 'user_name', 'User_name', 'Username', 'Username_', '_Username', 'User_Name', 'user_Name'];
                     foreach($words as $word){
                         if (strpos($value, $word) !== false){
                             $fail('The '.$attribute.' is invalid.');
                         }
                     }

                     if(substr($value,0,1) == '_'){
                         $fail('The username cannot contain underscores at the beginning or end.');
                     }

                     if(substr($value, -1) == '_'){
                         $fail('The username cannot contain underscores at the beginning or end.');
                     }
                 },
                 'regex:/^[A-Za-z0-9]+(?:[_][A-Za-z0-9]+)*$/',
             ]
         ];

         if(!empty($request->password)){
            $rules['password'] = ['required', 'string', 'min:6'];
            $rules['confirm_password'] = ['required', 'string', 'min:6', 'same:password'];
         }

        $validation = Validator::make($request->all(), $rules);

        if ($validation->fails()) {
            return response()->json([
                'status' => 400,
                'message' => 'Profile update failed!.',
                'errors' => $validation->messages()
            ]);
        }

        $user = $request->user();
        $user->name = $request->name;
        $user->username = $request->username;
        $user->email = $request->email;
        if(!empty($request->password))
        {
            $user->password = Hash::make($request->password);
        }
        $user->update();

        $res = [
            'user_id' => $user->id,
            'name' => $user->name,
            'username' => $user->username,
            'email' => $user->email,
            'token' => $request->bearerToken()
        ];

        return response()->json([
            'status' => 200,
            'user' => $res,
            'message' => 'Profile successfully updated!.'
        ]);
    }

    public function organization_store(Request $request){
        $validation = Validator::make($request->all(), [
            'user_id' => ['required'],
            'name' => ['required', 'string', 'max:255', 'unique:organizations'],
            'description' => ['required', 'string', 'max:255'],
            'contact_name' => ['required', 'string', 'max:255'],
            'contact_number' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'string', 'unique:organizations', 'max:255'],
            'address' => ['required', 'string', 'max:255']
        ]);

        if ($validation->fails()) {
            return response()->json([
                'status' => 400,
                'message' => 'Organization store failed!.',
                'errors' => $validation->messages()
            ]);
        }

        $organization = new Organization;
        $organization->name = $request->name;
        $organization->description = $request->description;
        $organization->contact_name = $request->contact_name;
        $organization->contact_number = $request->contact_number;
        $organization->email = $request->email;
        $organization->address = $request->address;
        $organization->multiple_properties = $request->multiple_properties;
        $organization->creator_type = 'User';
        $organization->created_by = $request->user_id;
        $organization->save();
        $organization->collaborators()->attach($request->user_id);

        User::find($request->user_id)->update(['type'=>'Venue Owner']);

        return response()->json([
            'status' => 200,
            'message' => 'Organization successfully saved.'
        ]);
    }

    public function organization_edit(Request $request, $slug){
        $organization = Organization::where('slug', $slug)->first()->makeHidden(['creator', 'updater', 'created_at', 'updated_at', 'updater_type', 'updated_by']);
        if($organization->creator_type === 'User' && $organization->created_by === (int)$request->updated_by)
        {
            return response()->json(['status' => 200,   'data' => $organization]);
        }else{
            return response()->json(['status' => 306,   'error' => 'Sorry you can\'t edit this organization']);
        }
    }

    public function organization_update(Request $request, $slug){
        $organization = Organization::where('slug', $slug)->first();

        if($organization->creator_type !== 'User')
        {
            return response()->json(['status' => 306,   'error' => 'Sorry you can\'t update this organization']);
        }elseif($organization->created_by !== (int)$request->updated_by)
        {
            return response()->json(['status' => 306,   'error' => 'Sorry you can\'t update this organization']);
        }

        $validation = Validator::make($request->all(), [
            'updated_by' => ['required'],
            'name' => ['required', 'string', 'max:255', 'unique:organizations,name,'.$organization->id],
            'description' => ['required', 'string', 'max:255'],
            'contact_name' => ['required', 'string', 'max:255'],
            'contact_number' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'string', 'max:255', 'unique:organizations,email,'.$organization->id],
            'address' => ['required', 'string', 'max:255']
        ]);

        if ($validation->fails()) {
            return response()->json([
                'status' => 400,
                'message' => 'Organization update failed!.',
                'errors' => $validation->messages()
            ]);
        }

        $organization->name = $request->name;
        $organization->description = $request->description;
        $organization->contact_name = $request->contact_name;
        $organization->contact_number = $request->contact_number;
        $organization->email = $request->email;
        $organization->address = $request->address;
        $organization->multiple_properties = $request->multiple_properties;
        $organization->updater_type = 'User';
        $organization->updated_by = $request->updated_by;
        $organization->update();

        return response()->json([
            'status' => 200,
            'message' => 'Organization successfully updated.'
        ]);
    }

    public function organizations_by_user($user_id){
        $organizations = User::find($user_id)->organizations;
        return OrganizationResource::collection($organizations);
    }

    public function organizations_lists_for_dropdown(Request $request){
        $organizations = User::find($request->user_id)->organizations()->get(['organizations.id as value', 'organizations.name as label'])->makeHidden(['creator','updater','pivot'])->toArray();
        return response()->json([
            'status' => 200,
            'organizations' => $organizations
        ]);
    }

    public function delete_organization(Request $request, $organization_id){
        $organization = Organization::find($organization_id);
        if(((int)$organization->created_by === (int)$request->user_id) && ($organization->creator_type === $request->creator_type)){
            try {
                $organization->delete();
                $organization->collaborators()->detach();

                return response()->json([
                    'status' => 200,
                    'message' => 'Organization successfully deleted!'
                ]);
            } catch (\Exception $e) {
                return response()->json([
                    'status' => 500,
                    'message' => $e->getMessage()
                ]);
            }
        }

        return response()->json([
            'status' => 500,
            'message' => 'Sorry! you can\'t delete this organization!'
        ]);
    }

    public function venue_store(Request $request){
        $validation = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'star_rating' => ['required', 'numeric'],
            'featured_image' => ['required'],
            'venue_images' => ['required'],
            'organization_id' => ['required', 'numeric'],
            'star_rating' => ['required', 'numeric'],
            'description' => ['required', 'string'],
            'categories_id' => ['required', 'array'],
            'occasions_id' => ['required', 'array'],
            'amenities_id' => ['required', 'array'],
            'price_type' => ['required', 'string', 'max:10'],
            'price' => ['required', 'numeric'],
            'capacity' => ['required', 'numeric'],
            'division_id' => ['required', 'numeric'],
            'district_id' => ['required', 'numeric'],
            'city_id' => ['required', 'numeric'],
            'address' => ['required', 'string', 'max:255'],
            'creator_type' => ['required', 'string'],
            'created_by' => ['required', 'numeric'],
        ],[
            'organization_id.required' => 'The organization field is required.',
            'star_rating.required' => 'The rating field is required.',
            'categories_id.required' => 'The category field is required.',
            'occasions_id.required' => 'The occasion field is required.',
            'amenities_id.required' => 'The amenity field is required.',
            'division_id.required' => 'The division field is required.',
            'district_id.required' => 'The district field is required.',
            'city_id.required' => 'The city field is required.',
        ]);

        if ($validation->fails()) {
            return response()->json([
                'status' => 400,
                'message' => 'Venue store failed!.',
                'errors' => $validation->messages()
            ]);
        }

        //featured_image
        if(!empty($request->featured_image))
        {
            $base64FeaturedImage = explode(";base64,", $request->featured_image);
            $featuredImageName = str_random(40).'.'.explode("image/", $base64FeaturedImage[0])[1];
            $featuredImageFile = base64_decode($base64FeaturedImage[1]);
            Storage::put("public/images/$featuredImageName", $featuredImageFile);
        }

        //venue_images
        $venue_images = [];
        if(!empty($request->venue_images))
        {
            foreach($request->venue_images as $img){
                $base64venueImage = explode(";base64,", $img);
                $venueImageName = str_random(40).'.'.explode("image/", $base64venueImage[0])[1];
                $venueImageFile = base64_decode($base64venueImage[1]);
                $venue_images[] = 'images/'.$venueImageName;
                Storage::put("public/images/$venueImageName", $venueImageFile);
            }
        }

        $venue = new Venue;
        $venue->organization_id = $request->organization_id;
        $venue->featured_image = !empty($featuredImageName) ? "images/$featuredImageName" : '';
        $venue->images = $venue_images;
        $venue->name = $request->name;
        $venue->star_rating = $request->star_rating;
        $venue->description = $request->description;
        $venue->price_type = $request->price_type;
        $venue->price = $request->price;
        $venue->capacity = $request->capacity;
        $venue->division_id = $request->division_id;
        $venue->district_id = $request->district_id;
        $venue->city_id = $request->city_id;
        $venue->address = $request->address;
        $venue->is_enabled = $request->is_enabled;
        $venue->creator_type = $request->creator_type;
        $venue->created_by = $request->created_by;
        $venue->save();
        $venue->collaborators()->attach($request->created_by);
        $venue->categories()->attach($request->categories_id);
        $venue->amenities()->attach($request->amenities_id);
        $venue->occasions()->attach($request->occasions_id);

        return response()->json([
            'status' => 200,
            'message' => 'venue successfully saved.'
        ]);
    }

    public function venues_by_user($user_id){
        $venues = User::find($user_id)->venues;
        return VenueResource::collection($venues);
    }

    public function delete_venue(Request $request){
        $venue = Venue::find($request->venue_id);

        if(((int)$venue->created_by === (int)$request->user_id) && ($venue->creator_type === $request->creator_type)){
            try {
                $venue->delete();
                Storage::disk('public')->delete($venue->featured_image);
                Storage::disk('public')->delete($venue->images);
                $venue->collaborators()->detach();
                $venue->categories()->detach();
                $venue->amenities()->detach();
                $venue->occasions()->detach();

                return response()->json([
                    'status' => 200,
                    'message' => 'Venue successfully deleted!'
                ]);
            } catch (\Exception $e) {
                return response()->json([
                    'status' => 500,
                    'message' => $e->getMessage()
                ]);
            }
        }

        return response()->json([
            'status' => 500,
            'message' => 'Sorry! you can\'t delete this venue!'
        ]);
    }

    public function venues_orders($user_id){
        $venues_id = User::find($user_id)->venues->pluck('id')->toArray();
        $order = Order::whereIn('venue_id', $venues_id)->where('user_id', '!=', $user_id)->get();
        return OrderResource::collection($order);
    }

    public function venue_edit(Request $request, $slug){
        $venue = Venue::where('slug', $slug)->first();
        if($venue->creator_type === 'User' && $venue->created_by === (int)$request->user_id)
        {
            $resource = new VenueEditResource($venue, $request->user_id);
            return response()->json(['status' => 200,   'data' => $resource]);
        }else{
            return response()->json(['status' => 306,   'error' => 'Sorry you can\'t edit this venue']);
        }
    }

    public function venue_update(Request $request, $slug){
        $venue = Venue::where('slug', $slug)->first();

        if($venue->creator_type !== 'User')
        {
            return response()->json(['status' => 306,   'error' => 'Sorry you can\'t update this venue']);
        }elseif($venue->created_by !== (int)$request->updated_by)
        {
            return response()->json(['status' => 306,   'error' => 'Sorry you can\'t update this venue']);
        }

        $validation = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'star_rating' => ['required', 'numeric'],
            'featured_image' => ['required', 'array'],
            'venue_images' => ['required', 'array'],
            'organization_id' => ['required', 'numeric'],
            'star_rating' => ['required', 'numeric'],
            'description' => ['required', 'string'],
            'categories_id' => ['required', 'array'],
            'occasions_id' => ['required', 'array'],
            'amenities_id' => ['required', 'array'],
            'price_type' => ['required', 'string', 'max:10'],
            'price' => ['required', 'numeric'],
            'capacity' => ['required', 'numeric'],
            'division_id' => ['required', 'numeric'],
            'district_id' => ['required', 'numeric'],
            'city_id' => ['required', 'numeric'],
            'address' => ['required', 'string', 'max:255'],
            'updater_type' => ['required', 'string'],
            'updated_by' => ['required', 'numeric'],
        ],[
            'organization_id.required' => 'The organization field is required.',
            'star_rating.required' => 'The rating field is required.',
            'categories_id.required' => 'The category field is required.',
            'occasions_id.required' => 'The occasion field is required.',
            'amenities_id.required' => 'The amenity field is required.',
            'division_id.required' => 'The division field is required.',
            'district_id.required' => 'The district field is required.',
            'city_id.required' => 'The city field is required.',
        ]);


        if ($validation->fails()) {
            return response()->json([
                'status' => 400,
                'message' => 'Venue update failed!.',
                'errors' => $validation->messages()
           ]);
        }

        //featured_image
        $fImage = $venue->featured_image;
        if(!empty($request->featured_image))
        {
            if(empty($request->featured_image[0]['server_key'])){
                Storage::disk('public')->delete($venue->featured_image);
                $base64FeaturedImage = explode(";base64,", $request->featured_image[0]['data_url']);
                $featuredImageName = str_random(40).'.'.explode("image/", $base64FeaturedImage[0])[1];
                $featuredImageFile = base64_decode($base64FeaturedImage[1]);
                Storage::put("public/images/$featuredImageName", $featuredImageFile);
                $fImage = "images/$featuredImageName";
            }
        }

        //venue_images
        $venue_images = [];
        if(!empty($request->venue_images))
        {
            foreach($request->venue_images as $img){
                if(empty($img['server_key']))
                {
                    $base64venueImage = explode(";base64,", $img['data_url']);
                    $venueImageName = str_random(40).'.'.explode("image/", $base64venueImage[0])[1];
                    $venueImageFile = base64_decode($base64venueImage[1]);
                    $venue_images[] = 'images/'.$venueImageName;
                    Storage::put("public/images/$venueImageName", $venueImageFile);
                }
                else
                {
                    $venue_images[] = $img['server_key'];
                }
            }

            $new_venue_images = array_column($request->venue_images, 'server_key');
            $updated_venue_images = array_diff($venue->images, $new_venue_images);
            Storage::disk('public')->delete($updated_venue_images);
        }

        $venue->organization_id = $request->organization_id;
        $venue->featured_image = $fImage;
        $venue->images = $venue_images;
        $venue->name = $request->name;
        $venue->star_rating = $request->star_rating;
        $venue->description = $request->description;
        $venue->price_type = $request->price_type;
        $venue->price = $request->price;
        $venue->capacity = $request->capacity;
        $venue->division_id = $request->division_id;
        $venue->district_id = $request->district_id;
        $venue->city_id = $request->city_id;
        $venue->address = $request->address;
        $venue->is_enabled = $request->is_enabled;
        $venue->updater_type = $request->updater_type;
        $venue->updated_by = $request->updated_by;
        $venue->update();
        $venue->categories()->sync($request->categories_id);
        $venue->amenities()->sync($request->amenities_id);
        $venue->occasions()->sync($request->occasions_id);

        return response()->json([
            'status' => 200,
            'message' => 'Venue successfully updated.'
        ]);
    }
}
