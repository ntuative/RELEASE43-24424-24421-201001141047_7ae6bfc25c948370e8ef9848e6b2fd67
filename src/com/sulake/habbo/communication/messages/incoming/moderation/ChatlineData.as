package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1461:String;
      
      private var var_1652:int;
      
      private var var_1653:int;
      
      private var var_1654:int;
      
      private var var_1651:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1652 = param1.readInteger();
         var_1654 = param1.readInteger();
         var_1653 = param1.readInteger();
         var_1651 = param1.readString();
         var_1461 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1461;
      }
      
      public function get hour() : int
      {
         return var_1652;
      }
      
      public function get minute() : int
      {
         return var_1654;
      }
      
      public function get chatterName() : String
      {
         return var_1651;
      }
      
      public function get chatterId() : int
      {
         return var_1653;
      }
   }
}
