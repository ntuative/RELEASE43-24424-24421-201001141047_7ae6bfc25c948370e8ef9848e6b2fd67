package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_189:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1859:Boolean = false;
      
      private var var_1858:int = 0;
      
      private var var_1856:int = 0;
      
      private var var_1857:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_189,param5,param6);
         var_1857 = param1;
         var_1856 = param2;
         var_1858 = param3;
         var_1859 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_1858;
      }
      
      public function get periodsLeft() : int
      {
         return var_1856;
      }
      
      public function get daysLeft() : int
      {
         return var_1857;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1859;
      }
   }
}
