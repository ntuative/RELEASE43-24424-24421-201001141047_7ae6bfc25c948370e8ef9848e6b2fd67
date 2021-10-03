package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_651:String;
      
      private var var_2174:int;
      
      private var var_1504:Boolean;
      
      private var _roomId:int;
      
      private var var_2173:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1504 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_651 = param1.readString();
         var_2173 = param1.readInteger();
         var_2174 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1504;
      }
      
      public function get roomName() : String
      {
         return var_651;
      }
      
      public function get enterMinute() : int
      {
         return var_2174;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_2173;
      }
   }
}
