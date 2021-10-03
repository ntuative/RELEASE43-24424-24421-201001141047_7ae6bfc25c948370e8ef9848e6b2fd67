package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_110:String = "RSPE_VOTE_RESULT";
      
      public static const const_115:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1185:int = 0;
      
      private var var_894:String = "";
      
      private var var_643:Array;
      
      private var var_930:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_930 = [];
         var_643 = [];
         super(param1,param2,param7,param8);
         var_894 = param3;
         var_930 = param4;
         var_643 = param5;
         if(var_643 == null)
         {
            var_643 = [];
         }
         var_1185 = param6;
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
