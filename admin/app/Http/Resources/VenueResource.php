<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\Venue;

class VenueResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'organization' => $this->organization->name,
            'thumbnail' => asset(\Storage::url($this->featured_image)),
            'name' => $this->name,
            'slug' => $this->slug,
            'price' => '৳'.round($this->price),
            'price_type'=> Venue::priceType()[$this->price_type] ?? '',
            'capacity' => $this->capacity,
            'division' => $this->division->name,
            'district' => $this->district->name,
            'city' => $this->city->name,
            'is_enabled' => $this->is_enabled == 1 ? 'Yes' : 'No',
            'created_at' => date('d-m-Y', strtotime($this->created_at)),
            'updated_at' => date('d-m-Y', strtotime($this->updated_at))
        ];
    }
}
