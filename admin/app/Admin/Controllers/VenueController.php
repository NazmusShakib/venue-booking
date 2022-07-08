<?php

namespace App\Admin\Controllers;

use App\Models\Venue;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;
use App\Models\Division;
use App\Models\District;
use App\Models\City;
use App\Models\Category;
use App\Models\Occasion;
use App\Models\Amenity;

class VenueController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Venue';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Venue());

        $grid->column('id', __('Id'))->sortable();
        $grid->column('featured_image', __('Featured Image'))->image(config('app.url').'/storage/', 100, 100);
        $grid->column('name', __('Name'))->sortable();
        //$grid->column('slug', __('Slug'));
        //$grid->column('description', __('Description'));
        //$grid->column('additional_info', __('Additional info'));
        //$grid->column('category_id', __('Category id'));
        //$grid->column('occasion_id', __('Occasion id'));
        //$grid->column('amenity_id', __('Amenity id'));
        $grid->column('division.name', __('Division'));
        $grid->column('district.name', __('District'));
        $grid->column('city.name', __('City'));
        $grid->column('is_enabled', __('Enabled?'))->replace([0 => 'No', 1 => 'Yes'])->label();
        //$grid->column('created_by', __('Created by'));
        //$grid->column('updated_by', __('Updated by'));
        $grid->column('created_at', __('Created at'))->display(function () {
            return date('d/F/Y h:i a', strtotime($this->created_at));
        })->sortable();
        $grid->column('updated_at', __('Updated at'))->display(function () {
            return !empty($this->updated_at) ? date('d/F/Y h:i a', strtotime($this->updated_at)) : '';
        })->sortable();

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Venue::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('featured_image', __('Featured image'));
        $show->field('name', __('Name'));
        $show->field('slug', __('Slug'));
        $show->field('description', __('Description'));
        $show->field('additional_info', __('Additional info'));
        $show->field('category_id', __('Category id'));
        $show->field('occasion_id', __('Occasion id'));
        $show->field('amenity_id', __('Amenity id'));
        $show->field('division_id', __('Division id'));
        $show->field('district_id', __('District id'));
        $show->field('city_id', __('City id'));
        $show->field('is_enabled', __('Is enabled'));
        //$show->field('created_by', __('Created by'));
        //$show->field('updated_by', __('Updated by'));
        $grid->column('created_at', __('Created at'))->display(function () {
            return date('d/F/Y h:i a', strtotime($this->created_at));
        })->sortable();
        $grid->column('updated_at', __('Updated at'))->display(function () {
            return !empty($this->updated_at) ? date('d/F/Y h:i a', strtotime($this->updated_at)) : '';
        })->sortable();

        $grid->filter(function($filter){
            // Remove the default id filter
            $filter->disableIdFilter();
            // Add a column filter
            $filter->like('name', 'name');
        });

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Venue());

        $form->image('featured_image', __('Featured image'))->uniqueName()->removable();
        $form->multipleImage('images')->uniqueName()->removable();
        $form->text('name', __('Name'));
        $form->quill('description');
        //$form->textarea('description', __('Description'));
        //$form->textarea('additional_info', __('Additional info'));
        $form->multipleSelect('categories','Category')->options(Category::all()->pluck('name','id'));
        $form->multipleSelect('occasions','Occasion')->options(Occasion::all()->pluck('name','id'));
        $form->multipleSelect('amenities','Amenity')->options(Amenity::all()->pluck('name','id'));
        $form->select('price_type', __('Price Type'))->options(function () {
            return Venue::priceType();
        });
        $form->number('price', 'Price')->min(0);
        $form->number('capacity', __('Capacity'))->min(0);
        $form->select('division_id', __('Division'))->options(function () {
            return Division::pluck('name', 'id');
        })->load('district_id', '/admin/load-api/districts');
        $form->select('district_id', __('District'))->options(function ($divisionId) {
            return District::where('division_id', $divisionId)->pluck('name', 'id');
        })->load('city_id', '/admin/load-api/cities');
        $form->select('city_id', __('City'))->options(function ($district_id) {
            return City::where('district_id', $district_id)->pluck('name', 'id');
        });
        $form->switch('is_enabled', __('Is enabled'));

        if($form->isCreating())
        {
            $form->hidden('created_by', __('Created by'))->default(Admin::user()->id);
        }

        if($form->isEditing())
        {
            $form->hidden('updated_by', __('Updated by'))->default(Admin::user()->id);
        }

        return $form;
    }
}
