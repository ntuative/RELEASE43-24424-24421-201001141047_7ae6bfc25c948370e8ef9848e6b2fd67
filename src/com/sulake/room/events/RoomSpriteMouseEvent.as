package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1625:Boolean = false;
      
      private var var_1624:Boolean = false;
      
      private var var_1745:String = "";
      
      private var _type:String = "";
      
      private var var_1623:Boolean = false;
      
      private var var_1749:Number = 0;
      
      private var var_1747:Number = 0;
      
      private var var_1746:Number = 0;
      
      private var var_1744:String = "";
      
      private var var_1748:Number = 0;
      
      private var var_1626:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1744 = param2;
         var_1745 = param3;
         var_1747 = param4;
         var_1746 = param5;
         var_1749 = param6;
         var_1748 = param7;
         var_1626 = param8;
         var_1624 = param9;
         var_1623 = param10;
         var_1625 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1626;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1625;
      }
      
      public function get localX() : Number
      {
         return var_1749;
      }
      
      public function get localY() : Number
      {
         return var_1748;
      }
      
      public function get canvasId() : String
      {
         return var_1744;
      }
      
      public function get altKey() : Boolean
      {
         return var_1624;
      }
      
      public function get spriteTag() : String
      {
         return var_1745;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1747;
      }
      
      public function get screenY() : Number
      {
         return var_1746;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1623;
      }
   }
}
