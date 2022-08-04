<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Venue extends Model
{
    use HasFactory;

    /**
   * Set the title attribute and automatically the slug
   *
   * @param string $value
   */
    public function setNameAttribute($value)
    {
        $this->attributes['name'] = $value;
        $this->setUniqueSlug($value, $this->id);
    }

   /**
   * Recursive routine to set a unique slug
   *
   * @param string $title
   * @param mixed $extra
   */
    protected function setUniqueSlug($name, $id)
    {
          $slug = str_slug($name);

          if (static::where('id', '!=', $id)->whereSlug($slug)->exists()) {
                $slug = str_slug($name.'-'.$id);
                $this->attributes['slug'] = $slug;
          }else{
                $this->attributes['slug'] = $slug;
          }
    }

    public function setImagesAttribute($images)
    {
        if (is_array($images)) {
            $this->attributes['images'] = json_encode($images);
        }
    }

    public function getImagesAttribute($images)
    {
        return json_decode($images, true);
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class);
    }

    public function amenities()
    {
        return $this->belongsToMany(Amenity::class);
    }

    public function occasions()
    {
        return $this->belongsToMany(Occasion::class);
    }

    public function division(){
        return $this->belongsTo(Division::class);
    }

    public function district(){
        return $this->belongsTo(District::class);
    }

    public function city(){
        return $this->belongsTo(City::class);
    }

    public static function priceType(){
        return [
            ''=>'--Select Price Type',
            'per-day'=>'Per Day',
            'per-night'=>'Per Night',
            //'per-person'=>'Per Person'
        ];
    }

    public static function options(){
        $options = static::pluck('name', 'id')->toArray();
        return $options;
    }

    public function calendarDates(){
        return $this->hasMany(EventCalendar::class);
    }

    public function books(){
        return $this->hasMany(Order::class);
    }

    public function getBetweenDates($startDate, $endDate)
    {
        $dates = [];
        $startDate = strtotime($startDate);
        $endDate = strtotime($endDate);

        for ($currentDate = $startDate; $currentDate <= $endDate; $currentDate += (86400)) {
            $date = date('Y-m-d', $currentDate);
            $dates[] = $date;
        }

        return $dates;
    }

    public function availableDates(){
        $calendarsDates = [];
        $ordersDates = [];

        $calendars = EventCalendar::where('venue_id', $this->id)->where('status', 'approved')->get(['start_date', 'end_date'])->toArray();
        $orders = Order::where('venue_id', $this->id)->where('status', 'approved')->where('payment_status', 'completed')->get(['start_date', 'end_date'])->toArray();

        foreach($calendars as $value)
            $calendarsDates = array_merge($calendarsDates, $this->getBetweenDates($value['start_date'], $value['end_date']));

        foreach($orders as $value)
            $ordersDates = array_merge($ordersDates, $this->getBetweenDates($value['start_date'], $value['end_date']));

        $dates = array_unique(array_diff($calendarsDates, $ordersDates));
        sort($dates);

        return $dates;
    }

    public function scopeAvailable($query, $data)
    {
        $check_in = date('Y-m-d', strtotime($data['check_in']));
        $check_out = date('Y-m-d', strtotime($data['check_out']));

        $query->whereHas('calendarDates', function($query) use($check_in, $check_out) {
            $query->where('status', 'approved')
            ->where(function($query) use($check_in, $check_out) {
                $query->where(function($query) use($check_in, $check_out){
                    $query->whereDate('start_date', '>=', $check_in)
                        ->whereDate('start_date', '<=', $check_out);
                })->orWhere(function($query) use($check_in, $check_out){
                    $query->whereDate('end_date', '>=', $check_in)
                        ->whereDate('end_date', '<=', $check_out);
                })->orWhere(function($query) use($check_in, $check_out){
                    $query->where('start_date', '<=', $check_in)
                      ->where('end_date', '>=', $check_out);
                });
            });
        });
    }

    public function scopeBookingAvailable($query, $data)
    {
        $check_in = date('Y-m-d', strtotime($data['check_in']));
        $check_out = date('Y-m-d', strtotime($data['check_out']));
        $venue_id = $data['venue_id'];

       $query->whereHas('calendarDates', function($query) use($check_in, $check_out, $venue_id) {
               $query->where('venue_id', $venue_id)
                ->where('status', 'approved')
                ->whereBetween('start_date',[$check_in, $check_out])
                ->whereBetween('end_date',[$check_in, $check_out])
                ->orWhere(function($query) use($check_in, $check_out, $venue_id){
                    $query->where('venue_id', $venue_id)
                        ->where('status', 'approved')
                        ->where('start_date', '<=', $check_in)
                        ->where('end_date', '>=', $check_out);
                });
           })
           ->whereDoesntHave('books', function($query) use($check_in, $check_out, $venue_id) {
                $query->where('venue_id', $venue_id)
                ->where('status', 'approved')
                ->where('payment_status', 'completed')
                ->where(function($query) use($check_in, $check_out) {
                    $query->where(function($query) use($check_in, $check_out){
                        $query->whereDate('start_date', '>=', $check_in)
                            ->whereDate('start_date', '<=', $check_out);
                    })->orWhere(function($query) use($check_in, $check_out){
                        $query->whereDate('end_date', '>=', $check_in)
                            ->whereDate('end_date', '<=', $check_out);
                    });
                });
            });
    }
}
