<x-app-layout>
    <x-slot name="header">
       
<input type="text" id="this_user" class="d-none" value="{{Auth::user()->id}}">
    <div id="chatbox" class="col-md-3 box_custom d-none">
      <!-- DIRECT CHAT SUCCESS -->
      <div class="box box-success direct-chat direct-chat-success">
        <div class="box-header with-border">
          <h3 class="box-title">Chat</h3>
    
          <div class="box-tools pull-right">
            <span data-toggle="tooltip" title="3 New Messages" class="badge bg-green">3</span>
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Contacts" data-widget="chat-pane-toggle">
              <i class="fa fa-comments"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" onclick="close_chat()"><i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body" id="scroll_box">
          <div class="direct-chat-messages" id="chat_text">
          </div>
        </div>
        <div class="box-footer">
            <div class="input-group">
              <input autofocus type="text" autocomplete="off"  id="chat_value" name="message" placeholder="Type Message ..." class="form-control">
                  <span class="input-group-btn">
                    <button type="submit" id="submit_chat" onclick="submit_chat()"  class="btn btn-success btn-flat">Send</button>
                  </span>
            </div>
        </div>
      </div>
    </div>



    <div class="container">
  <div class="row">
    <div class="col-md-2">
            <p class="  font-weight-bold">
                    {{ __('Matching/Home') }}
          </p>
    </div>

   
		<div class="col-md-2">
			<div class="form-group mb-2">
				<input type="text" title="Set Distance "  onClick="this.select();" class="form-control" id="distance" value="5"  placeholder="Enter distance">    
			</div>
		</div>	
		
		<div class="col-md-3">
			<div class="form-group mx-sm-3 mb-2">
				<button type="button" onclick="getData('{{Auth::user()->id}}')" class="btn btn-outline-primary">  {{ __('View All Mutuals Nearby:') }} <x id="btn_set_mutual">{{count($my_mutuals)}}</x></button>   
			</div>
			</div>	
			
		<div class="col-md-3">
			<div class="form-group mb-2">
				<button type="button" onclick="getData('all')" class="btn btn-outline-primary"> {{ __('View All Nearby Users') }}</button>   
			</div>
		</div>
	
      
  </div>
</div>



    </x-slot>


    <div class="row"><div id="modal_place"></div>
    <div class="col-sm-3  "><div class=" left_panel">

 




        <div id="place_users_data"> </div>
    </div> </div>   
    <div class="col-sm-9">
      <div class="card" style="width: 100%;">
        <div class="card-body">  
            <div id="dvMap" style="height:500px"></div>
        </div>
      </div>      
    </div>

 </div> 
<p id="this_from_id" class="d-none">{{Auth::user()->id}}</p>
 

</x-app-layout>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap&v=weekly"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
<script>
 setInterval(function(){ response_chat(); console.log('response');}, 1000);
 getData('all');


 function getData(view) {

$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')
    }
});


if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
} else {
    x.innerHTML = "Geolocation is not supported by this browser.";
}

function showPosition(position) {
    var distance = document.getElementById("distance").value;
    var urls = '/get_users/' + view + '$' + position.coords.latitude + '$' + position.coords.longitude + '$' + distance;

    $.ajax({
        type: 'POST',

        url: urls,
        data: '_token = <?php echo csrf_token() ?>',
        success: function(data) {

            var markers = data;

            getLocation();

            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(showPosition);
                } else {
                    alert("Geolocation is not supported by this browser.");
                }
            }

            function showPosition(position) {

                var mapOptions = {
                    center: new google.maps.LatLng(position.coords.latitude, position.coords.longitude),
                    zoom: 12,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);

                //Create and open InfoWindow.
                var infoWindow = new google.maps.InfoWindow();

                var place_users_data='';

                for (var i = 0; i < markers.length; i++) {
                    var ind=Number(i)+1;
                    var data = markers[i];
                    place_users_data=place_users_data+`
                    <div class=" ">
                        <div class="card  " style="margin-top:15px;padding-top:15px;">
                            <div class="card-body shadow-lg ">
                                <p class="card-text">
                                    `+data['description_left']+`
                                </p>

                            </div>
                        </div>
                    </div>`;
 


                    var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                    var marker = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        icon: {
                            url: data.icon,
                            size: new google.maps.Size(36, 50),
                            scaledSize: new google.maps.Size(30),
                            anchor: new google.maps.Point(0, 50)
                        },

                        label: {
                            color: '#00aaff',
                            fontWeight: 'bold',
                            fontSize: '14px',
                            text: data.title
                        },

                        title: data.title
                    });

                    //Attach click event to the marker.
                    (function(marker, data) {
                        google.maps.event.addListener(marker, "click", function(e) {
                            //Wrap the content inside an HTML DIV in order to set height and width of InfoWindow.
                            infoWindow.setContent("<div style = 'width:200px;min-height:40px'>" + data.description + "</div>");
                            infoWindow.open(map, marker);
                        });
                    })(marker, data);
                }  $( "#place_users_data" ).html(place_users_data);
                //my location                 
                const myLatLng2 = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                new google.maps.Marker({
                    position: myLatLng2,
                    map,
                    title: "Hello!",
                });

            }
        }
    });
}


}


function like_dislike(id,btn) {
    document.getElementById('like'+id).classList.remove("active");
    document.getElementById('dislike'+id).classList.remove("active_red");
   
    if(btn=='dislike'){document.getElementById(btn+id).classList.add("active_red");
    }else{document.getElementById(btn+id).classList.add("active");}

    $('#'+btn+id).effect("bounce", {
      times: 4
    }, 1000);
    set_like_dislike(<?php echo Auth::user()->id; ?>,id,btn)
}

function like_dislike_left(id,btn) {
    document.getElementById('like_left'+id).classList.remove("active");
    document.getElementById('dislike_left'+id).classList.remove("active_red");
   
    if(btn=='dislike_left'){document.getElementById(btn+id).classList.add("active_red");
    }else{document.getElementById(btn+id).classList.add("active");}
   
    $('#'+btn+id).effect("bounce", {
      times: 4
    }, 1000);
    set_like_dislike(<?php echo Auth::user()->id; ?>,id,btn)
}



function set_like_dislike(from_id,to_id,type) {
    
$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': jQuery('meta[name="csrf-token"]').attr('content')
    }
});


    var urls = '/set_likes/' + from_id + '$' + to_id + '$' + type;

     $.ajax({
        type: 'POST',
        url: urls,
        data: '_token = <?php echo csrf_token() ?>',
        success: function(data) {
             
              if(data['match']==1){
                // document.getElementById("chatbox").classList.remove("d-none"); 
                var dta=`

                

<a href="#popup1" id="modal_button" class="btn d-none">Reveal Popup</a>
<div id="popup1" style="width: 50%;    box-shadow: 0 1rem 3rem rgb(0 0 0 / 18%) !important;
    text-align: center;" class="popup">
  <a href="#" class="close">&times;</a>
  <h2>It's a Match!</h2>
  <p>Mutual like indication</p>
</div>
<a href="#" class="close-popup"></a>


                `;

document.getElementById("modal_place").innerHTML=dta;    

document.getElementById("modal_button").click(); 

              }

             $('#btn_set_mutual').html(data['mutual']);
        }
    }); 

}

function ready_chat(from_id,to_id) {
    document.getElementById("chatbox").classList.remove("d-none");

    var urls = '/ready_chat/' + from_id + '$' + to_id;

     $.ajax({
        type: 'POST',
        url: urls,
        data: '_token = <?php echo csrf_token() ?>',
        success: function(data) {
            $('#chat_text').html(data);
  var elem = document.getElementById('chat_text');
  elem.scrollTop = elem.scrollHeight;
        }
    }); 


}
 

function submit_chat() {
    var from_id= $("#from_user").html();
    var to_id= $("#to_user").html();
    var sms= document.getElementById("chat_value").value;
    let result = sms.replace("?", "GHdbct");
      result = result.replace("$", "vdfgfdg");
      result = result.replace("#", "dfsf");
      
    var urls = '/store_chat/' + from_id + '$' + to_id+ '$' + result;

         $.ajax({
        type: 'POST',
        url: urls,
        data: '_token = <?php echo csrf_token() ?>',
        success: function(data) {
            document.getElementById("chat_value").value="";
            ready_chat(from_id,to_id);

        }
        });  
}



function response_chat() {
    var from_id= $("#this_from_id").html();
    var to_id= $("#to_user").html();
 
    var urls = '/response_chat/' + from_id + '$' + to_id;

     $.ajax({
        type: 'POST',
        url: urls,
        data: '_token = <?php echo csrf_token() ?>',
        success: function(data) {
          
         var fui=data['from_users_id'];
          
          
             if(data==1){
              
                document.getElementById("chatbox").classList.remove("d-none");
                ready_chat(from_id,to_id);
            }
              if(fui>1){
                console.log(this_from_id+'-'+fui);
               var this_from_id= $("#this_from_id").html();
                document.getElementById("chatbox").classList.remove("d-none");
                ready_chat(this_from_id,fui);
            }        
        }
    }); 
}



function close_chat() {
    document.getElementById("chatbox").classList.add("d-none");
}


var input = document.getElementById("chat_value");
input.addEventListener("keyup", function(event) {
  if (event.keyCode === 13) {
   event.preventDefault();
   document.getElementById("submit_chat").click();
  }
});


</script>

