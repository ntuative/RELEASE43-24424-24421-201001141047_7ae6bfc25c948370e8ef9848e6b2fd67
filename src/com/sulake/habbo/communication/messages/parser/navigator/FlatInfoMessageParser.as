package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_242:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_242 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_242;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_242 = new RoomSettingsFlatInfo();
         var_242.allowFurniMoving = param1.readInteger() == 1;
         var_242.doorMode = param1.readInteger();
         var_242.id = param1.readInteger();
         var_242.ownerName = param1.readString();
         var_242.type = param1.readString();
         var_242.name = param1.readString();
         var_242.description = param1.readString();
         var_242.showOwnerName = param1.readInteger() == 1;
         var_242.allowTrading = param1.readInteger() == 1;
         var_242.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}
