package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_921:PetData;
      
      private var var_1370:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1370 = param1.readBoolean();
         var_921 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1370 + ", " + var_921.id + ", " + var_921.name + ", " + pet.figure + ", " + var_921.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1370;
      }
      
      public function get pet() : PetData
      {
         return var_921;
      }
   }
}
