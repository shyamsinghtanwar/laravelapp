@extends('user')

@section('content')
    @include('partials.breadcrumb')

    <!--   contact section start    -->
    <div class="faq-section">
        <div class="container">
            <div class="row justify-content-center">
                    <div class="col-lg-8">

                        <form action="{{route('websitemoney.withdraw')}}" method="post" class=" smoke-bg p-5">
                            @csrf
                            <div class="row">

                                <div class="col-md-12">

                                    <h6 class="text-center text-info">Withdraw Amount Request </h6>
                                </div>
                                <input type="hidden" name="website_id" value="{{$validation_check->website_id}} ">
                                <div class="col-md-12">
                                    <div class="form-element">
                                        <label for="email" class="font-weight-bold text-white">@lang('Website')</label>
                                        <input type="text" name="website" value="{{$validation_check->url}}" disabled>
                                    </div>
                                </div>

                                 <div class="col-md-12">
                                    <div class="form-element">
                                        <label for="amount" class="font-weight-bold text-white"></label>
                                        <input type="text" name="amount" placeholder="0.00" value="0.00">

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



