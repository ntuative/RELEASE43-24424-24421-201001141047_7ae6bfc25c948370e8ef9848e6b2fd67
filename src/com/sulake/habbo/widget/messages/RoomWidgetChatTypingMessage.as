package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_554:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_435:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_554);
         var_435 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_435;
      }
   }
}
