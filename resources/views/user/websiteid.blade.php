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
                                <th scope="col">Website</th>
                                <th scope="col"></th>
                            </tr>
                            </thead>
                            <tbody>



                            @forelse($website as $k=>$row)
                                <tr class="result-table-tr">
                                    <td><img src="{{asset($row->images)}}" alt="{{$row->websitename}}" style="width:250px;height:42px;"></td>
                                    <td>
                                        @php
                                        $key = array_search($row->id , array_column($site_user_disable, 'website_id'));

                                        if($key!== false){
                                         $website_user_name  = $site_user_disable[$key]['website_user_name'];
                                           $website_user_password   = $site_user_disable[$key]['website_user_password'];

                                           if($website_user_name=='Null' && $website_user_password=='Null' ){
                                            echo "ID Signup request raised" ;
                                           }else{
                                            echo "User: $website_user_name & Password:  $website_user_password " ;
                                        }
                                        }else{
                                            echo"<a href='processid?uid=$row->id'> Request ID</a>";
                                        }
                                        @endphp
                                    </td>
                                    </tr>
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
