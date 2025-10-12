<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Charts\FlylineChartController;

Route::get('/', function () {
    return view('welcome');
});
