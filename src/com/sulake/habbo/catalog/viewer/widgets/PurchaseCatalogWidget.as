package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_1662:XML;
      
      private var var_1360:ITextWindow;
      
      private var var_1361:ITextWindow;
      
      private var var_1658:XML;
      
      private var var_747:IWindowContainer;
      
      private var var_2210:ITextWindow;
      
      private var var_1661:String = "";
      
      private var var_2275:IButtonWindow;
      
      private var var_1660:XML;
      
      private var var_1362:ITextWindow;
      
      private var var_1659:XML;
      
      private var var_746:IButtonWindow;
      
      private var var_153:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_395:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1658) as IWindowContainer;
               break;
            case Offer.const_433:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1659) as IWindowContainer;
               break;
            case Offer.const_441:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1662) as IWindowContainer;
               break;
            case Offer.const_503:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1660) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_747 != null)
            {
               _window.removeChild(var_747);
               var_747.dispose();
            }
            var_747 = _loc2_;
            _window.addChild(_loc2_);
            var_747.x = 0;
            var_747.y = 0;
         }
         var_1362 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1361 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1360 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2210 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_746 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_746 != null)
         {
            var_746.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_746.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_153 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_153,page,var_1661);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_1658 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_1659 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_1662 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_1660 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_804,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_1661 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_153 = param1.offer;
         attachStub(var_153.priceType);
         if(var_1362 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_153.priceInCredits));
            var_1362.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1361 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_153.priceInPixels));
            var_1361.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1360 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_153.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_153.priceInPixels));
            var_1360.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_746 != null)
         {
            var_746.enable();
         }
      }
   }
}
