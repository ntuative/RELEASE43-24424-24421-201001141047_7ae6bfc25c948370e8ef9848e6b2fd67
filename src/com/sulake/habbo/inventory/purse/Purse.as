package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2097:Boolean = false;
      
      private var var_2096:int = 0;
      
      private var var_1959:int = 0;
      
      private var var_2095:int = 0;
      
      private var var_1433:int = 0;
      
      private var var_1960:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1433 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2096;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2097;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2097 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2096 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1959 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1433;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2095 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1959;
      }
      
      public function get pixelBalance() : int
      {
         return var_2095;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1960 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1960;
      }
   }
}
