package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_2051:int;
      
      private var var_2049:int;
      
      private var var_2088:Boolean;
      
      private var var_2090:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2089:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_2049 = param1;
         var_2051 = param2;
         var_2090 = param3;
         var_2089 = param4;
         var_2088 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2049,var_2051,var_2090,var_2089,int(var_2088)];
      }
      
      public function dispose() : void
      {
      }
   }
}
