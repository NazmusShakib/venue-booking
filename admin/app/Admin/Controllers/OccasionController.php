<?php

namespace App\Admin\Controllers;

use App\Models\Occasion;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;

class OccasionController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Occasion';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Occasion());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('remarks', __('Remarks'));
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
        $show = new Show(Occasion::findOrFail($id));

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
        $form = new Form(new Occasion());

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
