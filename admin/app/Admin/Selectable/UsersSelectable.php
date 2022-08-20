<?php
namespace App\Admin\Selectable;

use App\Models\User;
use Encore\Admin\Grid\Filter;
use Encore\Admin\Grid\Selectable;

class UsersSelectable extends Selectable
{
    public $model = User::class;

    public function make()
    {
        $this->column('name', __('Name'))->sortable();
        $this->column('username', __('Username'))->sortable();
        $this->column('email', __('E-mail Address'));
        $this->column('created_at', __('Created At'))->display(function () {
            return !empty($this->created_at) ? date('d/F/Y h:i a', strtotime($this->created_at)) : '';
        })->sortable();

        $this->filter(function (Filter $filter) {
            $filter->disableIdFilter();
            $filter->like('name');
        });
    }
}
