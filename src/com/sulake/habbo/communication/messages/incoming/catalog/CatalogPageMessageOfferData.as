package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_812:Array;
      
      private var var_838:int;
      
      private var var_1261:String;
      
      private var _offerId:int;
      
      private var var_837:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1261 = param1.readString();
         var_838 = param1.readInteger();
         var_837 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_812 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_812.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_812;
      }
      
      public function get priceInCredits() : int
      {
         return var_838;
      }
      
      public function get localizationId() : String
      {
         return var_1261;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_837;
      }
   }
}
