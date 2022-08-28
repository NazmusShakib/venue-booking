<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Storage;
use App\Models\Category;
use App\Models\Amenity;
use App\Models\Occasion;
use App\Models\Division;
use App\Models\District;
use App\Models\City;
use App\Models\Venue;
use App\Models\Organization;
use App\Models\User;

class VenueEditResource extends JsonResource
{
    /**
         * @var
         */
        private $requested_user_id;

        /**
         * Create a new resource instance.
         *
         * @param  mixed  $resource
         * @return void
         */
        public function __construct($resource, $requested_user_id)
        {
            // Ensure you call the parent constructor
            parent::__construct($resource);
            $this->resource = $resource;
            $this->requested_user_id = $requested_user_id;
        }

    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $images = [];
        if(!empty($this->images))
        {
            foreach($this->images as $key => $image)
            {
                $images[] = ['server_key'=>$image, 'data_url'=>asset(Storage::url($image))];
            }
        }

        return [
           'featured_image'        =>  [0=>['server_key'=>$this->featured_image, 'data_url'=>asset(Storage::url($this->featured_image))]],
           'venue_images'          =>  $images,
           'price_type'            =>  $this->price_type,
           'price'                 =>  $this->price,
           'capacity'              =>  $this->capacity,
           'name'                  =>  $this->name,
           'star_rating'           =>  $this->star_rating,
           'description'           =>  $this->description,
           'address'               =>  $this->address,
           'organizationLists'     =>  User::find($this->requested_user_id)->organizations()->get(['organizations.id as value', 'organizations.name as label'])->makeHidden(['creator','updater','pivot'])->toArray(),
           'organization_id'               => $this->organization_id,
           'selected_organization_option'  =>  Organization::where('id', $this->organization_id)->get(['id as value', 'name as label'])->makeHidden(['creator','updater'])->toArray(),
           'categoryLists'                 => Category::select("id as value", "name as label")->get()->toArray(),
           'categories_id'             => $this->categories->pluck('id')->toArray(),
           'selected_category_option'  => $this->categories()->get(['categories.id as value', 'categories.name as label'])->makeHidden(['creator','updater','pivot'])->toArray(),
           'occasionLists'     => Occasion::select("id as value", "name as label")->get()->toArray(),
           'occasions_id'     => $this->occasions->pluck('id')->toArray(),
           'selected_occasion_option' => $this->occasions()->get(['occasions.id as value', 'occasions.name as label'])->makeHidden(['creator','updater','pivot'])->toArray(),
           'amenityLists'     => Amenity::select("id as value", "name as label")->get()->toArray(),
           'amenities_id'     => $this->amenities->pluck('id')->toArray(),
           'selected_amenity_option' => $this->amenities()->get(['amenities.id as value', 'amenities.name as label'])->makeHidden(['creator','updater','pivot'])->toArray(),
           'divisionLists'     => Division::select("id as value", "name as label")->get()->toArray(),
           'division_id'     => $this->division_id,
           'selected_division_option' => Division::where('id', $this->division_id)->get(['id as value', 'name as label'])->toArray(),
           'districtLists'     => District::where('division_id', $this->division_id)->select("id as value", "name as label")->get()->toArray(),
           'district_id'     => $this->district_id,
           'selected_district_option' => District::where('id', $this->district_id)->get(['id as value', 'name as label'])->toArray(),
           'cityLists'     => City::where('district_id', $this->district_id)->select("id as value", "name as label")->get()->toArray(),
           'city_id'     => $this->city_id,
           'selected_city_option' => City::where('id', $this->city_id)->get(['id as value', 'name as label'])->toArray(),
           'selected_price_type_option'  =>  ['label'   =>  Venue::priceType()[$this->price_type], 'value'   => $this->price_type],
        ];
    }
}
