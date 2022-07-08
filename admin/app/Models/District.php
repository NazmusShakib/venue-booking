<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class District extends Model
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

    public function division(){
        return $this->belongsTo(Division::class);
    }

    public function cities(){
        return $this->hasMany(City::class);
    }
}
