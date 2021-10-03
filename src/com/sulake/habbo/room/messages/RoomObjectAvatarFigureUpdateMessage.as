package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1617:String;
      
      private var var_559:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_559 = param1;
         var_1617 = param2;
      }
      
      public function get race() : String
      {
         return var_1617;
      }
      
      public function get figure() : String
      {
         return var_559;
      }
   }
}
