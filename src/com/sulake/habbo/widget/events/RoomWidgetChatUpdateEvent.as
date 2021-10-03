package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetChatUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_129:int = 1;
      
      public static const const_267:int = 4;
      
      public static const const_223:int = 3;
      
      public static const const_116:int = 0;
      
      public static const const_709:String = "RWCUE_EVENT_CHAT";
      
      public static const const_99:int = 2;
       
      
      private var var_1988:int;
      
      private var var_203:String = "";
      
      private var var_1991:BitmapData;
      
      private var _userName:String;
      
      private var var_1135:int = 0;
      
      private var var_1992:uint;
      
      private var _userId:int = 0;
      
      private var _roomCategory:int;
      
      private var var_1989:Number;
      
      private var var_1990:Number;
      
      private var _roomId:int;
      
      public function RoomWidgetChatUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:int, param6:Number, param7:Number, param8:BitmapData, param9:uint, param10:int, param11:int, param12:int = 0, param13:Boolean = false, param14:Boolean = false)
      {
         super(param1,param13,param14);
         _userId = param2;
         var_203 = param3;
         var_1135 = param12;
         _userName = param4;
         var_1988 = param5;
         var_1989 = param6;
         var_1990 = param7;
         var_1991 = param8;
         var_1992 = param9;
         _roomId = param10;
         _roomCategory = param11;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get userImage() : BitmapData
      {
         return var_1991;
      }
      
      public function get text() : String
      {
         return var_203;
      }
      
      public function get userX() : Number
      {
         return var_1989;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get userCategory() : int
      {
         return var_1988;
      }
      
      public function get chatType() : int
      {
         return var_1135;
      }
      
      public function get userColor() : uint
      {
         return var_1992;
      }
      
      public function get userY() : Number
      {
         return var_1990;
      }
   }
}
