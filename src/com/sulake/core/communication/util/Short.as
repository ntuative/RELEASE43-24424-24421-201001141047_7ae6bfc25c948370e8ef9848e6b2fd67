package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_620:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_620 = new ByteArray();
         var_620.writeShort(param1);
         var_620.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_620.position = 0;
         if(false)
         {
            _loc1_ = var_620.readShort();
            var_620.position = 0;
         }
         return _loc1_;
      }
   }
}
