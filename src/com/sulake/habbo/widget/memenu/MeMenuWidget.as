package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_615:String = "me_menu_settings_view";
      
      private static const const_761:int = 10;
      
      public static const const_515:String = "me_menu_effects_view";
      
      public static const const_118:String = "me_menu_top_view";
      
      public static const const_1375:String = "me_menu_rooms_view";
      
      public static const const_807:String = "me_menu_dance_moves_view";
      
      public static const const_244:String = "me_menu_my_clothes_view";
       
      
      private var var_1853:Boolean = false;
      
      private var _isAnimating:Boolean = false;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1433:int = 0;
      
      private var var_1852:int = 0;
      
      private var var_1851:Boolean = false;
      
      private var var_264:Boolean = false;
      
      private var var_1850:int = 0;
      
      private var var_1854:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_545:Boolean = false;
      
      private var var_97:ClubPromoView;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1179:int = 0;
      
      private var var_1849:Boolean = false;
      
      private var var_965:Point;
      
      private var var_42:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_965 = new Point(0,0);
         _eventDispatcher = param4;
         if(param5 != null && false)
         {
            var_1849 = param5.getKey("client.news.embed.enabled","false") == "true";
         }
         changeView(const_118);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_722,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_622,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_549,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_518,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_285,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_618,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_408,onShowAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_950,onHideAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_193,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_189,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_697,method_5);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_201,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_327,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_96,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_398,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_164,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!_isAnimating)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_545;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_264)
         {
            return;
         }
         if(var_42.window.name == const_615)
         {
            (var_42 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1179 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1433 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1433.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_264 && var_42.window.name == const_244))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_513);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_722,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_622,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_549,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_518,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_285,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_193,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_189,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_697,method_5);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_618,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_408,onShowAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_950,onHideAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_201,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_327,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_398,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_96,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_164,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         _eventDispatcher = null;
         if(var_42 != null)
         {
            var_42.dispose();
            var_42 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_1853;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1854 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onHideAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_97 != null)
         {
            var_97.dispose();
            var_97 = null;
         }
         updateSize();
      }
      
      public function get isDancing() : Boolean
      {
         return var_1851;
      }
      
      public function get creditBalance() : int
      {
         return var_1433;
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_398:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_264 + " view: " + var_42.window.name);
               if(var_264 != true || var_42.window.name != const_118)
               {
                  return;
               }
               (var_42 as MeMenuMainView).setIconAssets("clothes_icon",const_118,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_96:
               hide();
         }
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1854 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_1852;
      }
      
      private function method_5(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_545 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_545 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = var_1179 > 0;
         var_1179 = param1.daysLeft;
         var_1852 = param1.periodsLeft;
         var_1850 = param1.pastPeriods;
         var_1853 = param1.allowClubDances;
         if(_loc2_ != param1.daysLeft > 0)
         {
            if(var_42 != null)
            {
               changeView(var_42.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_1851 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_42 != null && var_42.window.name != const_244)
         {
            hide();
         }
      }
      
      private function onShowAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(var_42 != null && var_42.window.name == const_244)
         {
            if(param1.promoMode == RoomWidgetAvatarEditorUpdateEvent.const_864)
            {
               var_97 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_1366);
            }
            else
            {
               var_97 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_415);
            }
            _loc2_ = _mainContainer.getChildByName(var_42.window.name);
            if(_loc2_ != null)
            {
               var_97.window.x = _loc2_.width + const_761;
               _mainContainer.addChild(var_97.window);
               _mainContainer.width = var_97.window.x + var_97.window.width;
            }
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_545 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_545 = true;
            }
         }
         if(var_42 != null && var_42.window.name == const_515)
         {
            (var_42 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_1850;
      }
      
      public function get habboClubDays() : int
      {
         return var_1179;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1364,HabboWindowStyle.const_803,HabboWindowParam.const_40,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_264 = !var_264;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_264 = false;
               break;
            default:
               return;
         }
         if(var_264)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_656);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_42 != null)
         {
            _mainContainer.removeChild(var_42.window);
            var_42.dispose();
            var_42 = null;
         }
         var_264 = false;
         _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_42 != null && var_42.window.name == const_244)
         {
            if(var_97 != null)
            {
               var_97.dispose();
               var_97 = null;
            }
            changeView(const_118);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_1849;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_97 != null)
         {
            var_97.dispose();
            var_97 = null;
         }
         switch(param1)
         {
            case const_118:
               _loc2_ = new MeMenuMainView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_515:
               _loc2_ = new MeMenuEffectsView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_807:
               _loc2_ = new MeMenuDanceView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_244:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1375:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_615:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_42 != null)
            {
               _mainContainer.removeChild(var_42.window);
               var_42.dispose();
               var_42 = null;
            }
            var_42 = _loc2_;
            var_42.init(this,param1);
         }
         updateSize();
      }
      
      public function updateSize() : void
      {
         if(var_42 != null)
         {
            var_965.x = var_42.window.width + 10;
            var_965.y = var_42.window.height;
            var_42.window.x = 5;
            var_42.window.y = 0;
            _mainContainer.width = var_965.x;
            _mainContainer.height = var_965.y;
            if(var_97 != null)
            {
               _mainContainer.width = var_97.window.x + var_97.window.width + const_761;
            }
         }
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         changeView(const_118);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_571);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_264 = true;
      }
   }
}
