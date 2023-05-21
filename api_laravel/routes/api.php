<?php

use App\Http\Controllers\API\MahasiswaController;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\API\BukuController;
use App\Models\Mahasiswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
// */
// Route::get('mahasiswa',[MahasiswaControlleroller::class,'index'])->middleware('auth:sanctum');


// Route::get('mahasiswa/show/{id}',[MahasiswaController::class,'show']);
// Route::post('mahasiswa/store',[MahasiswaController::class,'store']);
// Route::post('mahasiswa/update/{id}',[MahasiswaController::class,'update']);
// Route::get('mahasiswa/destroy/{id}',[MahasiswaController::class,'destroy']);
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::post('auth/login',[AuthController::class, 'login'])->name('login');
Route::post('auth/register',[AuthController::class, 'register']);
Route::get('auth/me',[AuthController::class, 'me'])->middleware('auth:sanctum');
Route::get('auth/logout',[AuthController::class, 'logout'])->middleware('auth:sanctum');
Route::post('buku/store',[BukuController::class, 'storeBook']);
Route::get('buku',[BukuController::class, 'show']);


