package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2057:Number;
      
      private var var_571:Number = 0;
      
      private var var_2056:Number;
      
      private var var_572:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_2057 = param1;
         var_2056 = param2;
      }
      
      public function update() : void
      {
         var_572 += var_2056;
         var_571 += var_572;
         if(var_571 > 0)
         {
            var_571 = 0;
            var_572 = var_2057 * -1 * var_572;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_572 = param1;
         var_571 = 0;
      }
      
      public function get location() : Number
      {
         return var_571;
      }
   }
}
