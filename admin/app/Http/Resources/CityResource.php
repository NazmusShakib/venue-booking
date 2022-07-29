<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\City;

class CityResource extends JsonResource
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
            //'id' => $this->id,
            'name' => $this->name,
            'slug' => $this->slug,
            //'created_at' => date('d-m-Y', strtotime($this->created_at)),
            //'updated_at' => date('d-m-Y', strtotime($this->updated_at))
        ];
    }
}
