package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_904:String = "price_type_none";
      
      public static const const_345:String = "pricing_model_multi";
      
      public static const const_395:String = "price_type_credits";
      
      public static const const_441:String = "price_type_credits_and_pixels";
      
      public static const const_384:String = "pricing_model_bundle";
      
      public static const const_418:String = "pricing_model_single";
      
      public static const const_503:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1297:String = "pricing_model_unknown";
      
      public static const const_433:String = "price_type_pixels";
       
      
      private var var_838:int;
      
      private var _offerId:int;
      
      private var var_837:int;
      
      private var var_409:String;
      
      private var var_565:String;
      
      private var var_2053:int;
      
      private var var_642:ICatalogPage;
      
      private var var_1261:String;
      
      private var var_408:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1261 = param1.localizationId;
         var_838 = param1.priceInCredits;
         var_837 = param1.priceInPixels;
         var_642 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(_loc4_.productType);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_409;
      }
      
      public function get page() : ICatalogPage
      {
         return var_642;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2053 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_408;
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
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1261 = "";
         var_838 = 0;
         var_837 = 0;
         var_642 = null;
         if(var_408 != null)
         {
            var_408.dispose();
            var_408 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_565;
      }
      
      public function get previewCallbackId() : int
      {
         return var_2053;
      }
      
      public function get priceInCredits() : int
      {
         return var_838;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_409 = const_418;
            }
            else
            {
               var_409 = const_345;
            }
         }
         else if(param1.length > 1)
         {
            var_409 = const_384;
         }
         else
         {
            var_409 = const_1297;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_409)
         {
            case const_418:
               var_408 = new SingleProductContainer(this,param1);
               break;
            case const_345:
               var_408 = new MultiProductContainer(this,param1);
               break;
            case const_384:
               var_408 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_409);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_838 > 0 && var_837 > 0)
         {
            var_565 = const_441;
         }
         else if(var_838 > 0)
         {
            var_565 = const_395;
         }
         else if(var_837 > 0)
         {
            var_565 = const_433;
         }
         else
         {
            var_565 = const_904;
         }
      }
   }
}
