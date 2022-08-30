<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\Testmonial;

class TestmonialResource extends JsonResource
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
            'thumbnail' => asset(\Storage::url($this->thumbnail)),
            'name' => $this->name,
            'country_name' => $this->country_name,
            'body' => $this->body,
            'rating' => $this->rating
        ];
    }
}
