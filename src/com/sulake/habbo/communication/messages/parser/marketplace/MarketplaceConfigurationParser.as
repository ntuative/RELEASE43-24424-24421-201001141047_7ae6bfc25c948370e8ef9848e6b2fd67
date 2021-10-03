package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1646:int;
      
      private var var_972:int;
      
      private var var_1647:int;
      
      private var var_1648:int;
      
      private var var_1649:int;
      
      private var var_1435:int;
      
      private var var_1645:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1646;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_972;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1648;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1649;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1435;
      }
      
      public function get commission() : int
      {
         return var_1647;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1645;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1645 = param1.readBoolean();
         var_1647 = param1.readInteger();
         var_972 = param1.readInteger();
         var_1435 = param1.readInteger();
         var_1648 = param1.readInteger();
         var_1646 = param1.readInteger();
         var_1649 = param1.readInteger();
         return true;
      }
   }
}
