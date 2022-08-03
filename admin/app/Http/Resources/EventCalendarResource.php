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
            'createdBy' => $this->createdBy->name,
            'updatedBy' => $this->updatedBy->name ?? '',
            'description' => $this->description,
            'allDay' => $this->all_day_event,
            'status' => $this->status,
            'feedback' => $this->feedback,
            'color'=> $this->status == 'approved' ? 'green' : '#00b2ff'
        ];
    }
}
