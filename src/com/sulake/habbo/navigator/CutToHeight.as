package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements BinarySearchTest
   {
       
      
      private var var_180:String;
      
      private var var_391:int;
      
      private var var_203:ITextWindow;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_180 = param1;
         var_203 = param2;
         var_391 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_203.text = var_180.substring(0,param1) + "...";
         return var_203.textHeight > var_391;
      }
   }
}
