<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Laravel</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">

    <style>
        body {
            font-family: 'Nunito';
            background: #f7fafc;
        }
    </style>
</head>
<body>
    <div class="container-fluid fixed-top p-4">
        <div class="col-12">
            <div class="d-flex justify-content-end">
                @if (Route::has('login'))
                    <div class="">
                        @auth
                            <a href="{{ url('/home') }}" class="text-muted">Home</a>
                        @else
                            <a href="{{ route('login') }}" class="text-muted">Log in</a>

                            @if (Route::has('register'))
                                <a href="{{ route('register') }}" class="ms-4 text-muted">Register</a>
                            @endif
                        @endif
                    </div>
                @endif
            </div>
        </div>
    </div>

    <div class="container-fluid my-5 pt-5 px-5">
        <div class="row justify-content-center px-4">
            <div class="col-md-6 col-lg-6">
            <img class=" " src="{{URL::asset('/image/logo.png')}}" alt="profile Pic" style="width:100%"  >    
            

                <div class="card shadow-sm">
                    <div class="row">
                        <div class="col-md-12 pr-0">
                            <div class="card-body border-right border-bottom p-3 h-100">
                                <div class="d-flex flex-row bd-highlight pt-2">
                                    <div>
                                     <div class="pl-3">
                                        <div class="mb-2">
                                          Dating WebApp
                                        </div>
                                        <p class="text-muted small">
                                           Please Login to find your favourite people around you
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                         
                         
                        
                    </div>
                </div>

                <div class="d-flex justify-content-between mt-3">
                    <div class="text-sm text-muted">
                       <!--  <div class="flex align-content-center">
                       

                            

                           Laravel v{{ Illuminate\Foundation\Application::VERSION }} (PHP v{{ PHP_VERSION }})
                        </div>-->
                    </div>

                   <div class="text-sm text-muted">
                        <a href="#" class="text-muted">
                            ©2021 All Rights Reserved By matchyours.com
                            </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
