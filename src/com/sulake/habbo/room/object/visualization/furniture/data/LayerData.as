package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_348:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_593:int = 0;
      
      public static const const_833:int = 2;
      
      public static const const_897:int = 1;
      
      public static const const_627:Boolean = false;
      
      public static const const_514:String = "";
      
      public static const const_402:int = 0;
      
      public static const const_380:int = 0;
      
      public static const const_416:int = 0;
       
      
      private var var_1640:int = 0;
      
      private var var_1641:String = "";
      
      private var var_1395:int = 0;
      
      private var var_1642:int = 0;
      
      private var var_1644:Number = 0;
      
      private var var_1639:int = 255;
      
      private var var_1643:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1640;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1395 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1644;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1642 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1640 = param1;
      }
      
      public function get tag() : String
      {
         return var_1641;
      }
      
      public function get alpha() : int
      {
         return var_1639;
      }
      
      public function get ink() : int
      {
         return var_1395;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1644 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1642;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1643 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1643;
      }
      
      public function set tag(param1:String) : void
      {
         var_1641 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1639 = param1;
      }
   }
}
