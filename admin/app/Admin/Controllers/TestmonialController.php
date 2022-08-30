<?php

namespace App\Admin\Controllers;

use App\Models\Testmonial;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class TestmonialController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Testmonial';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Testmonial());

        $grid->column('id', __('Id'));
        $grid->column('thumbnail', __('Thumbnail'))->image(config('app.url').'/storage/', 100, 100);
        $grid->column('name', __('Name'));
        $grid->column('country_name', __('Country'));
        $grid->column('body', __('Body'));
        //$grid->column('rating', __('Rating'));
        $grid->column('created_at', __('Created at'))->display(function () {
            return date('d/F/Y h:i a', strtotime($this->created_at));
        })->sortable();
        $grid->column('updated_at', __('Updated at'))->display(function () {
            return !empty($this->updated_at) ? date('d/F/Y h:i a', strtotime($this->updated_at)) : '';
        })->sortable();

        $grid->disableExport();
        $grid->actions(function ($actions) {
            $actions->disableView();
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
        $show = new Show(Testmonial::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('thumbnail', __('Thumbnail'));
        $show->field('name', __('Name'));
        $show->field('country_name', __('Country name'));
        $show->field('body', __('Body'));
        $show->field('rating', __('Rating'));
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
        $form = new Form(new Testmonial());
        $form->image('thumbnail', __('Thumbnail'))->uniqueName()->removable();
        $form->text('name', __('Name'));
        $form->text('country_name', __('Country name'));
        $form->textarea('body', __('Body'));
        //$form->number('rating', __('Rating'))->default(5);
        $form->switch('is_enabled', __('Is enabled'));

        return $form;
    }
}
