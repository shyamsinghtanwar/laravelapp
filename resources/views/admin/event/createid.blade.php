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


                    @include('errors.error')




                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">SL</th>
                            <th scope="col">Website</th>
                            <th scope="col">Username</th>

                            <th scope="col" class="w-18p">ACTION</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($matches as $k=>$mac)
                            <tr>
                                <td data-label="SL">{{++$k}}</td>
                                <td data-label="Website">
                                    {{$mac->url}}<br>
                                </td>
                                <td data-label="Username">
                                   <a href="admin/user/{{$mac->user_id}}">{{$mac->username}}</a><br>
                                </td>



                                <td data-label="Action">
                                    <div class="template-demo d-flex  flex-nowrap">
                                        <a href="{{route('edit.id', $mac->id )}}"
                                           class="btn btn-gradient-info btn-sm btn-rounded btn-icon pt-12 tooltip-styled"
                                           data-tooltip-content="Edit Event">
                                            <i class="mdi mdi-pencil"></i>
                                        </a>




                                    </div>


                                </td>
                            </tr>
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
