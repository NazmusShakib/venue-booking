<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Hash;
use App\Models\user;

class AuthController extends Controller
{
    public function register(Request $request){
        $validation = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8'],
            'confirm_password' => ['required', 'string', 'min:8', 'same:password'],
            'username' => [
                'required', 'string', 'min:3', 'max:20', 'unique:users',
                function ($attribute, $value, $fail) {
                    $words = ['username', '_username', 'username_', 'user_name', 'User_name', 'Username', 'Username_', '_Username', 'User_Name', 'user_Name'];
                    foreach($words as $word){
                        if (strpos($value, $word) !== false){
                            $fail('The '.$attribute.' is invalid.');
                        }
                    }
                    
                    if(substr($value,0,1) == '_'){
                        $fail('The username cannot contain underscores at the beginning or end.');
                    }
                    
                    if(substr($value, -1) == '_'){
                        $fail('The username cannot contain underscores at the beginning or end.');
                    }
                },
                'regex:/^[A-Za-z0-9]+(?:[_][A-Za-z0-9]+)*$/',
            ]
        ]);

        if ($validation->fails()) {
            return response()->json([
                'status' => 400,
                'message' => 'Registration failed!.',
                'errors' => $validation->messages()
            ]);
        } else {
            $user = User::create([
                'name' => $request->name,
                'username' => $request->username,
                'email' => $request->email,
                'password' => Hash::make($request->password),
            ]);

            $token = $user->createToken($user->email.'_Token')->plainTextToken;

            $res = [
                'name' => $user->name,
                'username' => $user->username,
                'email' => $user->email,
                'token' => $token
            ];

            return response()->json([
                'status' => 200,
                'user' => $res,
                'message' => 'Registration successfully completed!.'
            ]);
        }
        
    }

    public function login(Request $request){
        $validation = Validator::make($request->all(), [
            'email' => ['required', 'string', 'email', 'max:255'],
            'password' => ['required', 'string', 'min:8'],
        ]);

        if ($validation->fails()) {
            return response()->json([
                'status' => 400,
                'message' => 'Login failed!.',
                'errors' => $validation->messages()
            ]);
        }else{

            $user = User::where('email', $request->email)->first();
 
            if (! $user || ! Hash::check($request->password, $user->password)) {
                return response()->json([
                    'status' => 401,
                    'message' => 'The provided credentials are incorrect.',
                ]);
            }

            $token = $user->createToken($user->email.'_Token')->plainTextToken;

            $res = [
                'name' => $user->name,
                'username' => $user->username,
                'email' => $user->email,
                'token' => $token
            ];

            return response()->json([
                'status' => 200,
                'user' => $res,
                'message' => 'Logged In Successful!.'
            ]);
        }
    }

    public function logout(Request $request){
        auth()->user()->tokens()->delete();
        return response()->json([
            'status' => 200,
            'message' => 'Logged out Successfully!.'
        ]);
    }
}
