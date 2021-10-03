package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_1907:Number = 0;
      
      private var var_1908:Number = 0;
      
      private var var_1909:Number = 0;
      
      private var var_1910:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1908 = param1;
         var_1909 = param2;
         var_1907 = param3;
         var_1910 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1908;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1907;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1909;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1910;
      }
   }
}
