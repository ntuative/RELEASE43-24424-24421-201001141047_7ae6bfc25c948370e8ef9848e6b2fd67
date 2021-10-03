package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage
   {
      
      public static const const_464:String = "RWSUM_STICKIE_SEND_UPDATE";
      
      public static const const_676:String = "RWSUM_STICKIE_SEND_DELETE";
       
      
      private var var_626:String;
      
      private var var_159:int;
      
      private var var_203:String;
      
      public function RoomWidgetStickieSendUpdateMessage(param1:String, param2:int, param3:String = "", param4:String = "")
      {
         super(param1);
         var_159 = param2;
         var_203 = param3;
         var_626 = param4;
      }
      
      public function get objectId() : int
      {
         return var_159;
      }
      
      public function get text() : String
      {
         return var_203;
      }
      
      public function get colorHex() : String
      {
         return var_626;
      }
   }
}
