package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_668:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1641:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_668);
         var_1641 = param1;
      }
      
      public function get tag() : String
      {
         return var_1641;
      }
   }
}
