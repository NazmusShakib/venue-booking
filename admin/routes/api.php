<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ApiController;

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::get('/cities', [ApiController::class, 'cities']);
Route::get('/categories', [ApiController::class, 'categories']);
Route::get('/amenities', [ApiController::class, 'amenities']);
Route::get('/occasions', [ApiController::class, 'occasions']);
Route::post('/venues/{category?}', [ApiController::class, 'venues']);
Route::get('/venue/details/{slug}', [ApiController::class, 'venue_details']);
Route::post('/venues/lists/for/dropdown', [ApiController::class, 'venues_lists_for_dropdown']);
Route::post('/city/lists/for/dropdown', [ApiController::class, 'city_lists_for_dropdown']);
Route::post('/category/lists/for/dropdown', [ApiController::class, 'category_lists_for_dropdown']);
Route::post('/occasion/lists/for/dropdown', [ApiController::class, 'occasion_lists_for_dropdown']);
Route::post('/booking/availability/checking', [ApiController::class, 'booking_availability_checking']);
Route::get('/popular/venues', [ApiController::class, 'popular_venues']);
Route::get('/top/visited/venues', [ApiController::class, 'top_visited_venues']);

Route::middleware('auth:sanctum')->group(function() {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::post('/event/store', [ApiController::class, 'event_store']);
    Route::get('/events/{venue_id}', [ApiController::class, 'events']);
    Route::get('/delete/event/{id}', [ApiController::class, 'delete_event']);
    Route::post('/order/store', [ApiController::class, 'order_store']);
    Route::get('/orders/{user_id}', [ApiController::class, 'orders']);
});
