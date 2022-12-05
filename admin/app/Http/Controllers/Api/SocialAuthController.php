<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use GuzzleHttp\Exception\ClientException;
use Laravel\Socialite\Facades\Socialite;
use Validator;
use Hash;
use App\Models\User;
use App\Models\LinkedSocialAccount;

class SocialAuthController extends Controller
{
    /**
     * Which app supported for social login.
     *
     * @var string
     */
    protected $providers = ['google', 'facebook', 'instagram'];

    /**
     * Check Supported Social App.
     *
     * @var array
     */
    private function isProviderAllowed($provider)
    {
        return in_array($provider, $this->providers) && config()->has("services.{$provider}");
    }

    /**
     * Social Auth Failed Response.
     *
     * @var string
     */
     protected function sendFailedResponse($msg = null)
    {
        return response()->json(['error' => $msg ?: 'Unable to login, try with another provider to login.']);
    }

    /**
     * Redirect the user to the GitHub authentication page.
     *
     * @return \Illuminate\Http\Response
     */
    public function redirectToAuthProvider($provider)
    {
        if( ! $this->isProviderAllowed($provider) ) {
            return $this->sendFailedResponse("{$provider} is not currently supported");
        }

        try {
            return response()->json([
                'url' => Socialite::driver($provider)
                             ->stateless()
                             ->redirect()
                             ->getTargetUrl(),
            ]);
        } catch (Exception $e) {
            // You should show something simple fail message
            return $this->sendFailedResponse($e->getMessage());
        }
    }

    /**
     * Obtain the user information from GitHub.
     *
     * @return \Illuminate\Http\Response
     */
    public function handleAuthProviderCallback($provider)
    {
        try {
            $response = Socialite::driver($provider)->stateless()->user();
        } catch (ClientException $e) {
            return $this->sendFailedResponse($e->getMessage());
        }

        $social = LinkedSocialAccount::where('provider', $provider)->where('provider_id', $response->getId())->first();

        if (!empty($user)){
            $user = $social->user;
        }else{
            $user = new User;
            $user->name = $response->getName();
            $user->username = empty(User::where('username', $response->getEmail())->first()) ? $response->getEmail() : NULL;
            $user->email = empty(User::where('email', $response->getEmail())->first()) ? $response->getEmail() : NULL;
            $user->password = Hash::make($response->getId());
            $user->email_verified_at = date('Y-m-d H:i:s');
            $user->has_socials_auth = true;
            $user->type = 'Customer';
            $user->save();

            $social = new LinkedSocialAccount;
            $social->user_id = $user->id;
            $social->email = $response->getEmail();
            $social->provider = $provider;
            $social->provider_id = $response->getId();
            $social->save();
        }

        $res = [
            'user_id' => $user->id,
            'name' => $user->name,
            'username' => $user->username,
            'email' => $user->email,
            'type' => $user->type,
            'token' => $user->createToken($user->email.'_Token')->plainTextToken
        ];

        return response()->json([
            'status' => 200,
            'user' => $res,
            'message' => 'Sign In successfully completed!.'
        ]);
    }
}
