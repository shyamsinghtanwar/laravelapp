@extends('admin.layout.master')

@section('css')

@stop
@section('content')

    <div class="page-header">
        <h3 class="page-title">
              <span class="page-title-icon bg-gradient-success text-white mr-2">
                  <i class="mdi mdi-trophy-outline "></i>
              </span>
            {{$page_title}}
        </h3>
    </div>


    <div class="row">

        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">


                <div class="card-body">
                    <h4 class="card-title mb-5">
                        <div class="float-right">
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <a href="{{route('admin.matches')}}" class="btn btn-sm btn-outline-success @if(Request::routeIs('admin.matches')) active @endif">
                                    <i class=" mdi mdi-eye "></i> All Event
                                </a>
                            </div>
                        </div>
                    </h4>

                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <form class="forms-sample" action="" method="post">
                                @csrf

                                <div class="form-group  row">
                                    <label for="tournament" class="col-sm-3 col-form-label"><strong>Select Website</strong></label>
                                    <div class="col-sm-9">
                                        <select name="website_id" id="tournament" class="form-control">
                                            <option value="">Select Website</option>
                                            @foreach($events as $data)
                                                <option value="{{$data->id}}">{{$data->url}}</option>
                                            @endforeach
                                        </select>
                                        @if ($errors->has('event_id'))
                                            <div class="text-danger">{{ $errors->first('event_id') }}</div>
                                        @endif
                                    </div>
                                </div>

                                <div class="form-group  row">
                                    <label for="tournament" class="col-sm-3 col-form-label"><strong>Select User</strong></label>
                                    <div class="col-sm-9">
                                        <select name="user_id" id="user_id" class="form-control">
                                            <option value="">Select User</option>
                                            @foreach($users as $user)
                                                <option value="{{$user->id}}">{{$user->username}} - Wallet Amount: {{$user->balance}}</option>
                                            @endforeach
                                        </select>
                                        @if ($errors->has('event_id'))
                                            <div class="text-danger">{{ $errors->first('event_id') }}</div>
                                        @endif
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="eventName" class="col-sm-3 col-form-label"><strong>Website user name</strong></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="website_user_name" class="form-control" id="website_user_name"
                                        placeholder="Website user name" />

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="eventName" class="col-sm-3 col-form-label"><strong>Website User Password</strong></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="website_user_password" class="form-control" id="website_user_password"
                                        placeholder="Website user password"  />

                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label for="eventName" class="col-sm-3 col-form-label"><strong>Investment Amount</strong></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="amount" class="form-control" id="amount"
                                               placeholder="Investment Amount">
                                        @if ($errors->has('amount'))
                                            <p class="text-danger">{{ $errors->first('amount') }}</p>
                                        @endif
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-9 offset-sm-3">
                                        <button type="submit" class="btn btn-gradient-success btn-block">Save</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
@endsection


@section('script')
    <script>

        (function ($) {
            "use strict";


            if ($("#timepicker-example").length) {
                $('#timepicker-example').datetimepicker({
                    format: 'LT'
                });
            }
            if ($("#datepicker-popup").length) {
                $('#datepicker-popup').datepicker({
                    enableOnReadonly: true,
                    todayHighlight: true,
                });
            }

            if ($("#timepicker-example2").length) {
                $('#timepicker-example2').datetimepicker({
                    format: 'LT'
                });
            }
            if ($("#datepicker-popup2").length) {
                $('#datepicker-popup2').datepicker({
                    enableOnReadonly: true,
                    todayHighlight: true,
                });
            }

            if ($(".datepicker-autoclose").length) {
                $('.datepicker-autoclose').datepicker({
                    autoclose: true
                });
            }

        })(jQuery);

    </script>
@stop
