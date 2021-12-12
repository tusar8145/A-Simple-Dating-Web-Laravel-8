<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\homeController;
use App\Http\Controllers\mutualsController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::middleware(['auth:sanctum', 'verified'])
->get('/dashboard', [homeController::class, 'index'])
->name('home');

Route::middleware(['auth:sanctum', 'verified'])
->get('/home', [homeController::class, 'index'])
->name('home');

 Route::middleware(['auth:sanctum', 'verified'])
->get('/mutuals', [homeController::class, 'mutuals'])
->name('mutuals'); 


Route::middleware(['auth:sanctum', 'verified'])
->any('/get_users/{idvalue}', [homeController::class, 'get_users'])
->name('get_users'); 

Route::middleware(['auth:sanctum', 'verified'])
->any('/test_distance', [homeController::class, 'test_distance'])
->name('test_distance'); 
 

Route::middleware(['auth:sanctum', 'verified'])
->any('/set_likes/{idvalue}', [homeController::class, 'set_likes'])
->name('set_likes'); 

Route::middleware(['auth:sanctum', 'verified'])
->any('/ready_chat/{idvalue}', [homeController::class, 'ready_chat'])
->name('ready_chat');

Route::middleware(['auth:sanctum', 'verified'])
->any('/store_chat/{idvalue}', [homeController::class, 'store_chat'])
->name('store_chat');

Route::middleware(['auth:sanctum', 'verified'])
->any('/response_chat/{idvalue}', [homeController::class, 'response_chat'])
->name('response_chat');

 
Route::get('/api', function () {
    return ('welcome');
});



