package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetBadgeImageUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_537:String = "RWBIUE_BADGE_IMAGE";
       
      
      private var var_2133:BitmapData;
      
      private var var_2073:String;
      
      public function RoomWidgetBadgeImageUpdateEvent(param1:String, param2:BitmapData, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_537,param3,param4);
         var_2073 = param1;
         var_2133 = param2;
      }
      
      public function get badgeImage() : BitmapData
      {
         return var_2133;
      }
      
      public function get badgeID() : String
      {
         return var_2073;
      }
   }
}
