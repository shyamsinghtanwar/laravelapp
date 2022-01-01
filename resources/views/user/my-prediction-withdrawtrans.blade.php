@extends('user')

@section('css')
    <link rel="stylesheet" href="{{asset('public/templates/css/custom-table.css')}}">
@stop
@section('content')

    @include('partials.breadcrumb')

    <div class="faq-section shadow-bg ">
        <div class="container">


            <div class="row py-2">
                <div class="col-md-12">
                    <div class="table-custom">
                        <table class="table table-striped">
                            <thead >
                            <tr class="result-table-header">
                                <th scope="col">S.No.</th>
                                <th scope="col">Website</th>

                                <th scope="col">Amount</th>
                                <th scope="col">Status</th>
                                <th scope="col">Date</th>
                                <th scope="col"></th>


                            </tr>
                            </thead>
                            <tbody>

                            @forelse($matches as $k=>$row)
                            @if ($row->amount !== 0)
                                <tr class="result-table-tr">
                                    <td scope="row">{{++$k}}</td>
                                    <td><img src='/{{($row->images)}}' alt='{{($row->url)}}' style='width:250px;height:42px;'></td>

                                    <td>{{($row->amount)}}</td>
                                    <td>@if ($row->status == "0")
                                        Inactive
                                        @else
                                        Active
                                        @endif </td>

                                        <td>{{($row->created_at )}}</td>
                                <td>@if ($row->website_user_name == 'Withdraw_Request')
                                    Debit
                                    @else
                                    Credit
                                    @endif</td>
                                </tr>

                                @endif

                            @empty
                                <tr class="result-table-tr">
                                    <td colspan="8">('No Data Found!')</td>
                                </tr>

                            @endforelse

                            </tbody>
                        </table>

                    </div>

                    <div class="pagination-nav ">

                    </div>

                </div>
            </div>

        </div>
    </div>
@stop
