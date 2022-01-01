@extends('user')

@section('content')
    @include('partials.breadcrumb')

    <!--   contact section start    -->
    <div class="faq-section">
        <div class="container">
            <div class="row justify-content-center">
                    <div class="col-lg-8">

                        <form action="{{route('websitemoney.transfer')}}" method="post" class=" smoke-bg p-5">
                            @csrf
                            <div class="row">

                                <div class="col-md-12">

                                    <h6 class="text-center text-info">Wallet Amount : {{$bal}} </h6>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-element">
                                        <label for="email" class="font-weight-bold text-white">@lang('Website')</label>
                                        <select name="website" id="website" class="form-control">
                                            <option value="">Select Website</option>
                                            @foreach($events as $event)

                                            @php
                                                $key = array_search($event->id , array_column($site_user_disable, 'website_id'));
                                                if ($key !== false) {
                                                        echo  "<option value='$event->id''>$event->url</option>";
                                                }

                                            @endphp



                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                 <div class="col-md-12">
                                    <div class="form-element">
                                        <label for="amount" class="font-weight-bold text-white"></label>
                                        <input type="text" name="amount" placeholder="0.00" value="0.00">
                                        @if ($errors->has('amount'))
                                            <span class="text-danger">{{ $errors->first('amount') }}</span>
                                        @endif
                                    </div>
                                </div>


                                <div class="col-md-12">
                                    <div class="form-element mt-3">
                                        <button type="submit" class="btn btn-block">Submit</span></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

        </div>
    </div>
    <!--   contact section end    -->
@stop



