<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {
    $router->get('/', 'HomeController@index')->name('home');
    $router->get('/calendar', 'CalendarController@calendar')->name('calendar');
    $router->resource('categories', CategoryController::class);
    $router->resource('amenities', AmenityController::class);
    $router->resource('cities', CityController::class);
    $router->resource('districts', DistrictController::class);
    $router->resource('divisions', DivisionController::class);
    $router->resource('occasions', OccasionController::class);
    $router->resource('venues', VenueController::class);
});
