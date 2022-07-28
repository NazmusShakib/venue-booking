<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function venue(){
        return $this->belongsTo(Venue::class);
    }

    public function category(){
        return $this->belongsTo(Category::class);
    }

    public function occasion(){
        return $this->belongsTo(Occasion::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }
}
