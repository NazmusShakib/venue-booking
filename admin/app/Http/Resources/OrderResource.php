<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\Order;

class OrderResource extends JsonResource
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
            'user' => $this->user,
            'venue' => $this->venue->name,
            'category' => $this->category->name,
            'occasion' => $this->occasion->name,
            'start_date' => date('d F Y', strtotime($this->start_date)),
            'end_date' => date('d F Y', strtotime($this->end_date)),
            'name' => $this->name,
            'email' => $this->email,
            'mobile_number' => $this->mobile_number,
            'capacity' => $this->capacity,
            'total_guests' => $this->total_guests,
            'price_type' => $this->price_type,
            'net_total_price' => '৳'.round($this->net_total_price),
            'address' => $this->address,
            'status' => $this->status,
            'payment_status' => $this->payment_status,
            'receive_promotional_offers' => $this->receive_promotional_offers ? 'Yes' : 'No',
            'agree' => $this->agree ? 'Yes' : 'No',
            'created_at' => date('d-m-Y', strtotime($this->created_at)),
            'updated_at' => date('d-m-Y', strtotime($this->updated_at))
        ];
    }
}
