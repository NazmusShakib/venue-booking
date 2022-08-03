<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EventCalendar extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $guarded = [];

    public function createdBy(){
        return $this->belongsTo(User::class, 'created_by', 'id');
    }

    public function updatedBy(){
        return $this->belongsTo(AdminUser::class, 'updated_by', 'id');
    }

    public function scopeEventExists($query, $data)
    {
        $start_date = date('Y-m-d', strtotime($data['start_date']));
        $end_date = date('Y-m-d', strtotime($data['end_date']));
        $venue_id = $data['venue_id'];

        $query->where('venue_id', $venue_id)
            ->whereBetween('start_date',[$start_date, $end_date])
            ->whereBetween('end_date',[$start_date, $end_date])
            ->orWhere(function($query) use($start_date, $end_date, $venue_id){
                $query->where('venue_id', $venue_id)
                ->where('start_date', '<=', $start_date)
                ->where('end_date', '>=', $end_date);
        });
    }
}
