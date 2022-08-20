<?php

namespace App\Admin\Controllers;

use App\Models\Organization;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;

class OrganizationController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Organization';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Organization());

        $grid->column('id', __('ID'));
        $grid->column('name', __('Name'))->sortable();
        $grid->column('email', __('Email'));
        $grid->column('contact_name', __('Contact name'))->sortable();
        $grid->column('contact_number', __('Contact number'));
        $grid->column('address', __('Address'));
        $grid->column('multiple_properties', __('Multiple Properties'))->replace([0 => 'No', 1 => 'Yes'])->label();
        $grid->column('creator', __('Creator'))->display(function () {
            if($this->creator_type === 'AdminUser'){
                return '<span class="label label-success">'.$this->creator.'</span>';
            }else{
                return '<span class="label label-warning">'.$this->creator.'</span>';
            }
        });
        $grid->column('created_at', __('Created at'))->display(function () {
            return date('d/F/Y h:i a', strtotime($this->created_at));
        });
        $grid->column('updated_at', __('Updated at'))->display(function () {
            return !empty($this->updated_at) ? date('d/F/Y h:i a', strtotime($this->updated_at)) : '';
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
        $show = new Show(Organization::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('slug', __('Slug'));
        $show->field('email', __('Email'));
        $show->field('description', __('Description'));
        $show->field('contact_name', __('Contact name'));
        $show->field('contact_number', __('Contact number'));
        $show->field('address', __('Address'));
        $show->field('multiple_properties', __('Multiple Properties'))->replace([0 => 'No', 1 => 'Yes'])->label();
        $show->field('creator', __('Creator'))->display(function () {
            if($this->creator_type === 'AdminUser'){
                return '<span class="label label-success">'.$this->creator.'</span>';
            }else{
                return '<span class="label label-warning">'.$this->creator.'</span>';
            }
        });
        $show->field('created_at', __('Created at'))->display(function () {
            return date('d/F/Y h:i a', strtotime($this->created_at));
        });
        $show->field('updated_at', __('Updated at'))->display(function () {
            return !empty($this->updated_at) ? date('d/F/Y h:i a', strtotime($this->updated_at)) : '';
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
        $form = new Form(new Organization());

        $form->text('name', __('Name'));
        $form->email('email', __('Email'));
        $form->textarea('description', __('Description'));
        $form->text('contact_name', __('Contact name'));
        $form->text('contact_number', __('Contact number'));
        $form->textarea('address', __('Address'));
        $form->switch('multiple_properties', __('Multiple properties'));

        if($form->isCreating())
        {
            $form->hidden('creator_type', __('Creator Type'))->default('AdminUser');
            $form->hidden('created_by', __('Created by'))->default(Admin::user()->id);
        }

        if($form->isEditing())
        {
            $form->hidden('updater_type', __('Updater Type'))->default('AdminUser');
            $form->hidden('updated_by', __('Updated by'))->default(Admin::user()->id);
        }

        return $form;
    }
}
