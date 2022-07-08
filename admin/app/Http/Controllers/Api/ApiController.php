<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\AmenityResource;
use App\Http\Resources\OccasionResource;
use App\Http\Resources\VenueResource;
use App\Models\Category;
use App\Models\Amenity;
use App\Models\Occasion;
use App\Models\Venue;

class ApiController extends Controller
{
    public function categories(){
        return CategoryResource::collection(Category::all());
    }

    public function amenities(){
        return AmenityResource::collection(Amenity::all());
    }

    public function occasions(){
        return OccasionResource::collection(Occasion::all());
    }

    public function venues(Request $request, $category = ''){
        $venues = Venue::whereHas('categories', function($query)use($category){
            if(!empty($category))
            {
                $id = Category::where('slug', $category)->first()->id;
                $query->where('category_id', $id);
            }
        })->get();
        return VenueResource::collection($venues);
    }
}
