package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct
   {
       
      
      private var var_992:IID;
      
      private var var_399:uint;
      
      private var var_1217:IUnknown;
      
      private var var_1218:String;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_992 = param1;
         var_1218 = getQualifiedClassName(var_992);
         var_1217 = param2;
         var_399 = 0;
      }
      
      public function get iid() : IID
      {
         return var_992;
      }
      
      public function get references() : uint
      {
         return var_399;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_399) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1217;
      }
      
      public function get iis() : String
      {
         return var_1218;
      }
      
      public function reserve() : uint
      {
         return ++var_399;
      }
      
      public function dispose() : void
      {
         var_992 = null;
         var_1218 = null;
         var_1217 = null;
         var_399 = 0;
      }
   }
}
