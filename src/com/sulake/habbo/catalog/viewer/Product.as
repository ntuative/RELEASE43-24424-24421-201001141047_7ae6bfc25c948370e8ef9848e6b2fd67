package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import flash.display.BitmapData;
   
   public class Product extends ProductGridItem implements IProduct, IGetImageListener
   {
       
      
      private var var_1244:IProductData;
      
      private var var_1245:int;
      
      private var var_1243:String;
      
      private var var_1242:int;
      
      private var var_1001:String;
      
      private var _furnitureData:IFurnitureData;
      
      private var var_1000:int;
      
      public function Product(param1:CatalogPageMessageProductData, param2:IProductData, param3:IFurnitureData)
      {
         super();
         var_1243 = param1.productType;
         var_1242 = param1.furniClassId;
         var_1001 = param1.extraParam;
         var_1000 = param1.productCount;
         var_1245 = param1.expiration;
         var_1244 = param2;
         _furnitureData = param3;
      }
      
      public function get furnitureData() : IFurnitureData
      {
         return _furnitureData;
      }
      
      public function get productClassId() : int
      {
         return var_1242;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         Logger.log("[Product] Bundle Icon Image Ready!" + param1);
         setIconImage(param2);
      }
      
      public function get productType() : String
      {
         return var_1243;
      }
      
      override public function set view(param1:IWindowContainer) : void
      {
         super.view = param1;
         if(var_1000 > 1)
         {
            _view.findChildByName("multiContainer").visible = true;
            ITextWindow(_view.findChildByName("multiCounter")).text = "x" + productCount;
         }
      }
      
      public function get extraParam() : String
      {
         return var_1001;
      }
      
      public function get productCount() : int
      {
         return var_1000;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_1243 = "";
         var_1242 = 0;
         var_1001 = "";
         var_1000 = 0;
         var_1245 = 0;
         var_1244 = null;
      }
      
      public function initIcon(param1:IProductContainer, param2:IGetImageListener = null) : BitmapData
      {
         var _loc6_:* = null;
         var _loc3_:* = null;
         if(param2 == null)
         {
            param2 = {};
         }
         var _loc4_:IRoomEngine = (param1 as ProductContainer).offer.page.viewer.roomEngine;
         var _loc5_:IHabboCatalog = (param1 as ProductContainer).offer.page.viewer.catalog;
         switch(productType)
         {
            case ProductTypeEnum.const_76:
               _loc6_ = _loc4_.getFurnitureIcon(productClassId,param2);
               break;
            case ProductTypeEnum.const_74:
               _loc6_ = _loc4_.getWallItemIcon(productClassId,param2,var_1001);
               break;
            case ProductTypeEnum.const_215:
               _loc3_ = _loc5_.getPixelEffectIcon(productClassId);
               break;
            case ProductTypeEnum.const_389:
               _loc3_ = _loc5_.getSubscriptionProductIcon(productClassId);
               break;
            default:
               Logger.log("[Product] Can not yet handle this type of product: " + productType);
         }
         if(_loc6_ != null)
         {
            _loc3_ = _loc6_.data;
            if(param2 == this)
            {
               this.setIconImage(_loc3_);
            }
         }
         return _loc3_;
      }
      
      public function get expiration() : int
      {
         return var_1245;
      }
      
      public function get productData() : IProductData
      {
         return var_1244;
      }
   }
}
