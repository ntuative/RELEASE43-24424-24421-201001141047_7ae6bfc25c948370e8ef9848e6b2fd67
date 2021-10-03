package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1003:int = 0;
      
      private var var_1079:int = 0;
      
      private var var_1590:String = "";
      
      private var var_1002:int = 0;
      
      private var var_1585:String = "";
      
      private var var_1587:int = 0;
      
      private var var_1473:String = "";
      
      private var var_1588:int = 0;
      
      private var var_1586:int = 0;
      
      private var var_1589:String = "";
      
      private var var_1591:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1588 = param1;
         var_1589 = param2;
         var_1473 = param3;
         var_1590 = param4;
         var_1585 = param5;
         if(param6)
         {
            var_1079 = 1;
         }
         else
         {
            var_1079 = 0;
         }
         var_1587 = param7;
         var_1586 = param8;
         var_1002 = param9;
         var_1591 = param10;
         var_1003 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1588,var_1589,var_1473,var_1590,var_1585,var_1079,var_1587,var_1586,var_1002,var_1591,var_1003];
      }
      
      public function dispose() : void
      {
      }
   }
}
