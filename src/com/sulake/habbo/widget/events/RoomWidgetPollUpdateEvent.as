package com.sulake.habbo.widget.events
{
   public class RoomWidgetPollUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_108:String = "RWPUW_CONTENT";
      
      public static const const_107:String = "RWPUW_OFFER";
      
      public static const const_61:String = "RWPUW_ERROR";
       
      
      private var var_919:Array = null;
      
      private var var_1096:String = "";
      
      private var var_1145:String;
      
      private var var_1097:String = "";
      
      private var var_918:int = 0;
      
      private var _id:int = -1;
      
      public function RoomWidgetPollUpdateEvent(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         _id = param1;
         super(param2,param3,param4);
      }
      
      public function get questionArray() : Array
      {
         return var_919;
      }
      
      public function get startMessage() : String
      {
         return var_1096;
      }
      
      public function get summary() : String
      {
         return var_1145;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1096 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_918 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1145 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_918;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1097 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1097;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_919 = param1;
      }
   }
}
