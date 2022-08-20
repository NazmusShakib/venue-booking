<?php
namespace App\Admin\Selectable;

use App\Models\Venue;
use Encore\Admin\Grid\Filter;
use Encore\Admin\Grid\Selectable;

class VenuesSelectable extends Selectable
{
    public $model = Venue::class;

    public function make()
    {
        $this->column('featured_image', __('Featured Image'))->image(config('app.url').'/storage/', 80, 80);
        $this->column('organization.name', __('Organization'));
        $this->column('name', __('Name'))->sortable();
        $this->column('division.name', __('Division'));
        //$this->column('district.name', __('District'));
        //$this->column('city.name', __('City'));
        $this->column('is_enabled', __('Enabled?'))->replace([0 => 'No', 1 => 'Yes'])->label();
        $this->column('created_at', __('Created At'))->display(function () {
            return !empty($this->created_at) ? date('d/F/Y h:i a', strtotime($this->created_at)) : '';
        })->sortable();

        $this->filter(function (Filter $filter) {
            $filter->disableIdFilter();
            $filter->like('name');
        });
    }
}
