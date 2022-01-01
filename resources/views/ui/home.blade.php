@extends('layout')

@section('css')
    <link rel="stylesheet" href="{{asset('public/templates/css/custom.css')}}">
    <style>
        @foreach($sliders as $data)
        .hero-bg-{{$data->id}}    {
            background-image: url({{asset('public/images/slider/'.$data->image)}});
            background-size: cover;
            background-position: center;
        }
        @endforeach
    </style>
@stop
@section('content')

    <script>
        function createCountDown(elementId, sec) {
            var tms = sec;
            var x = setInterval(function() {
                var distance = tms*1000;
                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                document.getElementById(elementId).innerHTML =days+"D  "+ hours + "h "+ minutes + "m " + seconds + "s ";
                if (distance < 0) {
                    clearInterval(x);
                    document.getElementById(elementId).innerHTML = "{{__('COMPLETE')}}";
                }
                tms--;
            }, 1000);
        }

    </script>

    <!--  Hero Area Start  -->
    <div class="hero-area home-3">
        <div class="hero-carousel owl-carousel owl-theme">

            @foreach($sliders as $data)
                <div class="single-hero-item hero-bg-{{$data->id}}">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-8 col-lg-10">
                                <div class="hero-txt">

                                </div>
                            </div>
                            <div class="col-lg-5"></div>
                        </div>
                    </div>
                    <div class="hero-overlay"></div>
                </div>
            @endforeach
        </div>
    </div>
    <!--  Hero Area End  -->


    <div class="vehicles-area home-2">
        <div class="container">
            <div class="row ">
            @foreach ($event as $events)



                <div class="col-sm">
                    <img class="exchange_imgs" src="{{asset($events->images)}}" alt="{{$events->url}}" width="160px" height="68px" border-radius="18px" >
                    <br />
                    <label class="badge badge-warning"><i class="fa fa-gift"></i> Offer </label> <b> {{$events->special}} </b>


                </div>





                @endforeach
            </div>
        </div>
    </div>






    <!--    Call to Action Area Start    -->
    <div class="cta-area cta-bg">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-10">
                    <h2>@lang('We Are Here To Help You Needs')</h2>
                </div>
                <div class="col-lg-2">
                    <a href="{{route('contact')}}" class="cartbtn cart">@lang('Contact Us')</a>
                </div>
            </div>
        </div>
        <div class="cta-overlay"></div>
    </div>
    <!--    Call to Action Area End    -->


    <div class="modal modal-sport fade" id="sportModal" tabindex="-1" role="dialog" aria-labelledby="sportModalTitle"
         aria-hidden="true">

        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title modal-sport-confrontation text-white font-20"
                        id="sportModalTitle">@lang('Prediction Now')</h5>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <form action="{{route('prediction')}}" method="post">
                    @csrf
                    <div class="modal-body text-center">
                        <p class="modal-sport-wager-title">
                            <span class="modal-sport-wager"></span>
                            <span class="modal-sport-wager-count"></span>
                        </p>

                        <p class="modal-sport-live">
                            <span class="font-weight-bold">@lang('MINIMUM PREDICT AMOUNT') <span
                                    class="minamo"></span> {{__($basic->currency)}}</span>
                        </p>
                        <div class="stepper-sport">
                            <div class='ctrl'>
                                <div class='ctrl__button ctrl__button--decrement'>&ndash;</div>
                                <div class='ctrl__counter'>
                                    <input name="invest_amount"
                                           class='ctrl__counter-input form-input  invest_amount_min ronnie_bet get_amount_for_ratio'
                                           maxlength='10' type='text' value='' min="" max=""
                                           onkeyup="this.value = this.value.replace (/^\.|[^\d\.]/g, '')">
                                </div>
                                <div class='ctrl__button ctrl__button--increment'>+</div>
                            </div>
                        </div>


                        <input type="hidden" value="" name="betoption_id" id="betoption_id">
                        <input type="hidden" value="" name="match_id" id="match_id">
                        <input type="hidden" value="" name="betquestion_id" id="questionid">
                        <input class="ratio1" type="hidden" value="" id="ratioOne">
                        <input class="ratio2" type="hidden" value="" id="ratioTwo">
                        <input class="form-control input-lg ronnie_ratio" name="return_amount" type="hidden">
                    </div>
                    <div class="modal-footer">
                        <small>(@lang('IF YOU WIN'))</small>
                        <p class="modal-sport-win">
                            <span class="font-weight-bold">@lang('RETURN AMOUNT')</span>
                            <span class="font-weight-bold"><span class="wining-rate"></span> {{$basic->currency}}</span>
                        </p>
                        <p class="text-danger">{{$basic->win_charge}}% @lang('Charge Apply From This Amount')
                            (@lang('IF YOU WIN')) </p>
                        <p class="text-success">@lang('Maximum') <span
                                class="betlimit"></span>{{$basic->currency}} @lang('Predict in this Option')  </p>

                        @if(Auth::user())
                            <div class="form-element mt-2">
                                <button type="submit"><span>@lang('Predict Now')</span>
                                </button>
                            </div>
                        @else
                            <div class="form-element mt-2">
                                <a href="{{route('login')}}" class="cartbtn cart">@lang('Predict Now')
                                </a>
                            </div>
                        @endif
                    </div>

                </form>
            </div>
        </div>
    </div>
@stop

@section('js')

    <script>
        (function ($) {
            "use strict";

            $(document).ready(function () {

                $(document).on('click', '.bet_button', function () {
                    var id = $(this).data('id');
                    var minamo = $(this).data('minamo');
                    var macthid = $(this).data('macthid');
                    var ratioone = $(this).data('ratioone');
                    var ratiotwo = $(this).data('ratiotwo');
                    var questionid = $(this).data('questionid');
                    var betlimit = $(this).data('betlimit');

                    $('#betoption_id').val(id);
                    $("#match_id").val(macthid);
                    $("#ratioOne").val(ratioone);
                    $("#ratioTwo").val(ratiotwo);
                    $("#questionid").val(questionid);

                    $(".get_amount_for_ratio").val(minamo);
                    $('.minamo').text(minamo);
                    $('.betlimit').text(betlimit);
                    $('.ctrl__counter-input').attr('value', minamo)
                    $('.ctrl__counter-input').attr('min', minamo)
                    $('.ctrl__counter-num').text(minamo)
                    $('.ctrl__counter-input').attr('max', betlimit)

                    var amount = $('.get_amount_for_ratio').val();
                    var ratio1 = $('.ratio1').val();
                    var ratio2 = $('.ratio2').val();
                    var finalRation = parseFloat((amount * ratio2) / ratio1).toFixed(2);
                    $('.ronnie_ratio').val(finalRation);
                    $('.wining-rate').text(finalRation);
                });


                $(document).on('keyup change click', '.get_amount_for_ratio', function () {
                    var amount = $('.get_amount_for_ratio').val();
                    var ratio1 = $('.ratio1').val();
                    var ratio2 = $('.ratio2').val();
                    var finalRation = parseFloat((amount * ratio2) / ratio1).toFixed(2);
                    $('.ronnie_ratio').val(finalRation);
                    $('.wining-rate').text(finalRation);
                });
            });

        })(jQuery);

    </script>
@stop
