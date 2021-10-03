package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2048:String;
      
      private var var_848:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_2048 = param1;
         var_848 = param2;
      }
      
      public function get postureType() : String
      {
         return var_2048;
      }
      
      public function get parameter() : String
      {
         return var_848;
      }
   }
}
