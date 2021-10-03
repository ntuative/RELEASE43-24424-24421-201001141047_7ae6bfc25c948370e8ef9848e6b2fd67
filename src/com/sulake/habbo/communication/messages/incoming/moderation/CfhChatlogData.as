package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_886:int;
      
      private var var_2076:int;
      
      private var var_1491:int;
      
      private var var_119:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1491 = param1.readInteger();
         var_2076 = param1.readInteger();
         var_886 = param1.readInteger();
         var_119 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1491);
      }
      
      public function get reportedUserId() : int
      {
         return var_886;
      }
      
      public function get callerUserId() : int
      {
         return var_2076;
      }
      
      public function get callId() : int
      {
         return var_1491;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_119;
      }
   }
}
