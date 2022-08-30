<?php

namespace App\Admin\Controllers;

use App\Models\Inbox;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class InboxController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Inbox';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Inbox());

        $grid->column('id', __('ID'));
        $grid->column('name', __('Name'));
        $grid->column('email', __('Email'));
        $grid->column('subject', __('Subject'));
        $grid->column('message', __('Message'));
        $grid->column('created_at', __('Created at'))->display(function () {
            return date('d/F/Y h:i a', strtotime($this->created_at));
        });
        //$grid->column('updated_at', __('Updated at'))->display(function () {
            //return date('d/F/Y h:i a', strtotime($this->updated_at));
        //});

        $grid->disableExport();
        $grid->disableCreateButton();
        $grid->actions(function ($actions) {
            $actions->disableEdit();
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
        $show = new Show(Inbox::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('email', __('Email'));
        $show->field('subject', __('Subject'));
        $show->field('message', __('Message'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        $show->panel()
        ->tools(function ($tools) {
            $tools->disableEdit();
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
        $form = new Form(new Inbox());

        $form->text('name', __('Name'));
        $form->email('email', __('Email'));
        $form->text('subject', __('Subject'));
        $form->textarea('message', __('Message'));

        return $form;
    }
}
