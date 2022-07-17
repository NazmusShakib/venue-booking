<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class EventCalendarResource extends JsonResource
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
            'title' => $this->title,
            'start' => date('Y-m-d', strtotime($this->start_date)),
            'end' => date('Y-m-d', strtotime($this->end_date)),
            //'user_id' => $this->created_by,
            'description' => $this->description,
            'allDay' => $this->all_day_event,
            'status' => $this->status == 0 ? 'pending' : 'Approved',
            //'feedback' => $this->feedback,
        ];
    }
}
