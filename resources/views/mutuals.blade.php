 
<x-app-layout>
    <x-slot name="header">
        <div class="d-flex flex-row  ">
        <div class="p-2  ">
          <p class="  font-weight-bold">
                    {{ __('Matching/Mutuals') }}
          </p>
        </div>
        <div class="p-2  ">

        </div>
        <div class="p-2  ">
            <h5 class="h5 font-weight-bold">
                  {{ __('You Have Total Mutuals:') }} {{count($my_mutuals)}}
            </h5>    
        </div>
      </div>
    </x-slot>

<div class="row">


@foreach ($my_mutuals as $my_mutuals_each)

@php
$current_date = new DateTime('now', new DateTimezone('Asia/Dhaka')); 
$bdate=$all_users_details[$my_mutuals_each]['dob'];
$age = date_diff(date_create($bdate), $current_date)->y;
@endphp

  <div class="col-sm-4">
    <div class="card" style="width: 18rem;">
    <img class="card-img-top" style="width: 120px;" src="{{URL::asset('/storage/'.$all_users_details[$my_mutuals_each]['profile_photo_path'])}}
    " alt="Card image cap">
    <div class="card-body">
        <h5 class="card-title">Name {{$all_users_details[$my_mutuals_each]['name']}}</h5>
        <p class="card-text"><b>Email:</b> {{$all_users_details[$my_mutuals_each]['email']}} <br>
        <b>Gender:</b> {{$all_users_details[$my_mutuals_each]['gender']}}<br>
        <b>Age:</b> {{$age}}<br>
        </p>
    </div>
    </div>      
  </div>
@endforeach
</div>



    


</x-app-layout>