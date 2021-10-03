package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.PurchaseErrorMessageParser;
   
   public class PurchaseErrorMessageEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function PurchaseErrorMessageEvent(param1:Function)
      {
         super(param1,PurchaseErrorMessageParser);
      }
      
      public function getParser() : PurchaseErrorMessageParser
      {
         return this.var_21 as PurchaseErrorMessageParser;
      }
   }
}
