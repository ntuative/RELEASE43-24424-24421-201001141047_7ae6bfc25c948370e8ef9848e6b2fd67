package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1959:int = 0;
      
      private var var_1962:int = 0;
      
      private var var_1961:int = 0;
      
      private var var_1960:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_1962;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1962 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1959 = param1;
      }
      
      public function get credits() : int
      {
         return var_1961;
      }
      
      public function get clubDays() : int
      {
         return var_1959;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1960 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1961 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1960;
      }
   }
}
