package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_110:String = "RWPUE_VOTE_RESULT";
      
      public static const const_115:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1185:int;
      
      private var var_894:String;
      
      private var var_643:Array;
      
      private var var_930:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_894 = param2;
         var_930 = param3;
         var_643 = param4;
         if(var_643 == null)
         {
            var_643 = [];
         }
         var_1185 = param5;
      }
      
      public function get votes() : Array
      {
         return var_643.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1185;
      }
      
      public function get question() : String
      {
         return var_894;
      }
      
      public function get choices() : Array
      {
         return var_930.slice();
      }
   }
}
