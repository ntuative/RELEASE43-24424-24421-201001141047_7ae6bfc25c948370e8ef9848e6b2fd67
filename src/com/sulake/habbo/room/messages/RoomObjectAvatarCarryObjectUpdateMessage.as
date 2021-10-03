package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1032:int;
      
      private var var_1288:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1032 = param1;
         var_1288 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1032;
      }
      
      public function get itemName() : String
      {
         return var_1288;
      }
   }
}
