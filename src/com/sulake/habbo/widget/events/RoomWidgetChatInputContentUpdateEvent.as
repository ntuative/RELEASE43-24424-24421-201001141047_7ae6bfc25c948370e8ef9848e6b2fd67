package com.sulake.habbo.widget.events
{
   public class RoomWidgetChatInputContentUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_1008:String = "whisper";
      
      public static const const_1315:String = "shout";
      
      public static const const_648:String = "RWWCIDE_CHAT_INPUT_CONTENT";
       
      
      private var var_2012:String = "";
      
      private var _userName:String = "";
      
      public function RoomWidgetChatInputContentUpdateEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_648,param3,param4);
         var_2012 = param1;
         _userName = param2;
      }
      
      public function get messageType() : String
      {
         return var_2012;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
