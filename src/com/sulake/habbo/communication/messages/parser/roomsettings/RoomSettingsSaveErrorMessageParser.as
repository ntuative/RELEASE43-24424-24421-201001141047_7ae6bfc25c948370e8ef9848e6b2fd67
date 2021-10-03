package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1484:int = 9;
      
      public static const const_1587:int = 4;
      
      public static const const_1429:int = 1;
      
      public static const const_1263:int = 10;
      
      public static const const_1499:int = 2;
      
      public static const const_1220:int = 7;
      
      public static const const_1341:int = 11;
      
      public static const const_1596:int = 3;
      
      public static const const_1196:int = 8;
      
      public static const const_1207:int = 5;
      
      public static const const_1452:int = 6;
      
      public static const const_1318:int = 12;
       
      
      private var var_1879:String;
      
      private var _roomId:int;
      
      private var var_1061:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1879;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1061 = param1.readInteger();
         var_1879 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1061;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
