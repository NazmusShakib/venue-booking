<?php

namespace App\Http\Resources;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\Venue;

class VenueDetailsResource extends JsonResource
{
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
            foreach($this->images as $image){$images[] = asset(\Storage::url($image));}
        }

        return [
            'id' => $this->id,
            'thumbnail' => asset(\Storage::url($this->featured_image)),
            'images' => $images,
            'additional_info' => $this->additional_info,
            'description' => $this->description,
            'name' => $this->name,
            'slug' => $this->slug,
            'price' => '৳'.round($this->price),
            'price_type'=> Venue::priceType()[$this->price_type] ?? '',
            'capacity' => $this->capacity,
            'division' => $this->division->name,
            'city' => $this->city->name,
            'district' => $this->district->name,
            'categories' => CategoryResource::collection($this->categories),
            'occasions' => OccasionResource::collection($this->occasions),
            'amenities' => AmenityResource::collection($this->amenities),
            'created_at' => date('d-m-Y', strtotime($this->created_at)),
            'updated_at' => date('d-m-Y', strtotime($this->updated_at))
        ];
    }
}
