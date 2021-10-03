package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_531:Array;
      
      private var var_1160:int;
      
      private var var_1368:Array;
      
      private var var_532:Array;
      
      private var var_1645:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1645 = _loc2_.isWrappingEnabled;
         var_1160 = _loc2_.wrappingPrice;
         var_1368 = _loc2_.stuffTypes;
         var_532 = _loc2_.boxTypes;
         var_531 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_531;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1368;
      }
      
      public function get price() : int
      {
         return var_1160;
      }
      
      public function get boxTypes() : Array
      {
         return var_532;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1645;
      }
   }
}
