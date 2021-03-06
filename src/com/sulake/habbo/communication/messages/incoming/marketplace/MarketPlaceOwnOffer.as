package com.sulake.habbo.communication.messages.incoming.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOwnOffer
   {
      
      public static const const_1431:int = 2;
      
      public static const const_1515:int = 1;
      
      public static const const_1446:int = 0;
       
      
      private var var_1160:int;
      
      private var var_357:int;
      
      private var var_2294:int;
      
      private var _offerId:int;
      
      private var _furniType:int;
      
      private var var_1808:int;
      
      private var _image:BitmapData;
      
      public function MarketPlaceOwnOffer(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         _offerId = param1;
         var_1808 = param2;
         _furniType = param3;
         var_1160 = param4;
      }
      
      public function get furniId() : int
      {
         return var_1808;
      }
      
      public function get furniType() : int
      {
         return _furniType;
      }
      
      public function get price() : int
      {
         return var_1160;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
   }
}
