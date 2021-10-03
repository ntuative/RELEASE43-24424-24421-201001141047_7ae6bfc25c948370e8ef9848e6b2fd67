package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_680:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_628:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_256:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1354:Point;
      
      private var var_1353:Rectangle;
      
      private var var_197:Number = 0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1353 = param2;
         var_1354 = param3;
         var_197 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1353 != null)
         {
            return var_1353.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_197;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1354 != null)
         {
            return var_1354.clone();
         }
         return null;
      }
   }
}
