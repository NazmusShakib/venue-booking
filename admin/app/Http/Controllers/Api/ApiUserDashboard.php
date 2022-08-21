<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\OrganizationResource;
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
            'message' => 'Organization successfully stored in database.'
        ]);
    }

    public function organizations_by_user($user_id){
        $organizations = User::find($user_id)->organizations;
        return OrganizationResource::collection($organizations);
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
}
