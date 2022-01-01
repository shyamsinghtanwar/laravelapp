@extends('admin.layout.master')

@section('content')

 <div class="page-header">
    <h3 class="page-title">
          <span class="page-title-icon bg-gradient-success text-white mr-2">
              <i class="mdi mdi-trophy-outline "></i>
          </span>
          <br /><br /><br /><br />
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

                            <form action="{{route('update.match')}}" method="post" name="forms-sample">
                                @csrf
                                <input type="hidden" name="id" value="{{$matches->id}}">
                                <input type="hidden" name="user_id" value="{{$matches->user_id}}">
                                <input type="hidden" name="website_user_password" value="{{$matches->website_user_password}}"  >
                                <input type="hidden" name="website_user_name" value="{{$matches->website_user_name}}">
                                <input type="hidden" name="website_id" value="{{$matches->website_id}}" >
                                <input type="hidden" name="username" value="{{$matches->username}}">

                            <div class="form-group  row">
                                <label for="tournament" class="col-sm-3 col-form-label"><strong>Select Website</strong></label>
                                <div class="col-sm-9">
                                    <select name="website_id_display" id="website_id_display" class="form-control" disabled>
                                        <option value="">Select Website</option>
                                        @foreach($websitedetails as $data)
                                            <option value="{{$data->id}}" @if($matches->website_id  == $data->id) selected @endif>{{$data->url}}</option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('event_id'))
                                        <div class="text-danger">{{ $errors->first('event_id') }}</div>
                                    @endif
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="eventName" class="col-sm-3 col-form-label"><strong>User Name</strong></label>
                                <div class="col-sm-9">
                                    <input type="text" name="username1" value="{{$matches->username}}" class="form-control" id="username"
                                           placeholder="User Name" disabled>
                                    @if ($errors->has('username'))
                                        <p class="text-danger">{{ $errors->first('username') }}</p>
                                    @endif
                                </div>
                            </div>



                            <div class="form-group row">
                                <label for="eventName" class="col-sm-3 col-form-label"><strong>Amount</strong></label>
                                <div class="col-sm-9">
                                    <input type="text" name="amount" value="{{$matches->amount}}" class="form-control" id="amount"
                                           placeholder="Amount">
                                    @if ($errors->has('amount'))
                                        <p class="text-danger">{{ $errors->first('amount') }}</p>
                                    @endif
                                </div>
                            </div>






                            <div class="form-group row">
                                <div class="col-sm-9 offset-sm-3">
                                    <button type="submit" class="btn btn-gradient-success btn-block">Update</button>
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



