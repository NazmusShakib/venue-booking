<?php

namespace App\Admin\Controllers;

use App\Models\Venue;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;

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

        $grid->column('id', __('Id'));
        $grid->column('featured_image', __('Featured image'));
        $grid->column('name', __('Name'));
        //$grid->column('slug', __('Slug'));
        //$grid->column('description', __('Description'));
        //$grid->column('additional_info', __('Additional info'));
        $grid->column('category_id', __('Category id'));
        $grid->column('occasion_id', __('Occasion id'));
        $grid->column('amenity_id', __('Amenity id'));
        $grid->column('division_id', __('Division id'));
        $grid->column('district_id', __('District id'));
        $grid->column('city_id', __('City id'));
        $grid->column('is_enabled', __('Is enabled'));
        //$grid->column('created_by', __('Created by'));
        //$grid->column('updated_by', __('Updated by'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

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
        $show->field('created_by', __('Created by'));
        $show->field('updated_by', __('Updated by'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

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

        $form->text('featured_image', __('Featured image'));
        $form->text('name', __('Name'));
        $form->text('slug', __('Slug'));
        $form->textarea('description', __('Description'));
        $form->textarea('additional_info', __('Additional info'));
        $form->number('category_id', __('Category id'));
        $form->number('occasion_id', __('Occasion id'));
        $form->number('amenity_id', __('Amenity id'));
        $form->number('division_id', __('Division id'));
        $form->number('district_id', __('District id'));
        $form->number('city_id', __('City id'));
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
