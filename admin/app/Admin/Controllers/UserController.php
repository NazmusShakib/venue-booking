<?php

namespace App\Admin\Controllers;

use App\Models\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Hash;
use App\Models\Venue;
use App\Admin\Selectable\VenuesSelectable;

class UserController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'User';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'))->sortable();
        $grid->column('username', __('Username'))->sortable();
        $grid->column('email', __('Email'))->sortable();
        //$grid->column('email_verified_at', __('Email verified at'));
        //$grid->column('password', __('Password'));
        //$grid->column('remember_token', __('Remember token'));
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
        $show = new Show(User::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('username', __('Username'));
        $show->field('email', __('Email'));
        $show->field('email_verified_at', __('Email verified at'));
        $show->field('password', __('Password'));
        $show->field('remember_token', __('Remember token'));
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
        $form = new Form(new User());
        $form->text('name', __('Name'))->rules('required');
        $form->text('username')
             ->creationRules(['required', "unique:users"])
             ->updateRules(['required', "unique:users,username,{{id}}"]);
        $form->email('email')
             ->creationRules(['required', "unique:users"])
             ->updateRules(['required', "unique:users,email,{{id}}"]);

        $form->password('password', 'Password')->rules('required|confirmed|min:6')
        ->default(function ($form) {
           return $form->model()->password;
        });

        $form->password('password_confirmation', 'Confirm Password')->rules('required')
        ->default(function ($form) {
           return $form->model()->password;
        });

        $form->ignore(['password_confirmation']);
        $form->hidden('email_verified_at', __('Email Verified At'))->default(date('Y-m-d H:i:s'));

        $form->saving(function (Form $form) {
            if ($form->password && $form->model()->password != $form->password) {
                $form->password = Hash::make($form->password);
            }
        });

        $form->belongsToMany('venues', VenuesSelectable::class, __('Venues'));
        return $form;
    }
}
