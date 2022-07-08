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

    public function formatVenueFilter($request, $category){
        $categoryIds = !empty($request->categories) ? $request->categories : [];
        if(!empty($category))
            array_push($categoryIds, $category);

        $amenityIds = !empty($request->amenities) ? $request->amenities : [];
        $occasionIds = !empty($request->occasions) ? $request->occasions : [];

        if(!empty($categoryIds) && count($categoryIds) > 0 )
        {
            $cats = array_unique($categoryIds);
            $categoryIds = Category::whereIn('slug', $cats)->pluck('id')->toArray();
            sort($categoryIds);
        }

        if(!empty($amenityIds) && count($amenityIds) > 0 )
        {
            $amenities = array_unique($amenityIds);
            $amenityIds = Amenity::whereIn('slug', $amenities)->pluck('id')->toArray();
            sort($amenityIds);
        }

        if(!empty($occasionIds) && count($occasionIds) > 0 )
        {
            $occasions = array_unique($occasionIds);
            $occasionIds = Occasion::whereIn('slug', $occasions)->pluck('id')->toArray();
            sort($occasionIds);
        }

        return [
            'categoryIds' => $categoryIds,
            'amenityIds' => $amenityIds,
            'occasionIds' => $occasionIds
        ];
    }

    public function venues(Request $request, $category = ''){
        $filter = $this->formatVenueFilter($request, $category);
        $venues = Venue::where(function($query)use($filter){
            if(!empty($filter['categoryIds']))
            {
                $categoryIds = $filter['categoryIds'];
                $query->whereHas('categories', function($query)use($categoryIds){
                    $query->whereIn('category_id', $categoryIds);
                });
            }

            if(!empty($filter['amenityIds']))
            {
                $amenityIds = $filter['amenityIds'];
                $query->whereHas('amenities', function($query)use($amenityIds){
                    $query->whereIn('amenity_id', $amenityIds);
                });
            }

            if(!empty($filter['occasionIds']))
            {
                $occasionIds = $filter['occasionIds'];
                $query->whereHas('occasions', function($query)use($occasionIds){
                    $query->whereIn('occasion_id', $occasionIds);
                });
            }
        })->get();









        return VenueResource::collection($venues);
    }
}