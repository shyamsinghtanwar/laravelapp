<?php

namespace App\Http\Controllers\Admin;

use DB;
use App\Web_user_match;
use App\Deposit;
use App\BetInvest;
use App\BetOption;
use App\BetQuestion;
use App\GeneralSettings;
use App\Http\Controllers\Controller;
use App\Match;

use App\Trx;
use App\Events;

use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

use App\Event;
use Illuminate\Support\Facades\Auth;

use Pusher\Pusher;
use Twilio\Rest\Client;

class ProphecyManageController extends Controller
{

    public function tournament()
    {
        $data['page_title'] = 'Application Manage';
        $data['events'] = Event::latest()->get();
        return view('admin.tournament.index', $data);
    }

    public function updateTournament(Request $request)
    {
        $macCount = Event::where('name', $request->name)->where('id', '!=', $request->id)->count();
        if ($macCount > 0) {
            session()->flash('danger', 'Event Already Exist');
            return back();
        }

        if ($request->id == 0) {
            $data['name'] = $request->name;
            $data['websitename'] = $request->websitename;
            $data['url'] = $request->websiteurl;
            $data['event'] = $request->event;
            $data['slug'] = str_slug($request->name);

            //images
            $files=$request->file('website_image');
            $file_name=$files->getClientOriginalName();
            $files->move('public/images/website_images/',$file_name);
            $data['images']='public/images/website_images/'.$file_name;

            //discount
            $data['special'] = $request->discount;
            $data['status'] = $request->status;
            $res = Event::create($data);
            if ($res) {
                session()->flash('success', 'Added Successfully!');
            } else {
                session()->flash('danger', 'Problem With Adding New Event');
            }

            return back();

        } else {
            $mac = Event::findOrFail($request->id);
            $mac['name'] = $request->name;
            $mac['slug'] = str_slug($request->name);
            $mac['status'] = $request->status;
            $res = $mac->update();

            if ($res) {
                session()->flash('success', 'Tournament Updated Successfully!');
            } else {
                session()->flash('danger', 'Problem With Updating Tournament');
            }

            return back();
        }
    }


    public function matches()
    {
        $data['page_title'] = 'Update Amount';
        $data['matches'] =  DB::table('web_user_match')
        ->select(DB::raw('web_user_match.id, web_user_match.user_id , web_user_match.website_id ,web_user_match.website_user_name ,web_user_match.website_user_password ,web_user_match.amount ,  users.username, events.url'))
        ->join('users', 'users.id', '=', 'web_user_match.user_id')
        ->join('events','events.id','=','web_user_match.website_id')
        ->get();
        //$data['matches'] = Match::with('event')->where('status', '!=', 2)->orderBy('start_date', 'asc')->paginate(25);
        return view('admin.event.index', $data);
    }


    public function websitewithdraw()
    {
        $data['page_title'] = 'Money Withdrawal from Website';
        $data['matches'] =  DB::table('web_user_match')
        ->select(DB::raw('web_user_match.id, web_user_match.user_id , web_user_match.website_id ,web_user_match.website_user_name ,web_user_match.website_user_password ,web_user_match.amount ,  users.username, events.url'))
        ->join('users', 'users.id', '=', 'web_user_match.user_id')
        ->join('events','events.id','=','web_user_match.website_id')
        ->where('web_user_match.website_user_name', 'Withdraw_Request')
        ->where('web_user_match.website_user_password', 'Withdraw_Request')
        ->where('web_user_match.status',0)
        ->where('web_user_match.amount','>',0)
        ->get();

        //$data['matches'] = Match::with('event')->where('status', '!=', 2)->orderBy('start_date', 'asc')->paginate(25);
        return view('admin.event.withdraw', $data);
    }


    public function closeMatches()
    {
        $data['page_title'] = 'User Name Matched with Website';
        $data['matches'] =  DB::table('web_user_match')
        ->select(DB::raw('web_user_match.id, web_user_match.user_id , web_user_match.website_id ,web_user_match.website_user_name ,web_user_match.website_user_password ,web_user_match.amount ,  users.username, events.url'))
        ->join('users', 'users.id', '=', 'web_user_match.user_id')
        ->join('events','events.id','=','web_user_match.website_id')
        ->where('web_user_match.status',0)
        ->where('web_user_match.website_user_name','Null')
        ->where('web_user_match.website_user_password','Null')
        ->get();


        return view('admin.event.createid', $data);
    }

    public function addMatch()
    {
        $data['page_title'] = 'Map User with Website';
        $data['events'] = Event::where('status', '=', 1)->get();
        $data['users'] = User::where('status', '=', 1)->get();
        //dd($data);
        //exit;
        return view('admin.event.create-event', $data);
    }

    public function saveMatch(Request $request)
    {
        $this->validate($request, [
            'website_id' => 'required',
            'user_id' => 'required',
            'amount' => 'required',

        ], [
            'website_id.required' => 'Website must  be selected',
            'user_id.required' => 'User must  be selected',
            'amount.required' => 'Amount must  be selected',
        ]);
        $user_id = $request->user_id;
        $website_id = $request->website_id;
        $website_details = Event::where('id', $website_id)->first();
        $bal = User::find($user_id)->value('balance');
        $newbid_amount = $request->amount;

        if($newbid_amount<$bal){
            $web_user_match = new Web_user_match;
            $web_user_match->user_id = $user_id;
            $web_user_match->website_id = $website_id;

           $request->website_user_name==""? $web_user_match->website_user_name = "Null" :$web_user_match->website_user_name = $request->website_user_name ;
           $request->website_user_password==""? $web_user_match->website_user_password = "NULL":$web_user_match->website_user_password = $request->website_user_password;
            $web_user_match->amount = $newbid_amount;
            $web_user_match->status = 1;
            $web_user_match->save();

            $new_balance = $bal -  $newbid_amount;

            $User = User::find($user_id);
            $User->balance = $new_balance;
            $User->save();
            session()->flash('success', 'Money Added Successfully!');
        }else{

            session()->flash('Failed', 'Investment Amount Exceed the Wallet Amount!!');
        }
/*
        $in = request()->except('_token', 'start_time', 'end_time');
        $start_date = $request->start_date . ' ' . $request->start_time;
        $end_date = $request->end_date . ' ' . $request->end_time;
        $in['slug'] = str_slug($request->name);
        $in['start_date'] = Carbon::parse($start_date);
        $in['end_date'] = Carbon::parse($end_date);
        $in['status'] = $request->status == 'on' ? '1' : '0';
        $in['admin_id'] = Auth::guard('admin')->id();
        Match::create($in);
*/

        return back();
    }

    public function editMatch($id)
    {
       // $data['match'] = Web_user_match::find($id);
      //  $data['web_user_match_id'] = $id;
       $data['matches']
        =  DB::table('web_user_match')
        ->select(DB::raw('web_user_match.id, web_user_match.user_id , web_user_match.website_id ,web_user_match.website_user_name ,web_user_match.website_user_password ,web_user_match.amount ,  users.username, events.url'))
       ->join('users', 'users.id', '=', 'web_user_match.user_id')
       ->join('events','events.id','=','web_user_match.website_id')
       ->where('web_user_match.id',$id)
       ->first();
        $data['usersdetails']= DB::table('users')->get();
        $data['websitedetails']= DB::table('events')->get();
        $data['page_title']= 'Edit Details';
        //$data['tournaments'] = Event::whereStatus(1)->get();
        return view('admin.event.edit-event', $data);
    }


    public function editwithdraw($id)
    {
       // $data['match'] = Web_user_match::find($id);
      //  $data['web_user_match_id'] = $id;
       $data['matches']
        =  DB::table('web_user_match')
        ->select(DB::raw('web_user_match.id, web_user_match.user_id , web_user_match.website_id ,web_user_match.website_user_name ,web_user_match.website_user_password ,web_user_match.amount ,  users.username, events.url'))
       ->join('users', 'users.id', '=', 'web_user_match.user_id')
       ->join('events','events.id','=','web_user_match.website_id')
       ->where('web_user_match.id',$id)
       ->first();
        $data['usersdetails']= DB::table('users')->get();
        $data['websitedetails']= DB::table('events')->get();
        $data['page_title']= 'Edit Details';
        //$data['tournaments'] = Event::whereStatus(1)->get();
        return view('admin.event.edit-withdraw', $data);
    }




    public function editid($id)
    {
       // $data['match'] = Web_user_match::find($id);
      //  $data['web_user_match_id'] = $id;
       $data['matches']
        =  DB::table('web_user_match')
        ->select(DB::raw('web_user_match.id, web_user_match.user_id , web_user_match.website_id ,web_user_match.website_user_name ,web_user_match.website_user_password ,web_user_match.amount ,  users.username, events.url'))
       ->join('users', 'users.id', '=', 'web_user_match.user_id')
       ->join('events','events.id','=','web_user_match.website_id')
       ->where('web_user_match.id',$id)
       ->first();
        $data['usersdetails']= DB::table('users')->get();
        $data['websitedetails']= DB::table('events')->get();
        $data['page_title']= 'Edit Details';
        //$data['tournaments'] = Event::whereStatus(1)->get();
        return view('admin.event.edit-createid', $data);
    }

    public function updateMatch(Request $request)
    {

        $data = Web_user_match::find($request->id);
        $this->validate($request, [
            'website_id' => 'required',
            'username' => 'required',
            'website_user_name' => 'required',
            'website_user_password' => 'required',
            'amount' => 'required',
        ], [
            'website_id.required' => 'Website URl must  be selected',
            'username.required' => 'User Name must not be empty',
            'website_user_name.required' => 'Website User Name must not be empty',
            'website_user_password.required' => 'Website User Password must not be empty',
            'amount.required' => 'Amount must not be empty',
        ]);

        $in = request()->except('_token', 'start_time', 'end_time');

        $data->user_id = $request->user_id;
        $data->website_id = $request->website_id;
        $data->website_user_name = $request->website_user_name;
        $data->website_user_password = $request->website_user_password;
        $data->amount = $request->amount;
        $data->status = 1;
        $data->save();
        /*
        $in['user_id'] = str_slug($request->user_id);
        $in['website_id'] = str_slug($request->website_id);
        $in['username'] = str_slug($request->username);
        $in['website_user_name'] = str_slug($request->website_user_name);
        $in['website_user_password'] = str_slug($request->website_user_password);
        $in['amount'] = str_slug($request->amount);
        $data->fill($in)->save();
        */

        $phone = User::where('id', $request->user_id)->value('phone');

            $twilio = new Client(env('TWILIO_ACCOUNT_SID'), env('TWILIO_AUTH_TOKEN'));

            $message = $twilio->messages->create(
			$phone, // Text this number

            [
                'from' => env('TWILIO_SMS_NUMBER'),
                'body' => "Admin created new user as per your request."]);


        session()->flash('success', 'Details Update Successfully!');
        return back();
    }


    public function updateMatchwithdrawconfirm(Request $request)
    {

        $data = Web_user_match::find($request->id);
        $this->validate($request, [
            'website_id' => 'required',
            'username' => 'required',
            'website_user_name' => 'required',
            'website_user_password' => 'required',
            'amount' => 'required',
        ], [
            'website_id.required' => 'Website URl must  be selected',
            'username.required' => 'User Name must not be empty',
            'website_user_name.required' => 'Website User Name must not be empty',
            'website_user_password.required' => 'Website User Password must not be empty',
            'amount.required' => 'Amount must not be empty',
        ]);

        $in = request()->except('_token', 'start_time', 'end_time');

        $data->user_id = $request->user_id;
        $data->website_id = $request->website_id;
        $data->website_user_name = $request->website_user_name;
        $data->website_user_password = $request->website_user_password;
        $data->amount = $request->amount;
        $data->status = 1;
        $data->save();

        $deposit = DB::table('deposits')->insert([
            'user_id' => $data->user_id,
            'method_code' => 1001,
            'amount' => $request->amount,
            'method_currency' => 'INR',
            'charge' => '0.00000000',
            'rate' => '1.00000000',
            'final_amo' => $request->amount,
            'btc_amo' => 0,
            'btc_wallet' => '',
            'detail' => 'By Payment Withdraw',
            'trx' => 'By Payment Withdraw',
            'try' => 0,
            'verify_image' => 'Null',
            'status' => 1,
            'admin_id' => 'Null'
        ]);

        $user_id = $request->user_id;
        $bal = User::where('id',$user_id)->value('balance');
        $new_balance = $bal +$request->amount;

        $User = User::find($user_id);
        $User->balance = $new_balance;
        $User->save();


        $phone = User::where('id', $user_id)->value('phone');

            $twilio = new Client(env('TWILIO_ACCOUNT_SID'), env('TWILIO_AUTH_TOKEN'));

            $message = $twilio->messages->create(
			$phone, // Text this number

            [
                'from' => env('TWILIO_SMS_NUMBER'),
                'body' => "Withdrawal Request Accepted by Admin"]);

        /*
        $in['user_id'] = str_slug($request->user_id);
        $in['website_id'] = str_slug($request->website_id);
        $in['username'] = str_slug($request->username);
        $in['website_user_name'] = str_slug($request->website_user_name);
        $in['website_user_password'] = str_slug($request->website_user_password);
        $in['amount'] = str_slug($request->amount);
        $data->fill($in)->save();
        */

        session()->flash('success', 'Withdraw completed Successfully!');
        return back();
    }

    public function viewQuestion($id)
    {
        $data['match_id'] = Match::findOrFail($id);
        $data['page_title'] = $data['match_id']->name;
        $data['questions'] = BetQuestion::where('match_id', $id)->where('end_time', '>', Carbon::now())->paginate(20);
        return view('admin.event.questions', $data);
    }

    public function updateQuestion(Request $request)
    {

        $data = Match::findOrFail($request->match_id);
        $end_date = $request->end_date . ' ' . $request->end_time;
        if ($data->end_date > Carbon::parse($end_date)) {
            $data = BetQuestion::findOrFail($request->id);
            $in = request()->except('_token', 'end_time', 'end_date');
            $in['end_time'] = Carbon::parse($end_date);
            $data->fill($in)->save();

            session()->flash('success', 'Question Update Successfully!');
            return back();
        } else {
            session()->flash('warning', "Question duration time too large then Event Ending date");
            return back();
        }
    }

    public function saveQuestion(Request $request)
    {
        $this->validate($request, [

            'match_id' => 'required',
            'question' => 'required',
            'end_date' => 'required',
            'end_time' => 'required',
            'status' => 'required'
        ]);

        $end_date = $request->end_date . ' ' . $request->end_time;
        $data = Match::find($request->match_id);
        if ($data->end_date > Carbon::parse($end_date)) {
            BetQuestion::create([
                'match_id' => $request->match_id,
                'end_time' => Carbon::parse($end_date),
                'question' => $request->question,
                'admin_id' => Auth::guard('admin')->id()
            ]);
            session()->flash('success', 'Question Added Successfully!');
            return back();
        } else {
            session()->flash('danger', 'Question duration time too large \n  then Match ending date');
            return back();
        }
    }

    public function viewOption($id)
    {
        $data['ques'] = BetQuestion::with('match')->where('id',$id)->firstOrFail();
        $data['page_title'] = $data['ques']->question;
        $data['betoption'] = BetOption::whereQuestion_id($id)->paginate(20);
        return view('admin.event.options', $data);
    }

    public function createNewOption(Request $request)
    {
        $this->validate($request, [
            'ques_id' => 'required',
            'match_id' => 'required',
            'option_name' => 'required',
            'min_amo' => 'required',
            'bet_limit' => 'required',
            'ratio1' => 'required',
            'ratio2' => 'required',
            'status' => 'required'
        ]);


        BetOption::create([
            'match_id' => $request->match_id,
            'question_id' => $request->ques_id,
            'status' => $request->status,
            'option_name' => $request->option_name,
            'min_amo' => $request->min_amo,
            'ratio1' => $request->ratio1,
            'ratio2' => $request->ratio2,
            'admin_id' => Auth::guard('admin')->id()
        ]);
        session()->flash('success', 'Option Added Successfully!');
        return back();
    }

    public function updateOption(Request $request)
    {
        $data = BetOption::find($request->id);

        $this->validate($request, [
            'option_name' => 'required',
            'ratio1' => 'required|between:0,99.99',
            'ratio2' => 'required|between:0,99.99',
        ],
            [
                'name.required' => 'Option must not be empty',
                'ratio1.required' => 'ratio1 must not be empty',
                'ratio2.required' => 'ratio must not be empty',
            ]);
        $in = request()->except('_token');
        $data->fill($in)->save();

        session()->flash('success', 'Update Successfully!');
        return back();
    }


    public function endDateByQuestion()
    {
        $now = Carbon::now();
        $data['page_title'] = "Awaiting Winner";
        $data['questions'] = BetQuestion::with('match')->where('end_time', '<', $now)->orderBy('end_time', 'desc')->paginate(20);
        $data['access'] = json_decode(Auth::guard('admin')->user()->access);
        return view('admin.result.awaiting-list', $data);
    }

    public function refundBetInvest(Request $request)
    {
        $basic = GeneralSettings::first();
        $betQ = BetQuestion::where('id', $request->question_id)->where('match_id', $request->match_id)->latest()->first();
        $betQ->result = 1;
        $betQ->save();

        $betOption = BetOption::where('question_id', $betQ->id)->where('match_id', $request->match_id)->latest()->get();
        foreach ($betOption as $value) {
            $value->status = 3;  // refunded
            $value->admin_id = Auth::guard('admin')->id();
            $value->save();
        }

        $winner = BetInvest::where('betquestion_id', $request->question_id)->where('match_id', $request->match_id)->where('status', 0)->latest()->get();
        foreach ($winner as $dd) {
            $user = User::find($dd->user_id);
            $user->balance += $dd->invest_amount;
            $user->save();

            $mm = Match::whereId($request->match_id)->first();
            $tr = getTrx();
            Trx::create([
                'user_id' => $user->id,
                'amount' => $dd->invest_amount,
                'main_amo' => $user->balance,
                'charge' => 0,
                'type' => '+',
                'title' => $dd->invest_amount . ' ' . $basic->currency . " refunded by admin policy. <br>" . "\n Event : " . $mm->name . " ( Ques: " . $dd->ques->question . " => " . $dd->betoption->option_name . ")",
                'trx' => $tr
            ]);
            $dd->status = 2; // refunded
            $dd->admin_id = Auth::guard('admin')->id();
            $dd->remaining_balance = $user->balance; // remaining balance
            $dd->update();
        }

        session()->flash('success', 'Refunded Successfully!');

        return back();
    }


    public function awaitingWinnerUserlist($id)
    {
        $data['page_title'] = "Predictors List";
        $data['betQuestion'] = BetQuestion::find($id);
        $data['betInvest'] = BetInvest::where('betquestion_id', $id)->latest()->paginate(20);
        $data['access'] = json_decode(Auth::guard('admin')->user()->access);
        return view('admin.result.predictor-list', $data);
    }

    public function refundBetInvestSingleUser(Request $request)
    {
        $this->validate($request, [
            'id' => 'required'
        ]);
        $basic = GeneralSettings::first();
        $invest = BetInvest::where('id', $request->id)->where('status', 0)->firstOrFail();

        $user = User::find($invest->user_id);
        $user->balance += $invest->invest_amount;
        $user->save();

        $mm = Match::whereId($invest->match_id)->first();
        $tr = getTrx();
        Trx::create([
            'user_id' => $user->id,
            'amount' => $invest->invest_amount,
            'main_amo' => $user->balance,
            'charge' => 0,
            'type' => '+',
            'title' => $invest->invest_amount . ' ' . $basic->currency . " refunded by admin policy. <br>" . "\n Event: " . $mm->name . " ( Ques: " . $invest->ques->question . " => " . $invest->betoption->option_name . ")",
            'trx' => $tr
        ]);
        $invest->status = 2; // refunded
        $invest->admin_id = Auth::guard('admin')->id();
        $invest->remaining_balance = $user->balance; // remaining balance
        $invest->update();

        session()->flash('success', 'Refunded Successfully!');
        return back();
    }
    public function viewOptionEndTime($id)
    {
        $data['ques'] = BetQuestion::findOrFail($id);
        $data['page_title'] = $data['ques']->question;
        $data['betoption'] = BetOption::whereQuestion_id($id)->paginate(20);
        $data['access'] = json_decode(Auth::guard('admin')->user()->access);
        return view('admin.result.threat-list', $data);
    }

    public function makeWinner(Request $request)
    {
        $basic = GeneralSettings::first();
        $winner = BetInvest::where('match_id', $request->match_id)->where('betquestion_id', $request->ques_id)->where('betoption_id', $request->betoption_id)->where('status', 0)->latest()->get();
        $losser = BetInvest::where('match_id',$request->match_id)->where('betquestion_id', $request->ques_id)->where('betoption_id', '!=', $request->betoption_id)->where('status', 0)->latest()->get();

        foreach ($winner as $dd) {
            $return_amo = $dd->return_amount;
            $charge =(($dd->return_amount - $dd->invest_amount) * $basic->win_charge)/100; //percent
            $user = User::find($dd->user_id);
            $user->balance +=  round(($return_amo - $charge) ,2);
            $user->save();

            $dd->status = 1;
            $dd->admin_id = Auth::guard('admin')->id();
            $dd->charge = round($charge, 2);
            $dd->update();

            Trx::create([
                'user_id' => $user->id,
                'amount' => round(($return_amo - $charge) ,2),
                'main_amo' => $user->balance,
                'charge' => round($charge, 2),
                'type' => '*',
                'title' => "<strong>Event:</strong> " . $dd->match->name." <br>( <strong> Ques:</strong> ".$dd->ques->question. " <strong>, Threat: ". $dd->betoption->option_name ." => Win)</strong>",
                'trx' => getTrx(),
            ]);
        }
        foreach ($losser as $dd) {
            $user = User::find($dd->user_id);
            $dd->status = -1;
            $dd->admin_id = Auth::guard('admin')->id();
            $dd->update();
        }

        $betQ = BetQuestion::find($request->ques_id);
        $betQ->result = 1;
        $betQ->update();

        $betStatus = BetOption::find($request->betoption_id);
        $betStatus->status = 2;
        $betStatus->update();

        $betlosser = BetOption::where('id', '!=', $request->betoption_id)->whereQuestion_id($request->ques_id)->whereMatch_id($request->match_id)->get();
        foreach ($betlosser as $data) {
            $data->status = -2;
            $data->update();
        }
        session()->flash('success', 'Make winner Successfully!');
        return back();
    }

    public function betOptionUserlist($id)
    {
        $data['page_title'] = "Prediction User List";
        $data['betoption'] = BetOption::with('question','match')->whereId($id)->firstOrFail();
        $data['betInvest'] = BetInvest::with('user')->where('betoption_id', $id)->latest()->paginate(20);
        return view('admin.result.predictors-option-side', $data);
    }


}
