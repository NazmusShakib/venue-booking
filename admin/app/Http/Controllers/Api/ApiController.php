<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\AmenityResource;
use App\Http\Resources\OccasionResource;
use App\Http\Resources\VenueResource;
use App\Http\Resources\EventCalendarResource;
use App\Models\Category;
use App\Models\Amenity;
use App\Models\Occasion;
use App\Models\Venue;
use App\Models\EventCalendar;

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

    public function event_store(Request $request){
        $e = EventCalendar::create([
            'created_by' => $request->user_id,
            'venue_id' => $request->venue_id,
            'title' => $request->title,
            'description' => $request->description,
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
            'all_day_event' => $request->allDay,
            'status' => $request->status,
        ]);

        $res = new EventCalendarResource($e);

        return response()->json([
            'status' => 200,
            'event' => $res,
            'message' => 'Data successfully stored in database.'
        ]);
    }

    public function events($venue_id){
        $ec = EventCalendar::where('venue_id', $venue_id)->get();
        return EventCalendarResource::collection($ec);
    }

    public function delete_event($id){
        EventCalendar::find($id)->delete();
        return response()->json([
            'status' => 200,
            'message' => 'Event successfully deleted.'
        ]);
    }

    public function venues_lists_for_dropdown(Request $request){
        $venues = Venue::select('id as value', 'name as label')->where('is_enabled', 1)->get()->toArray();

        return response()->json([
            'status' => 200,
            'venues' => $venues
        ]);
    }
}
