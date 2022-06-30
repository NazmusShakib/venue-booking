<?php

namespace App\Admin\Controllers;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Layout\Content;
use Illuminate\Http\Request;

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
}
