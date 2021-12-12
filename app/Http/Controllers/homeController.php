<?php

namespace App\Http\Controllers;
 
use Illuminate\Http\Request;
use App\Models\all_users;
use App\Models\users_likes;
use App\Models\users_chat;
use Auth;
use Illuminate\Support\Facades\DB;

class homeController extends Controller
{   
    public function all_users_details()
    {
       $all_users_details=all_users::all();
       $new_array=array();
       foreach($all_users_details as $key=>$all_users_details_single){
           $key2= $all_users_details_single['id'];
           $new_array[$key2]=$all_users_details_single;
       } 
       return $new_array;
    }
  
  
    
      

    public function distance($lat1, $lon1, $lat2, $lon2, $unit)
    {
        if (($lat1 == $lat2) && ($lon1 == $lon2)) {
            return 0;
          }
          else {
            $theta = $lon1 - $lon2;
            $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
            $dist = acos($dist);
            $dist = rad2deg($dist);
            $miles = $dist * 60 * 1.1515;
            $unit = strtoupper($unit);
        
            if ($unit == "K") {
              return round(($miles * 1.609344));
            } else if ($unit == "N") {
              return ($miles * 0.8684);
            } else {
              return $miles;
            }
          }
    }
  
    public function test_distance(){
        echo  $this->distance(24.464310013628012, 89.71295017018511, 24.424732526582652, 89.60259089234431, "K");  
    }
    
  
    public function who_likes_me($id)
    {
        $my_id = $id;
        $my_user_likes=users_likes::all()->where('likes','=','1')->where('from_users_id','=',$my_id);
        $all_users_likes=users_likes::all()->where('likes','=','1');
        

        $who_likes_me=array();

        //jake jake like disilam ami
         foreach($my_user_likes as $my_user_likes_each){
                
                //kake like disilam
                $my_to_users_id=$my_user_likes_each['to_users_id'];

                //uni ki amake like diasilo?
                foreach($all_users_likes as $key=>$all_users_likes_each){
                     if(($all_users_likes_each['from_users_id']==$my_to_users_id) && ($all_users_likes_each['to_users_id']==$my_id)){
                         //uni ke
                          $who_likes_me[$all_users_likes_each['from_users_id']]=$all_users_likes_each['from_users_id'];  
                     }    
                }

        }  return $who_likes_me;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   $my_id = Auth::user()->id;
        $my_mutuals=$this->who_likes_me($my_id);
        return view('dashboard', compact('my_mutuals'));
    }

    public function set_likes($user)
    {
        $from_id=explode('$',$user)['0'];
        $to_id=explode('$',$user)['1'];
        $type=explode('$',$user)['2'];

        if($type=='dislike_left' || $type=='dislike'){$type='0';}else {
             $type='1';
        }
        
       $like_condition=users_likes::all()->where('from_users_id','=',$from_id)->where('to_users_id','=',$to_id);
       $count=count($like_condition);
       //return $count.'/'.$from_id.'-'.$to_id.'-'.$type;
       if($count==0){
           //no row insrt
           $users_likes = new users_likes;
           $users_likes->from_users_id=$from_id;
           $users_likes->to_users_id=$to_id;
           $users_likes->likes=$type;
           $users_likes->save();
       }
         else{
            //yes row update
             users_likes::where('from_users_id', $from_id)
            ->where('to_users_id', $to_id)
            ->update(['likes' => $type]);        
       } 

      //does it match?
       $match_1=users_likes::all()->where('to_users_id','=',$from_id)
       ->where('from_users_id','=',$to_id)->where('likes','=','1');

       $match_2=users_likes::all()->where('to_users_id','=',$to_id)
       ->where('from_users_id','=',$from_id)->where('likes','=','1');


        if(count($match_1)>0 && count($match_2)>0){
                $data['match']=1;
        }else {$data['match']=0;}

       $always_mutuals=$this->who_likes_me($from_id);
       $data['mutual']=count($always_mutuals);
       return ($data);
       //echo $count;
    }


    
    public function store_chat($user)
    {
        $from=explode('$',$user)['0'];
        $to=explode('$',$user)['1'];
        $sms=explode('$',$user)['2'];
        $sms=str_replace("GHdbct","?",$sms);
        $sms=str_replace("vdfgfdg","$",$sms);
        $sms=str_replace("dfsf","#",$sms);
        $users_chat = new users_chat;
        $users_chat->from_users_id=$from;
        $users_chat->to_users_id=$to;
        $users_chat->sms=$sms;
        $users_chat->save();   

      return 'success';

    }

    public function response_chat($user)
    {
        $from=explode('$',$user)['0'];
        $to=explode('$',$user)['1'];
      
        $all_users_chat=users_chat::all()->where('to_users_id','=',$from)
        ->where('seen','=','0');
      
      foreach($all_users_chat as $all_users_chat_single){
      return($all_users_chat_single);
      }
      
      
      
              //  if(count($all_users_chat)>0){return '2';}else{return '0';}
    }

    public function ready_chat($user)
    {
        $from=explode('$',$user)['0'];
        $to=explode('$',$user)['1'];
        
        //seen
        $users_chat = users_chat::where("to_users_id", $from)->update(["seen" => '1']);

            $all_users_chat=users_chat::all();
            $all_users=$this->all_users_details();
            $chat_string=' <p class="d-none" id="from_user">'.$from.'</p><p  id="to_user" class="d-none">'.$to.'</p>';
       
            foreach($all_users_chat as $all_users_chat_single){
                if((($all_users_chat_single['from_users_id']==$from) && ($all_users_chat_single['to_users_id']==$to)) ||
                    (($all_users_chat_single['from_users_id']==$to) && ($all_users_chat_single['to_users_id']==$from))
                )
                {
        
                if($all_users_chat_single['from_users_id']==$to){   
                $chat_string=$chat_string.'
                <div class="direct-chat-msg">
                <div class="direct-chat-info clearfix">
                <span class="direct-chat-name pull-left">'.$all_users[$to]['name'].'</span>
                <span class="direct-chat-timestamp pull-right">'.$all_users_chat_single['created_at'].'</span>
                </div>
                <img class="direct-chat-img"  src="storage/'.$all_users[$to]['profile_photo_path'].'" alt="Message User Image"><!-- /.direct-chat-img -->
                <div class="direct-chat-text">
                '.$all_users_chat_single["sms"].'
                </div>
                </div>   
                '; 
                }else{
                    $chat_string=$chat_string.'
                    <div class="direct-chat-msg right">
                    <div class="direct-chat-info clearfix">
                      <span class="direct-chat-name pull-right">'.$all_users[$from]['name'].'</span>
                      <span class="direct-chat-timestamp pull-left">'.$all_users_chat_single['created_at'].'</span>
                    </div>
                    <img class="direct-chat-img" src="storage/'.$all_users[$from]['profile_photo_path'].'" alt="Message User Image"> 
                    <div class="direct-chat-text">
                    '.$all_users_chat_single["sms"].'
                    </div>
                  </div> '; 
                   }
                }
            } 

        return ($chat_string);
 
    }


    public function get_users($user)
    {
            $btn_chat='0';
            $my_id = Auth::user()->id;
            $all_users=$this->all_users_details();
            $get_user=explode('$',$user)['0'];
            if($get_user=='all'){
                foreach($all_users as $key=>$all_users_each){
                    $this_id=$all_users_each['id'];
                    if($this_id!=$my_id){$selected_users[$key]=$this_id;}
                    
                }
            }else{
              $btn_chat='1';
              $selected_users=$this->who_likes_me($get_user); 
            }  
 
            $always_mutuals=$this->who_likes_me($get_user);
    

            $my_array=array();
            $x=0;

            $lat=explode('$',$user)['1'];
            $lng=explode('$',$user)['2'];
            $dis=explode('$',$user)['3'];   

                        
            $User_Update = all_users::where("id", $my_id)->update(["lat" => $lat,"lng" => $lng]);

            foreach($selected_users as $selected_users_each){
            
                $lat_this=$all_users[$selected_users_each]['lat'];
                $lng_this=$all_users[$selected_users_each]['lng'];

                //get distance
                $distance_calculate=$this->distance($lat, $lng, $lat_this, $lng_this, "K"); 
                
                if($distance_calculate<=$dis){
                    
                    $id=$selected_users_each;

                    $current_date = date('Y-m-d');
                    $to = \Carbon\Carbon::createFromFormat('Y-m-d', $current_date);
                    $from = \Carbon\Carbon::createFromFormat('Y-m-d', $all_users[$selected_users_each]['dob']);
                    $age = date_diff($to, $from)->y;
                    
                    //select liked
                     $like_condition=users_likes::all()->where('from_users_id','=',$my_id)->where('to_users_id','=',$selected_users_each)->where('likes','=','1');
                     if(count($like_condition)>0){$class_like="active";}else{$class_like="";};

                     $like_condition=users_likes::all()->where('from_users_id','=',$my_id)->where('to_users_id','=',$selected_users_each)->where('likes','=','0');
                     if(count($like_condition)>0){$class_dislike="active_red";}else{$class_dislike="";};
                     $chat='';
                    //available for chat for mutuals

                    
                   if($btn_chat=='1'){
                        $chat='<button type="button" onclick="ready_chat(\''.$get_user.'\',\''.$id.'\')" class="btn btn-outline-primary">Chat</button>';
                    }else{
                        $chat='';
                    }
                    

                    $my_array[$x]['icon']='storage/'.$all_users[$selected_users_each]['profile_photo_path'];
                    $my_array[$x]['title']= $all_users[$selected_users_each]['name'];
                    $my_array[$x]['lat']=$lat_this;
                    $my_array[$x]['lng']=$lng_this;
                    $my_array[$x]['email']= $all_users[$selected_users_each]['email'];

                    $my_array[$x]['description']= 
                    '<h3 style="text-align:center"><img style="width:70px" src="storage/'.$all_users[$selected_users_each]['profile_photo_path'].'" alt=""></h3><h5><b></b>'.$all_users[$selected_users_each]['name'].
                    '</h5><br><p style="margin-top:-20px"><b>Email: </b>'.$all_users[$selected_users_each]['email'].
                    '<br><b>Age: </b>'.$age.'<br><b>Gender: </b>'.$all_users[$selected_users_each]['gender'].'<br><b>Distance from you: </b>'.$distance_calculate.' Km'.
                    '</p>
                    <div class="center">
                    <div class="dislike  '.$class_dislike.'"  id="dislike'.$selected_users_each.'"  onclick="like_dislike('.$selected_users_each.',\'dislike\')">
                          <i class="fa fa-thumbs-down"></i>
                          <i class="outer fa fa-circle-thin"></i>
                    </div>
                    <div class="like   '.$class_like.'" id="like'.$selected_users_each.'"  onclick="like_dislike('.$selected_users_each.',\'like\')">
                          <i class="fa fa-heart"></i>
                          <i class="outer fa fa-circle-thin"></i>
                    </div>'.$chat.' 
                   </div>
                    ';

                    $my_array[$x]['description_left']= 
                    '
                    <div class="row">
                    <div class="col-md-4 col-xs-4"
                        <h3 style="text-align:center"><img style="width:70px" src="storage/'.$all_users[$selected_users_each]['profile_photo_path'].'" alt=""></h3>
                    </div>

                    <div class="col-md-8 col-xs-8"
                         <h4><b>'.$all_users[$selected_users_each]['name'].'</b></h4>

                        <br><p style=" ">'.$all_users[$selected_users_each]['email'].
                        '<br><b>Age: </b>'.$age.' <b>Gender: </b>'.$all_users[$selected_users_each]['gender'].' <b>Distance from you: </b>'.$distance_calculate.' Km'.
                        '</p>

                    </div>

                    <div class="col-md-12 col-xs-12"
                    <div class="center">
                    <div class="dislike  '.$class_dislike.'"  id="dislike_left'.$selected_users_each.'"  onclick="like_dislike_left('.$selected_users_each.',\'dislike_left\')">
                          <i class="fa fa-thumbs-down"></i>
                          <i class="outer fa fa-circle-thin"></i>
                    </div>
                    <div class="like  '.$class_like.'" id="like_left'.$selected_users_each.'"  onclick="like_dislike_left('.$selected_users_each.',\'like_left\')">
                          <i class="fa fa-heart"></i>
                          <i class="outer fa fa-circle-thin"></i>
                    </div>
                    '.$chat.' 
                   </div>
                   </div>
                   </div>
                    ';


                    $x++;
                }
            }
        return $my_array;  
    }

    public function mutuals()
    {    
        $all_users_details=$this->all_users_details();
        //return $all_users_details['1']['email'];
        $my_mutuals=$this->who_likes_me(Auth::user()->id);
        return view('mutuals', compact('my_mutuals', 'all_users_details'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
