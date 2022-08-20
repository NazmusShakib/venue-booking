<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Organization extends Model
{
    use HasFactory;

    protected $appends = ['creator', 'updater'];

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

    public function adminCreator()
    {
        return $this->belongsTo(AdminUser::class, 'created_by', 'id');
    }

    public function userCreator()
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }

    public function getCreatorAttribute()
    {
        if($this->creator_type === 'AdminUser'){
            return $this->adminCreator->username;
        }elseif($this->creator_type === 'User'){
            return $this->userCreator->name;
        }
    }

    public function adminUpdater()
    {
        return $this->belongsTo(AdminUser::class, 'updated_by', 'id');
    }

    public function userUpdater()
    {
        return $this->belongsTo(User::class, 'updated_by', 'id');
    }

    public function getUpdaterAttribute()
    {
        if($this->updater_type === 'AdminUser'){
            return $this->adminUpdater->username;
        }elseif($this->updater_type === 'User'){
            return $this->userUpdater->name;
        }
    }

    public static function options(){
        $options = static::pluck('name', 'id')->toArray();
        return $options;
    }
}
