package com.sulake.habbo.catalog.purchase
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalization;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ICheckBoxWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.communication.messages.parser.catalog.IsOfferGiftableMessageParser;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.ui.Keyboard;
   
   public class PurchaseConfirmationDialog implements IGetImageListener
   {
       
      
      private var var_1811:String = "";
      
      private var var_1368:Array;
      
      private var var_531:Array;
      
      private var _window:IFrameWindow;
      
      private const const_1420:uint = 4.294967295E9;
      
      private const const_1419:uint = 4.293848814E9;
      
      private var var_1163:int;
      
      private const const_1616:uint = 4.291613146E9;
      
      private var var_261:int = -1;
      
      private var var_222:IWindowContainer;
      
      private var var_949:String;
      
      private var var_456:IWindowContainer;
      
      private var var_192:int;
      
      private var var_785:int;
      
      private var var_2227:Boolean = false;
      
      private var var_2226:int = 0;
      
      private var var_532:Array;
      
      private const const_1615:int = 10;
      
      private var var_227:Array;
      
      private var var_1165:Boolean;
      
      private var var_88:HabboCatalog;
      
      private var var_153:Offer;
      
      private var var_193:int;
      
      private var var_642:ICatalogPage;
      
      private var _localization:ICoreLocalizationManager;
      
      private var var_1164:Boolean;
      
      public function PurchaseConfirmationDialog(param1:ICoreLocalizationManager)
      {
         var_531 = [];
         var_532 = [];
         super();
         _localization = param1;
      }
      
      public function receiverNotFound() : void
      {
         enableGiftButton(true);
         if(!var_88 || true)
         {
            return;
         }
         var_88.windowManager.alert("${catalog.gift_wrapping.receiver_not_found.title}","${catalog.gift_wrapping.receiver_not_found.info}",0,alertHandler);
      }
      
      public function notEnoughCredits() : void
      {
         if(_window == null)
         {
            return;
         }
         enableGiftButton(true);
         var _loc1_:ICheckBoxWindow = _window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         if(_loc1_ != null)
         {
            _loc1_.select();
         }
      }
      
      private function checkboxHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowEvent.const_624:
               showSelectors(false);
               break;
            case WindowEvent.const_707:
               showSelectors(true);
         }
      }
      
      private function createWindow(param1:String) : IWindow
      {
         if(true || true)
         {
            return null;
         }
         var _loc2_:XmlAsset = var_88.assets.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null || _loc2_.content == null)
         {
            return null;
         }
         return var_88.windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function alertHandler(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
         enableGiftButton(true);
      }
      
      private function setImage(param1:BitmapData) : void
      {
         if(_window == null || param1 == null)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("product_image") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.bitmap != null)
         {
            _loc2_.bitmap.dispose();
            _loc2_.bitmap = null;
         }
         if(_loc2_.bitmap == null)
         {
            _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         }
         var _loc3_:int = (_loc2_.width - param1.width) * 0.5;
         var _loc4_:int = (_loc2_.height - param1.height) * 0.5;
         _loc2_.bitmap.draw(param1,new Matrix(1,0,0,1,_loc3_,_loc4_));
      }
      
      private function suggestionsEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         _loc3_ = param2 as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               _loc4_ = _loc3_.findChildByName("name_text") as ITextWindow;
               if(_loc4_ == null)
               {
                  return;
               }
               setReceiverName(_loc4_.text);
               showSuggestions(false);
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               _loc5_ = var_222.findChildByName("suggestion_list") as IItemListWindow;
               if(_loc5_ == null)
               {
                  return;
               }
               highlightSuggestion(_loc5_.getListItemIndex(_loc3_));
               break;
         }
      }
      
      private function updateColorGrid() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(_window == null)
         {
            return;
         }
         var _loc1_:IItemGridWindow = _window.findChildByName("color_grid") as IItemGridWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.numGridItems)
         {
            _loc2_ = _loc1_.getGridItemAt(_loc4_) as IWindowContainer;
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.findChildByName("selection") as IBitmapWrapperWindow;
               if(_loc3_ != null)
               {
                  _loc3_.visible = _loc2_.id == var_785;
               }
            }
            _loc4_++;
         }
      }
      
      private function setReceiverName(param1:String) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc2_:ITextFieldWindow = _window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         focusMessageField();
      }
      
      public function onIsOfferGiftable(param1:IsOfferGiftableMessageParser) : void
      {
         if(this.var_153 == null || this.var_153.offerId != param1.offerId)
         {
            return;
         }
         this.setGiftButtonState(param1.isGiftable);
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(param1 == var_1163)
         {
            setImage(param2);
         }
      }
      
      private function focusMessageField() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:ITextFieldWindow = _window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = true;
         _loc1_.focus();
      }
      
      private function showMessageInput(param1:Boolean) : void
      {
         var _loc2_:ITextFieldWindow = _window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc2_ != null)
         {
            _loc2_.visible = param1;
         }
      }
      
      private function updateLocalizations() : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc1_:IProductData = var_88.getProductData(var_153.localizationId);
         var _loc2_:String = _loc1_ == null ? "" : _loc1_.name;
         var_88.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs","offer_name",_loc2_);
         var _loc3_:String = "";
         var _loc4_:String = "";
         var _loc7_:String = var_88.getPurse().credits.toString();
         var _loc8_:String = var_88.getPurse().pixels.toString();
         switch(var_153.priceType)
         {
            case Offer.const_395:
               _loc6_ = "catalog.purchase.confirmation.dialog.price.credits";
               _loc5_ = _localization.getLocalization(_loc6_);
               _localization.registerParameter(_loc6_,"credits",var_153.priceInCredits.toString());
               _loc3_ = _loc5_.value;
               _localization.registerParameter(_loc6_,"credits",_loc7_);
               _loc4_ = _loc5_.value;
               break;
            case Offer.const_503:
            case Offer.const_441:
               _loc6_ = "catalog.purchase.confirmation.dialog.price.credits+pixels";
               _loc5_ = _localization.getLocalization(_loc6_);
               _localization.registerParameter(_loc6_,"credits",var_153.priceInCredits.toString());
               _localization.registerParameter(_loc6_,"pixels",var_153.priceInPixels.toString());
               _loc3_ = _loc5_.value;
               _localization.registerParameter(_loc6_,"credits",_loc7_);
               _localization.registerParameter(_loc6_,"pixels",_loc8_);
               _loc4_ = _loc5_.value;
               break;
            case Offer.const_433:
               _loc6_ = "catalog.purchase.confirmation.dialog.price.pixels";
               _loc5_ = _localization.getLocalization(_loc6_);
               _localization.registerParameter(_loc6_,"pixels",var_153.priceInPixels.toString());
               _loc3_ = _loc5_.value;
               _localization.registerParameter(_loc6_,"pixels",_loc8_);
               _loc4_ = _loc5_.value;
               break;
            case Offer.const_904:
               _loc6_ = "catalog.purchase.confirmation.dialog.price.nothing";
               _loc5_ = _localization.getLocalization(_loc6_);
               _loc3_ = _loc5_.value;
               _localization.registerParameter(_loc6_,"credits",_loc7_);
               _loc4_ = _loc5_.value;
         }
         var_88.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs","price",_loc3_);
         var_88.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.amount","amount",_loc4_);
      }
      
      private function showSuggestions(param1:Boolean) : void
      {
         if(var_222 == null)
         {
            return;
         }
         var_222.visible = param1;
         if(!param1)
         {
            showMessageInput(true);
         }
      }
      
      private function toggleCheckbox() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:ICheckBoxWindow = _window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_.isSelected)
         {
            _loc1_.unselect();
         }
         else
         {
            _loc1_.select();
         }
      }
      
      private function updatePreview() : void
      {
         var _loc3_:* = null;
         if(var_193 < 0)
         {
            var_193 = -1;
         }
         if(var_193 > -1)
         {
            var_193 = 0;
         }
         if(var_192 < 0)
         {
            var_192 = -1;
         }
         if(var_192 > -1)
         {
            var_192 = 0;
         }
         var _loc1_:int = 0;
         if(_window == null)
         {
            return;
         }
         var _loc2_:IRoomEngine = var_153.page.viewer.roomEngine;
         _loc3_ = _loc2_.getFurnitureImage(var_785,new Vector3d(180),64,this,_loc1_.toString());
         if(_loc3_ == null)
         {
            return;
         }
         var_1163 = _loc3_.id;
         setImage(_loc3_.data);
         showSuggestions(false);
      }
      
      private function getColor(param1:int) : uint
      {
         return param1 % 2 == 0 ? uint(const_1419) : uint(const_1420);
      }
      
      private function initColorGrid() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:* = null;
         if(_window == null)
         {
            return;
         }
         var _loc1_:IItemGridWindow = _window.findChildByName("color_grid") as IItemGridWindow;
         _loc1_.destroyGridItems();
         var _loc2_:IWindowContainer = createWindow("gift_palette_item") as IWindowContainer;
         _loc2_.procedure = colorHandler;
         var _loc3_:Array = var_1368;
         for each(_loc6_ in _loc3_)
         {
            _loc4_ = var_88.getFurnitureData(_loc6_,ProductTypeEnum.const_76);
            _loc5_ = _loc2_.clone() as IWindowContainer;
            if(!(!_loc4_ || !_loc5_))
            {
               _loc7_ = uint(_loc4_.colours[0]);
               _loc8_ = (_loc7_ >> 16 & 255) / 255;
               _loc9_ = (_loc7_ >> 8 & 255) / 255;
               _loc10_ = (_loc7_ & 255) / 255;
               _loc11_ = new ColorTransform(_loc8_,_loc9_,_loc10_);
               setBitmapData(_loc5_,"border","ctlg_clr_27x22_1");
               setBitmapData(_loc5_,"color","ctlg_clr_27x22_2",_loc11_);
               setBitmapData(_loc5_,"selection","ctlg_clr_27x22_3");
               _loc5_.id = _loc6_;
               _loc1_.addGridItem(_loc5_);
            }
         }
      }
      
      private function messageInputHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowMouseEvent.const_50:
               if(var_1165)
               {
                  _loc3_ = param2 as ITextFieldWindow;
                  if(_loc3_)
                  {
                     _loc3_.text = "";
                     var_1165 = false;
                  }
               }
               break;
            case WindowEvent.const_251:
               showSuggestions(false);
         }
      }
      
      private function reset() : void
      {
         var_153 = null;
         var_642 = null;
         var_949 = "";
         var_2226 = 0;
         var_2227 = false;
         var_227 = null;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         var_222 = null;
         if(var_456 != null)
         {
            var_456.dispose();
            var_456 = null;
         }
      }
      
      private function confirmationHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "gift_button":
               showGiftDialog();
               break;
            case "buy_button":
               var_88.purchaseProduct(var_642,var_153,var_949);
               dispose();
               break;
            case "cancel_button":
            case "header_button_close":
               dispose();
         }
      }
      
      public function dispose() : void
      {
         reset();
      }
      
      public function showOffer(param1:IHabboCatalog, param2:Offer, param3:ICatalogPage, param4:String = "", param5:Array = null) : void
      {
         var_153 = param2;
         var_642 = param3;
         var_88 = param1 as HabboCatalog;
         var_949 = param4;
         var_227 = param5;
         showConfirmationDialog();
      }
      
      private function selectHighlighted() : void
      {
         if(var_222 == null || true)
         {
            return;
         }
         var _loc1_:IItemListWindow = var_222.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = _loc1_.getListItemAt(var_261) as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:ITextWindow = _loc2_.findChildByName("name_text") as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         setReceiverName(_loc3_.text);
         showSuggestions(false);
      }
      
      private function giveGift() : void
      {
         var _loc1_:ITextFieldWindow = _window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:String = _loc1_.text;
         var _loc3_:ITextFieldWindow = _window.findChildByName("message_input") as ITextFieldWindow;
         var _loc4_:String = _loc3_ == null ? "" : _loc3_.text;
         var _loc5_:ICheckBoxWindow = _window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         var _loc6_:Boolean = _loc5_ == null ? false : Boolean(_loc5_.isSelected);
         var _loc7_:int = !!_loc6_ ? 0 : int(var_785);
         var _loc8_:int = !!_loc6_ ? 0 : int(var_532[var_192]);
         var _loc9_:int = !!_loc6_ ? 0 : int(var_531[var_193]);
         var_88.purchaseProductAsGift(var_642,var_153,var_949,_loc2_,_loc4_,_loc7_,_loc8_,_loc9_);
      }
      
      private function nameInputHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case WindowEvent.const_165:
               _loc3_ = param1.window as ITextFieldWindow;
               if(_loc3_ == null)
               {
                  return;
               }
               if(var_1811 == _loc3_.text)
               {
                  return;
               }
               _loc4_ = _loc3_.text.toLowerCase();
               _loc5_ = [];
               for each(_loc7_ in var_227)
               {
                  if(_loc7_.toLowerCase().search(_loc4_) != -1)
                  {
                     _loc5_.push(_loc7_);
                  }
                  if(_loc5_.length >= const_1615)
                  {
                     break;
                  }
               }
               updateSuggestions(_loc5_);
               var_1811 = _loc3_.text;
               break;
            case WindowMouseEvent.const_50:
               showSuggestions(false);
               if(var_1164)
               {
                  _loc3_ = param2 as ITextFieldWindow;
                  if(_loc3_)
                  {
                     _loc3_.text = "";
                     var_1164 = false;
                  }
               }
               break;
            case WindowKeyboardEvent.const_646:
               _loc6_ = param1 as WindowKeyboardEvent;
               switch(_loc6_.keyCode)
               {
                  case Keyboard.UP:
                     highlightSuggestion(var_261 - 1);
                     break;
                  case Keyboard.DOWN:
                     highlightSuggestion(var_261 + 1);
                     break;
                  case Keyboard.ENTER:
                     selectHighlighted();
                     break;
                  case Keyboard.TAB:
                     focusMessageField();
               }
         }
      }
      
      private function enableGiftButton(param1:Boolean) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc2_:IButtonWindow = _window.findChildByName("give_gift_button") as IButtonWindow;
         if(_loc2_ != null)
         {
            if(param1)
            {
               _loc2_.enable();
            }
            else
            {
               _loc2_.disable();
            }
         }
      }
      
      private function showConfirmationDialog() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(var_88 == null)
         {
            return;
         }
         if(_window != null)
         {
            _window.dispose();
         }
         updateLocalizations();
         _window = createWindow("purchase_confirmation") as IFrameWindow;
         if(_window == null)
         {
            return;
         }
         _window.procedure = confirmationHandler;
         this.setGiftButtonState(false);
         _window.center();
         var _loc1_:ITextWindow = _window.findChildByName("product_name") as ITextWindow;
         if(_loc1_ != null)
         {
            _loc3_ = var_88.getProductData(var_153.localizationId);
            _loc1_.text = _loc3_ == null ? "" : _loc3_.name;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("product_image") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc4_ = var_153.page.viewer.roomEngine;
            _loc6_ = var_153.productContainer.firstProduct;
            switch(_loc6_.productType)
            {
               case ProductTypeEnum.const_76:
                  _loc5_ = _loc4_.getFurnitureIcon(_loc6_.productClassId,this);
                  break;
               case ProductTypeEnum.const_74:
                  _loc5_ = _loc4_.getWallItemIcon(_loc6_.productClassId,this,_loc6_.extraParam);
                  break;
               case ProductTypeEnum.const_215:
                  _loc7_ = var_88.getPixelEffectIcon(_loc6_.productClassId);
                  break;
               case ProductTypeEnum.const_389:
                  _loc7_ = var_88.getSubscriptionProductIcon(_loc6_.productClassId);
            }
            if(_loc5_ != null)
            {
               _loc7_ = _loc5_.data;
               var_1163 = _loc5_.id;
            }
            setImage(_loc7_);
         }
      }
      
      private function setGiftButtonState(param1:Boolean) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc2_:IButtonWindow = IButtonWindow(_window.findChildByName("gift_button"));
         if(param1)
         {
            _loc2_.enable();
         }
         else
         {
            _loc2_.disable();
         }
      }
      
      private function showGiftDialog() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(_window != null)
         {
            _window.dispose();
         }
         var _loc1_:GiftWrappingConfiguration = var_88.giftWrappingConfiguration;
         var _loc2_:String = !!_loc1_.isEnabled ? "gift_wrapping" : "gift_no_wrapping";
         _window = createWindow(_loc2_) as IFrameWindow;
         if(_window == null)
         {
            return;
         }
         _window.center();
         _window.procedure = wrappingHandler;
         _loc3_ = _window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc3_ != null)
         {
            _loc3_.procedure = nameInputHandler;
         }
         _loc3_ = _window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc3_ != null)
         {
            _loc3_.procedure = messageInputHandler;
         }
         var_1164 = true;
         var_1165 = true;
         if(_loc1_.isEnabled)
         {
            _loc4_ = _window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
            if(_loc4_ != null)
            {
               _loc4_.procedure = checkboxHandler;
            }
            _localization.registerParameter("catalog.gift_wrapping.price","price",_loc1_.price.toString());
            var_1368 = _loc1_.stuffTypes;
            var_532 = _loc1_.boxTypes;
            var_531 = _loc1_.ribbonTypes;
            var_785 = var_1368[0];
            var_192 = var_532[0];
            var_193 = var_531[0];
            initColorGrid();
            updateColorGrid();
            updatePreview();
         }
      }
      
      private function colorHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null || param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_785 = param2.id;
         updateColorGrid();
         updatePreview();
      }
      
      private function showSelectors(param1:Boolean) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = _window.findChildByName("mask") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = !param1;
      }
      
      private function highlightSuggestion(param1:int) : void
      {
         var _loc3_:* = null;
         if(var_222 == null)
         {
            return;
         }
         var _loc2_:IItemListWindow = var_222.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc3_ = _loc2_.getListItemAt(var_261) as IWindowContainer;
         if(_loc3_ != null)
         {
            _loc3_.color = getColor(var_261);
         }
         var_261 = param1;
         if(var_261 < 0)
         {
            var_261 = _loc2_.numListItems - 1;
         }
         if(var_261 >= _loc2_.numListItems)
         {
            var_261 = 0;
         }
         _loc3_ = _loc2_.getListItemAt(var_261) as IWindowContainer;
         if(_loc3_ != null)
         {
            _loc3_.color = const_1616;
         }
      }
      
      private function setBitmapData(param1:IWindowContainer, param2:String, param3:String, param4:ColorTransform = null) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc5_:IBitmapWrapperWindow = param1.findChildByName(param2) as IBitmapWrapperWindow;
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:BitmapDataAsset = var_88.assets.getAssetByName(param3) as BitmapDataAsset;
         if(_loc6_ == null)
         {
            return;
         }
         var _loc7_:BitmapData = _loc6_.content as BitmapData;
         if(_loc7_ == null)
         {
            return;
         }
         if(_loc5_.bitmap == null)
         {
            _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,0);
         }
         _loc5_.bitmap.draw(_loc7_,null,param4);
      }
      
      private function wrappingHandler(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "give_gift_button":
               giveGift();
               enableGiftButton(false);
               break;
            case "cancel_gifting_button":
            case "header_button_close":
               dispose();
               break;
            case "ribbon_prev":
               --var_193;
               updatePreview();
               break;
            case "ribbon_next":
               ++var_193;
               updatePreview();
               break;
            case "box_prev":
               --var_192;
               updatePreview();
               break;
            case "box_next":
               ++var_192;
               updatePreview();
               break;
            case "use_free_text":
               toggleCheckbox();
         }
      }
      
      private function updateSuggestions(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(var_222 == null)
         {
            var_222 = _window.findChildByName("suggestion_container") as IWindowContainer;
         }
         if(var_456 == null)
         {
            var_456 = createWindow("suggestion_list_item") as IWindowContainer;
            var_456.procedure = suggestionsEventHandler;
         }
         if(var_222 == null || var_456 == null)
         {
            return;
         }
         var _loc2_:IItemListWindow = var_222.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.removeListItems();
         if(param1.length == 0)
         {
            showSuggestions(false);
            return;
         }
         showSuggestions(true);
         var _loc3_:int = 0;
         for each(_loc4_ in param1)
         {
            _loc5_ = var_456.clone() as IWindowContainer;
            if(_loc5_ != null)
            {
               _loc6_ = _loc5_.findChildByName("name_text") as ITextWindow;
               if(_loc6_ != null)
               {
                  _loc6_.text = _loc4_;
                  _loc2_.addListItem(_loc5_);
               }
               _loc5_.color = getColor(_loc3_);
               _loc3_++;
            }
         }
         showMessageInput(param1.length < 2);
         highlightSuggestion(0);
      }
   }
}
