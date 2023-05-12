<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUser;
use Laravel\Sanctum\Sanctum;

class LoginController extends Controller
{
    protected function loginApi(Request $request)
    {
        $loginData = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if(Auth::attempt($loginData)){
            $token = Auth::user()->createToken('authToken')->plainTextToken;
            return response()->json([
                'data' => Auth::user(),
                'token' => $token,
            ], 200);
        }
        return response()->json([
            'message' => 'invalid Credential'
        ], 401);
    }
}
