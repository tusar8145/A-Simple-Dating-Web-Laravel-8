<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

 
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Mail;
 use Session;
use App\Models\all_users;
use App\Models\users_likes;
use Illuminate\Mail\Mailable;
class UserController extends Controller
{
  public function all_users_details($data)
    {
       $all_users_details=all_users::all();
       $new_array=array();
       foreach($all_users_details as $key=>$all_users_details_single){
           $key2= $all_users_details_single['id'];
         if (in_array($key2, $data))
            {
          $new_array[$key2]=$all_users_details_single;
            }
          else
            {

            }
           
       } 
       return $new_array;
    }
  
   public function who_likes_me($id)
    {
        $my_id = $id;
        $my_user_likes=users_likes::all()->where('likes','=','1')->where('from_users_id','=',$my_id);
        $all_users_likes=users_likes::all()->where('likes','=','1');
        

        $who_likes_me=array();
		$sl=0;
        //jake jake like disilam ami
         foreach($my_user_likes as $my_user_likes_each){
                
                //kake like disilam
                $my_to_users_id=$my_user_likes_each['to_users_id'];

                //uni ki amake like diasilo?
                foreach($all_users_likes as $key=>$all_users_likes_each){
                     if(($all_users_likes_each['from_users_id']==$my_to_users_id) && ($all_users_likes_each['to_users_id']==$my_id)){
                         //uni ke
                          $who_likes_me[$sl]=$all_users_likes_each['from_users_id'];   $sl++;
                     }     
                }

        }  return $who_likes_me;
    }
    function index(Request $request)
    {
       $user= User::where('email', $request->email)->first();
      $mail_id=$request->email;
        // print_r($data);
            if (!$user || !Hash::check($request->password, $user->password)) {
                return response([
                    'message' => ['These credentials do not match our records.']
                ], 404);
            }
        
             $token = $user->createToken('my-app-token')->plainTextToken;
        
      
             $response = [
                'user' => $user['id'],
                'token' => $token
            ];  
     		 $user_id=$user['id'];
              $data= $this->who_likes_me($user_id);
             array_unique($data);
               $data= $this->all_users_details($data);
             $data['response']=$response;

 
 
     
      $mail_id=$request->email;
 
      
     Mail::send([], $data, function($message) use ($mail_id) {
        $rand=rand(0000,9999);
        $site=env('APP_NAME');    
        $from=env('MAIL_USERNAME');
        $message->to($mail_id, $site)->subject('New Login.Your OTP '.$rand);
        $message->from($from, $site);
    }); 
   
 

      
        
      
      
              return response($data, 201);
      
      
    }
	
	  
}
