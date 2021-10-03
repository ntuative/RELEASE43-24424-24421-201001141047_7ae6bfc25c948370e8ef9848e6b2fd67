package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPresentDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_406:String = "RWPDUE_CONTENTS_CLUB";
      
      public static const const_367:String = "RWPDUE_CONTENTS_LANDSCAPE";
      
      public static const const_75:String = "RWPDUE_CONTENTS";
      
      public static const const_420:String = "RWPDUE_CONTENTS_WALLPAPER";
      
      public static const const_419:String = "RWPDUE_CONTENTS_FLOOR";
      
      public static const const_58:String = "RWPDUE_PACKAGEINFO";
       
      
      private var var_203:String;
      
      private var var_1600:BitmapData;
      
      private var var_159:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetPresentDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_159 = param2;
         var_203 = param3;
         _controller = param4;
         var_1600 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_1600;
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
