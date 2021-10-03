package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1554:int;
      
      private var var_1063:PetData;
      
      private var var_1553:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1554;
      }
      
      public function get petData() : PetData
      {
         return var_1063;
      }
      
      public function flush() : Boolean
      {
         var_1063 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1553;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1554 = param1.readInteger();
         var_1553 = param1.readInteger();
         var_1063 = new PetData(param1);
         return true;
      }
   }
}
