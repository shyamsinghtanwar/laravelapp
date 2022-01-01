<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>{{$page_title}} | {{$basic->sitename}}</title>

    <link rel="shortcut icon" href="{{asset('public/images/logo/favicon.png')}}">
    <link rel="stylesheet" href="{{asset('public/admin/css/file.min.css')}}">
    @yield('import-css')
    @yield('css')
    <link rel="stylesheet" href="{{asset('public/admin/css/custom.css')}}">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	
	  <script src="https://js.pusher.com/7.0/pusher.min.js"></script>
  <script>

    // Enable pusher logging - don't include this in production
    Pusher.logToConsole = true;

    var pusher = new Pusher('d47c94aedd7aac03008e', {
      cluster: 'ap2'
    });

    var channel = pusher.subscribe('my-channel');
    channel.bind('my-event', function(data) {
		playAudio();
      alert(JSON.stringify(data));
	   
    });
	
		function playAudio() {
      var x = new Audio('{{asset('public/notification.mp3')}}');
      // Show loading animation.
      var playPromise = x.play();

      if (playPromise !== undefined) {
          playPromise.then(_ => {
                  x.play();
              })
              .catch(error => {
              });

      }
  }
	

	
	
  </script>
  </head>
  <body>

    <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
          <a class="navbar-brand brand-logo" href="{{url('/')}}"><img src="{{asset('public/images/logo/footer-logo.png')}}" alt="logo" /></a>
          <a class="navbar-brand brand-logo-mini" href="{{url('/')}}"><img src="{{asset('public/images/logo/footer-logo.png')}}" alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
          <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
            <span class="mdi mdi-menu"></span>
          </button>
         
          <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item nav-profile dropdown">
              <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                <div class="nav-profile-img">
                  
                  @if(Auth::guard('admin')->user()->image == null)
                      
                  <img src="{{asset('public/images/user/user-default.jpg')}}" alt="profile">
                  @else
                  <img src="{{ asset('public/images/user/') }}/{{Auth::guard('admin')->user()->image}}" alt="profile">
                  @endif

                  <span class="availability-status online"></span>
                </div>
                <div class="nav-profile-text">
                  <p class="mb-1 text-black">{{Auth::guard('admin')->user()->username}}</p>
                </div>
              </a>
              <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                <a class="dropdown-item" href="{{route('admin.profile')}}">
                  <i class="mdi mdi-cached mr-2 text-success"></i> Settings </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="{{route('admin.logout')}}">
                  <i class="mdi mdi-logout mr-2 text-primary"></i> Signout </a>
              </div>
            </li>


          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
       @include('admin.layout.sidebar')
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
          
          @yield('content')

          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © {{date('Y')}} <strong>{{$basic->sitename}}</strong>. All rights reserved.</span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>


    <script src="{{asset('public/admin/js/file.min.js')}}"></script>
    @yield('import-js')

    @include('partials.notify')

    @yield('script')
    @stack('js')
    
  </body>
</html>
