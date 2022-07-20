<?php

namespace App\Admin\Controllers;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Layout\Content;
use Illuminate\Http\Request;
use App\Http\Resources\EventCalendarResource;
use App\Models\EventCalendar;
use Encore\Admin\Facades\Admin;

class CalendarController extends AdminController
{
    public function calendar(Content $content){
        return $content
            ->title('Calendar')
            ->breadcrumb(
                ['text' => 'Calendar']
            )
            ->view('admin/calendar/calendar');
    }

    public function events($venue_id){
        $ec = EventCalendar::where('venue_id', $venue_id)->get();
        return EventCalendarResource::collection($ec);
    }

    public function update_event(Request $request, $id){
        $ec = EventCalendar::find($id);
        $ec->status = $request->status;
        $ec->updated_by = Admin::user()->id;
        $ec->update();

        return response()->json([
            'status' => 200,
            'message' => 'Event successfully updated.'
        ]);
    }
}
