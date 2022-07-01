<?php

namespace App\Admin\Controllers;

use App\Models\Amenity;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;

class AmenityController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Amenity';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Amenity());

        $grid->column('id', __('Id'))->sortable();
        $grid->column('name', __('Name'))->sortable();
        $grid->column('remarks', __('Remarks'));
        //$grid->column('created_by', __('Created by'));
        //$grid->column('updated_by', __('Updated by'));
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
        $show = new Show(Amenity::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('remarks', __('Remarks'));
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
        $form = new Form(new Amenity());

        $form->text('name', __('Name'));
        $form->textarea('remarks', __('Remarks'));
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
