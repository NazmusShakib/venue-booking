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
}
