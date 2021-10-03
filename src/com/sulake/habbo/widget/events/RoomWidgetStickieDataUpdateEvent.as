package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_570:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_203:String;
      
      private var var_626:String;
      
      private var var_1383:String;
      
      private var var_159:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_159 = param2;
         var_1383 = param3;
         var_203 = param4;
         var_626 = param5;
         _controller = param6;
      }
      
      public function get objectType() : String
      {
         return var_1383;
      }
      
      public function get colorHex() : String
      {
         return var_626;
      }
      
      public function get text() : String
      {
         return var_203;
      }
      
      public function get objectId() : int
      {
         return var_159;
      }
      
      public function get controller() : Boolean
      {
         return _controller;
      }
   }
}
