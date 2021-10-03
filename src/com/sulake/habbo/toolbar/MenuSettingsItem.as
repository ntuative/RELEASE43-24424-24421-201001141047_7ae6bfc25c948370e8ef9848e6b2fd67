package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1551:Array;
      
      private var var_1540:String;
      
      private var var_1552:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1540 = param1;
         var_1551 = param2;
         var_1552 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1540;
      }
      
      public function get yieldList() : Array
      {
         return var_1551;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1552;
      }
   }
}
