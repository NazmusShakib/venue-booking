<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\AmenityResource;
use App\Http\Resources\OccasionResource;
use App\Http\Resources\VenueResource;
use App\Http\Resources\VenueDetailsResource;
use App\Http\Resources\EventCalendarResource;
use App\Http\Resources\CityResource;
use App\Http\Resources\OrderResource;
use App\Models\Category;
use App\Models\Division;
use App\Models\District;
use App\Models\City;
use App\Models\Amenity;
use App\Models\Occasion;
use App\Models\Venue;
use App\Models\EventCalendar;
use App\Models\Order;
use App\Models\User;
use Validator;

class ApiController extends Controller
{
    public function cities(){
        return CityResource::collection(City::has('venues')->get());
    }

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
        $dates = !empty($request->date) ? $request->date : [];
        $price = !empty($request->price) ? $request->price : [];
        $cityIds = !empty($request->cities) ? $request->cities : [];
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

        if(!empty($cityIds) && count($cityIds) > 0 )
        {
            $cities = array_unique($cityIds);
            $cityIds = City::whereIn('slug', $cities)->pluck('id')->toArray();
            sort($cityIds);
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
            'dates' => $dates,
            'price' => $price,
            'cityIds' => $cityIds,
            'categoryIds' => $categoryIds,
            'amenityIds' => $amenityIds,
            'occasionIds' => $occasionIds
        ];
    }

    public function venues(Request $request, $category = ''){
        $filter = $this->formatVenueFilter($request, $category);
        $venues = Venue::where(function($query)use($filter){
            if(!empty($filter['dates']['check_in']) && !empty($filter['dates']['check_out']))
            {
                $query->available($filter['dates']);
            }

            if(!empty($filter['price']) && $filter['price'] > 0)
            {
                $price = (double) $filter['price'];
                $query->where('price', '<=', $price);
            }

            if(!empty($filter['cityIds']))
            {
                $cityIds = $filter['cityIds'];
                $query->whereIn('city_id', $cityIds);
            }

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
        })->paginate(6);

        return VenueResource::collection($venues);
    }

    public function popular_venues(){
        $venues = Venue::leftJoin('orders','venues.id','=','orders.venue_id')
                    ->selectRaw('venues.*, COALESCE(count(orders.venue_id),0) total_orders')
                    ->groupBy('venues.id')
                    ->orderBy('total_orders','desc')
                    ->take(9)
                    ->get();
        return VenueResource::collection($venues);
    }

    public function top_visited_venues(){
        $venues = Venue::leftJoin('orders','venues.id','=','orders.venue_id')
                            ->selectRaw("venues.*, count(case when orders.status = 'approved' and orders.payment_status = 'completed' then 1 end) as total_completed")
                            ->groupBy('venues.id')
                            ->orderBy('total_completed','desc')
                            ->take(6)
                            ->get();
        return VenueResource::collection($venues);
    }

    public function venue_details($slug){
        $venue = new VenueDetailsResource(Venue::where('slug', $slug)->first());
        return response()->json([
            'status' => 200,
            'venue' => $venue
        ]);
    }

    public function event_store(Request $request){
        $data = [
            'created_by' => $request->user_id,
            'venue_id' => $request->venue_id,
            'title' => $request->title,
            'description' => $request->description,
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
            'all_day_event' => $request->allDay,
            'status' => $request->status,
        ];

        if(!EventCalendar::eventExists($data)->exists())
        {
            $e = EventCalendar::create($data);
            $res = new EventCalendarResource($e);
            return response()->json([
                'status' => 200,
                'event' => $res,
                'message' => 'Data successfully stored in database.'
            ]);
        }

        return response()->json([
            'status' => 400,
            'error' => 'Sorry! you can\'t add more event on same dates'
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
        $venue_id = User::find($request->user_id)->venues->pluck('id')->toArray();
        $venues = Venue::select('id as value', 'name as label')->whereIn('id', $venue_id)->where('is_enabled', 1)->get()->toArray();

        return response()->json([
            'status' => 200,
            'venues' => $venues
        ]);
    }

    public function division_lists_for_dropdown(Request $request){
        $value_field_as = $request->value_field_as ?? 'slug';
        $divisions = Division::select("$value_field_as as value", "name as label")->get()->toArray();

        return response()->json([
            'status' => 200,
            'divisions' => $divisions
        ]);
    }

    public function district_lists_for_dropdown(Request $request){
        $value_field_as = $request->value_field_as ?? 'slug';
        $division_id = $request->division_id ?? '';
        $confirm_parent = $request->confirm_parent_division ?? '';

        if(!empty($division_id)){
            $districts = District::select("$value_field_as as value", "name as label")->where('division_id', $division_id)->get()->toArray();
        }elseif('Yes' !== $confirm_parent){
            $districts = District::has('venues')->select("$value_field_as as value", "name as label")->get()->toArray();
        }else{
            $districts = [];
        }

        return response()->json([
            'status' => 200,
            'districts' => $districts
        ]);
    }

    public function city_lists_for_dropdown(Request $request){
        $value_field_as = $request->value_field_as ?? 'slug';
        $district_id = $request->district_id ?? '';
        $confirm_parent = $request->confirm_parent_district ?? '';

        if(!empty($district_id)){
            $cities = City::select("$value_field_as as value", "name as label")->where('district_id', $district_id)->get()->toArray();
        }elseif('Yes' !== $confirm_parent){
            $cities = City::has('venues')->select("$value_field_as as value", "name as label")->get()->toArray();
        }else{
            $cities = [];
        }

        return response()->json([
            'status' => 200,
            'cities' => $cities
        ]);
    }

    public function category_lists_for_dropdown(Request $request){
        $value_field_as = $request->value_field_as ?? 'slug';
        $cats = Category::select("$value_field_as as value", "name as label")->get()->toArray();

        return response()->json([
            'status' => 200,
            'categories' => $cats
        ]);
    }

    public function occasion_lists_for_dropdown(Request $request){
        $value_field_as = $request->value_field_as ?? 'slug';
        $occasions = Occasion::select("$value_field_as as value", "name as label")->get()->toArray();

        return response()->json([
            'status' => 200,
            'occasions' => $occasions
        ]);
    }

    public function amenity_lists_for_dropdown(Request $request){
        $value_field_as = $request->value_field_as ?? 'slug';
        $amenities = Amenity::select("$value_field_as as value", "name as label")->get()->toArray();

        return response()->json([
            'status' => 200,
            'amenities' => $amenities
        ]);
    }

    public function booking_availability_checking(Request $request){
        $data = [
            'venue_id' => $request->venue_id,
            'check_in'=>date('Y-m-d', strtotime($request->check_in)),
            'check_out'=>date('Y-m-d', strtotime($request->check_out))
        ];

        $venue = Venue::find($request->venue_id);
        $availability = $venue->bookingAvailable($data)->exists();

        return response()->json([
            'status'            =>  200,
            'availability'      =>   $availability,
            'available_dates'   =>  $availability === false ? $venue->availableDates() : [],
            'message'           =>  $availability === false ? 'Sorry! your selected dates is not available for booking, please! see below our available dates for this venue' : '',
        ]);
    }

    public function order_store(Request $request){
        $validation = Validator::make($request->all(), [
            'venue_id' => ['required'],
            'user_id' => ['required'],
            'start_date' => ['required', 'date'],
            'end_date' => ['required', 'date'],
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'string', 'max:255'],
            'category_id' => ['required', 'string', 'max:255'],
            'occasion_id' => ['required', 'string', 'max:255'],
            'mobile_number' => ['required', 'string', 'max:255'],
            'total_guests' => ['required', 'string', 'max:255'],
            'address' => ['required', 'string', 'max:255']
        ]);

        if ($validation->fails()) {
            return response()->json([
                'status' => 400,
                'message' => 'Booking failed!.',
                'errors' => $validation->messages()
            ]);
        }

        $order = new Order;
        $order->venue_id = $request->venue_id;
        $order->user_id = $request->user_id;
        $order->start_date = date('Y-m-d', strtotime($request->start_date));
        $order->end_date = date('Y-m-d', strtotime($request->end_date));
        $order->capacity = $request->capacity;
        $order->name = $request->name;
        $order->email = $request->email;
        $order->category_id = Category::where('slug', $request->category_id)->first()->id;
        $order->occasion_id = Occasion::where('slug', $request->occasion_id)->first()->id;
        $order->mobile_number = $request->mobile_number;
        $order->address = $request->address;
        $order->total_guests = $request->total_guests;
        $order->price_type = $request->price_type;
        $order->net_total_price = $request->net_total_price;
        $order->receive_promotional_offers = $request->receive_promotional_offers;
        $order->agree = $request->agree;
        $order->status = $request->status;
        $order->save();

        return response()->json([
            'status' => 200,
            'message' => 'Order successfully stored in database.'
        ]);
    }

    public function orders($user_id){
        $order = Order::where('user_id', $user_id)->get();
        return OrderResource::collection($order);
    }

    public function order_delete(Request $request){
        $order = Order::find($request->order_id);
        if('completed' !== strtolower($order->payment_status))
        {
            if(($request->user_id === $order->user_id && 'personal' === $request->type) || ('collaborator' === $request->type))
            {
                try {
                    $order->delete();
                    return response()->json([
                        'status' => 200,
                        'message' => 'Order successfully deleted!'
                    ]);
                } catch (\Exception $e) {

                    return response()->json([
                        'status' => 500,
                        'message' => $e->getMessage()
                    ]);
                }
            }
        }

        return response()->json([
            'status' => 500,
            'message' => 'Sorry! you can\'t delete this order!'
        ]);
    }
}
