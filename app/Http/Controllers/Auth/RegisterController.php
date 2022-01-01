<?php

namespace App\Http\Controllers\Auth;

use App\GeneralSettings;
use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\User;
use App\UserLogin;
use Carbon\Carbon;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

use App\Events\MyEvent;

use Twilio\Rest\Client;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */

    public function __construct()
    {
        $this->middleware('guest');
    }

    public function showRegistrationForm()
    {
        $data['page_title'] = "Sign Up";
        $alphabet = "abcdefghijklmnopqrstuwxyzA@BC%DE&FGHIJ#KL-MNO_PQRS!TUWXYZ0123456789";
        $pass = array(); //remember to declare $pass as an array
          $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
             for ($i = 0; $i < 10; $i++) {
                $n = rand(0, $alphaLength);
                $pass[] = $alphabet[$n];

             }

             $gen_password = implode($pass);
             $data['password'] = $gen_password;

             $data['username']=  'usr'.rand();



        return view('auth.register',$data);

    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {


        return Validator::make($data, [
            'first_name' => 'required|string|max:50',
            'last_name' => 'required|string|max:50',
            'username' => 'required|alpha_num|min:5|unique:users',
            'email' => 'required|email|max:100|unique:users',
            'phone' => 'required|unique:users',
            'password' => 'required|alpha_num|min:10',

        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        $basic = GeneralSettings::first();


        $email_verify = ($basic->email_verification == 1) ? 0 : 1;
        $phone_verify = ($basic->sms_verification == 1) ? 0 : 1;

        $verification_code = mt_rand(100000, 999999);
        $sms_code = mt_rand(100000, 999999);
        $email_time = Carbon::parse()->addMinutes(2);
        $phone_time = Carbon::parse()->addMinutes(2);
        $user_entry = strtolower(trim($data['username']));

        $user =  User::create([
            'first_name' => $data['first_name'],
            'last_name' => $data['last_name'],
            'username' => strtolower(trim($data['username'])),
            'email' => strtolower(trim($data['email'])),
            'phone' => $data['phone'],
            'country' => $data['country'],
            'email_verify' => $email_verify,
            'verification_code' => $verification_code,
            'sms_code' => $sms_code,
            'email_time' => $email_time,
            'phone_verify' => $phone_verify,
            'phone_time' => $phone_time,
            'password' => Hash::make($data['password']),
        ]);

        //$this->guard()->login($user);

        //return redirect($this->redirectPath());

		return $user;

    }


    protected function registered(Request $request, $user)
    {
        $basic = GeneralSettings::first();

        if ($basic->email_verification == 1) {
            $email_code = mt_rand(100000, 999999);
            $text = "Your Verification Code: <b>$email_code</b>";
            send_email_verification($user->email, $user->name, 'Email verification', $text);
            $user->verification_code = $email_code;
            $user->email_time = Carbon::parse()->addMinutes(2);
            $user->save();
        }

        if ($basic->sms_verification == 1) {
            $sms_code = mt_rand(100000, 999999);
            $txt = "Your phone verification code: $sms_code";
            $to = $user->phone;
            send_sms_verification($to, $txt);
            $user->sms_code = $sms_code;
            $user->phone_time = Carbon::parse()->addMinutes(2);
            $user->save();
        }



         $info = json_decode(json_encode(getIpInfo()), true);
        $ul['user_id'] = $user->id;
        $ul['user_ip'] =  request()->ip();
        $ul['long'] =  @implode(',',$info['long']);
        $ul['lat'] =  @implode(',',$info['lat']);
        $ul['location'] =  @implode(',',$info['city']) . (" - ". @implode(',',$info['area']) ."- ") . @implode(',',$info['country']) . (" - ". @implode(',',$info['code']) . " ");
        $ul['country_code'] = @implode(',',$info['code']);
        $ul['browser'] = $info['browser'];
        $ul['os'] = $info['os_platform'];
        $ul['country'] =  @implode(',', $info['country']);

       UserLogin::create($ul);


       //return redirect(route('home'));

    }
}
