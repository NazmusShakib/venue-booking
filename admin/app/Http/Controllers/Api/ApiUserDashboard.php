<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\OrganizationResource;
use App\Http\Resources\VenueResource;
use App\Models\Category;
use App\Models\City;
use App\Models\Amenity;
use App\Models\Occasion;
use App\Models\Venue;
use App\Models\EventCalendar;
use App\Models\Order;
use App\Models\User;
use App\Models\Organization;
use Validator;
use Storage;

class ApiUserDashboard extends Controller
{
    public function organization_store(Request $request){
        $validation = Validator::make($request->all(), [
            'user_id' => ['required'],
            'name' => ['required', 'string', 'max:255'],
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

        return response()->json([
            'status' => 200,
            'message' => 'Organization successfully saved.'
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

    public function delete_organization($organization_id){
        try {
            $organization = Organization::find($organization_id);
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

    public function venue_store(Request $request){
        $validation = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'star_rating' => ['required', 'numeric'],
            'featured_image' => ['required'],
            'property_images' => ['required'],
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

        //property_images
        $property_images = [];
        if(!empty($request->property_images))
        {
            foreach($request->property_images as $img){
                $base64PropertyImage = explode(";base64,", $img);
                $propertyImageName = str_random(40).'.'.explode("image/", $base64PropertyImage[0])[1];
                $propertyImageFile = base64_decode($base64PropertyImage[1]);
                $property_images[] = 'images/'.$propertyImageName;
                Storage::put("public/images/$propertyImageName", $propertyImageFile);
            }
        }

        $venue = new Venue;
        $venue->organization_id = $request->organization_id;
        $venue->featured_image = !empty($featuredImageName) ? "images/$featuredImageName" : '';
        $venue->images = $property_images;
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
            'message' => 'Property successfully saved.'
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
}
