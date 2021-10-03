package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.catalog.NodeData;
   
   public class CatalogIndexMessageParser implements IMessageParser
   {
       
      
      private var var_123:NodeData;
      
      public function CatalogIndexMessageParser()
      {
         super();
      }
      
      public function get root() : NodeData
      {
         return var_123;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_123 = new NodeData(param1);
         return true;
      }
      
      public function flush() : Boolean
      {
         var_123 = null;
         return true;
      }
   }
}
