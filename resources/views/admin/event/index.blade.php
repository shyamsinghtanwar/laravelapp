@extends('admin.layout.master')
@section('import-css')
@stop
@section('content')

    <div class="page-header">
        <h3 class="page-title">
              <span class="page-title-icon bg-gradient-success text-white mr-2">
                  <i class="mdi  mdi-trophy-outline  "></i>
              </span> {{$page_title}} </h3>


    </div>

    <div class="row">

        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">


                <div class="card-body">
                    <h4 class="card-title mb-5">
                        <div class="float-right">
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <a href="{{route('add.match')}}"
                                   class="btn btn-sm btn-outline-success @if(Request::routeIs('add.match')) active @endif">
                                    <i class=" mdi mdi-plus "></i> Create Event
                                </a>
                            </div>
                        </div>


                    </h4>

                    @include('errors.error')




                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">SL</th>
                            <th scope="col">Website</th>
                            <th scope="col">Username</th>
                            <th scope="col">Website User</th>
                            <th scope="col">Website Password</th>
                            <th scope="col">Amount</th>

                            <th scope="col" class="w-18p">ACTION</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($matches as $k=>$mac)

                        @if ($mac->website_user_name == 'Withdraw_Request')

                        @else
                            <tr>
                                <td data-label="SL">{{++$k}}</td>
                                <td data-label="Website">
                                    {{$mac->url}}
                                </td>
                                <td data-label="Username">
                                    <a href="admin/user/{{$mac->user_id}}">{{$mac->username}}</a>

                                </td>
                                <td data-label="Website User">
                                    {{$mac->website_user_name}}
                                </td>
                                <td data-label="Website Password">
                                    {{$mac->website_user_password}}
                                </td>
                                <td data-label="Amount">
                                    {{$mac->amount}}
                                </td>



                                <td data-label="Action">
                                    <div class="template-demo d-flex  flex-nowrap">
                                        <a href="{{route('edit.match', $mac->id )}}"
                                           class="btn btn-gradient-info btn-sm btn-rounded btn-icon pt-12 tooltip-styled"
                                           data-tooltip-content="Edit Event">
                                            <i class="mdi mdi-pencil"></i>
                                        </a>




                                    </div>


                                </td>
                            </tr>

                            @endif
                        @endforeach
                        </tbody>
                    </table>



                </div>
                <div class="card-footer">

                </div>
            </div>
        </div>


    </div>



@endsection


@section('script')

@stop
