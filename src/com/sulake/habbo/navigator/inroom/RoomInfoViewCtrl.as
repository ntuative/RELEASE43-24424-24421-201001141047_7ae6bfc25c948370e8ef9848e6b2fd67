package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_691:IWindowContainer;
      
      private var var_1017:ITextWindow;
      
      private var var_205:RoomSettingsCtrl;
      
      private var var_1283:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var var_490:Timer;
      
      private var var_1282:ITextWindow;
      
      private var var_349:IWindowContainer;
      
      private var var_2136:IWindowContainer;
      
      private var var_2137:ITextWindow;
      
      private var var_855:IWindowContainer;
      
      private var var_1517:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_651:ITextWindow;
      
      private var var_1516:IWindowContainer;
      
      private var var_1277:IWindowContainer;
      
      private var var_858:ITextWindow;
      
      private var var_1019:ITextFieldWindow;
      
      private var var_306:IWindowContainer;
      
      private var var_857:ITextWindow;
      
      private var var_1513:IButtonWindow;
      
      private var var_1018:ITextWindow;
      
      private var var_2249:int;
      
      private var var_1278:IContainerButtonWindow;
      
      private var var_856:IWindowContainer;
      
      private var var_1281:ITextWindow;
      
      private var var_1279:IContainerButtonWindow;
      
      private var var_1514:ITextWindow;
      
      private var var_1515:IButtonWindow;
      
      private var var_925:TagRenderer;
      
      private var var_1885:ITextWindow;
      
      private var var_348:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_690:ITextWindow;
      
      private var var_278:RoomThumbnailCtrl;
      
      private var var_1280:IContainerButtonWindow;
      
      private var var_2135:IWindowContainer;
      
      private var var_277:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_348 = new RoomEventViewCtrl(_navigator);
         var_205 = new RoomSettingsCtrl(_navigator,this,true);
         var_278 = new RoomThumbnailCtrl(_navigator);
         var_925 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_205);
         var_490 = new Timer(6000,1);
         var_490.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_205.active = true;
         this.var_348.active = false;
         this.var_278.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1517.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1515.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1516.visible = Util.hasVisibleChildren(var_1516);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_651.text = param1.roomName;
         var_651.height = NaN;
         _ownerName.text = param1.ownerName;
         var_858.text = param1.description;
         var_925.refreshTags(var_349,param1.tags);
         var_858.visible = false;
         if(param1.description != "")
         {
            var_858.height = NaN;
            var_858.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_349,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_349,"thumb_down",_loc3_,onThumbDown,0);
         var_2137.visible = _loc3_;
         var_857.visible = !_loc3_;
         var_1514.visible = !_loc3_;
         var_1514.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_349,"home",param2,null,0);
         _navigator.refreshButton(var_349,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_349,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_651.y,0);
         var_349.visible = true;
         var_349.height = Util.getLowestPoint(var_349);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_448,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1513.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1283.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1280.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1278.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1279.visible = _navigator.data.canEditRoomSettings && param1;
         var_1277.visible = Util.hasVisibleChildren(var_1277);
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_490.reset();
         this.var_348.active = false;
         this.var_205.active = false;
         this.var_278.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this.var_490.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_490.reset();
         this.var_348.active = false;
         this.var_205.active = false;
         this.var_278.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_448,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_306);
         var_306.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_205.refresh(var_306);
         this.var_278.refresh(var_306);
         Util.moveChildrenToColumn(var_306,["room_details","room_buttons"],0,2);
         var_306.height = Util.getLowestPoint(var_306);
         var_306.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1019.setSelection(0,var_1019.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_277);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_348.refresh(var_277);
         if(Util.hasVisibleChildren(var_277) && !this.var_278.active)
         {
            Util.moveChildrenToColumn(var_277,["event_details","event_buttons"],0,2);
            var_277.height = Util.getLowestPoint(var_277);
            var_277.visible = true;
         }
         else
         {
            var_277.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this.var_490.reset();
         this.var_348.active = true;
         this.var_205.active = false;
         this.var_278.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(0,_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         var_490.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_1017.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1017.height = NaN;
         var_1282.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1282.height = NaN;
         Util.moveChildrenToColumn(var_691,["public_space_name","public_space_desc"],var_1017.y,0);
         var_691.visible = true;
         var_691.height = Math.max(86,Util.getLowestPoint(var_691));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         if(_loc1_ && true && true && true)
         {
            var_856.visible = true;
            var_1019.text = this.getEmbedData();
         }
         else
         {
            var_856.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_490.reset();
         this.var_205.load(param1);
         this.var_205.active = true;
         this.var_348.active = false;
         this.var_278.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_490.reset();
         this.var_205.active = false;
         this.var_348.active = false;
         this.var_278.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_66,false);
         _window.setParamFlag(HabboWindowParam.const_1154,true);
         var_306 = IWindowContainer(find("room_info"));
         var_349 = IWindowContainer(find("room_details"));
         var_691 = IWindowContainer(find("public_space_details"));
         var_2135 = IWindowContainer(find("owner_name_cont"));
         var_2136 = IWindowContainer(find("rating_cont"));
         var_1277 = IWindowContainer(find("room_buttons"));
         var_651 = ITextWindow(find("room_name"));
         var_1017 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_858 = ITextWindow(find("room_desc"));
         var_1282 = ITextWindow(find("public_space_desc"));
         var_1018 = ITextWindow(find("owner_caption"));
         var_857 = ITextWindow(find("rating_caption"));
         var_2137 = ITextWindow(find("rate_caption"));
         var_1514 = ITextWindow(find("rating_txt"));
         var_277 = IWindowContainer(find("event_info"));
         var_855 = IWindowContainer(find("event_details"));
         var_1516 = IWindowContainer(find("event_buttons"));
         var_1885 = ITextWindow(find("event_name"));
         var_690 = ITextWindow(find("event_desc"));
         var_1283 = IContainerButtonWindow(find("add_favourite_button"));
         var_1280 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1278 = IContainerButtonWindow(find("make_home_button"));
         var_1279 = IContainerButtonWindow(find("unmake_home_button"));
         var_1513 = IButtonWindow(find("room_settings_button"));
         var_1517 = IButtonWindow(find("create_event_button"));
         var_1515 = IButtonWindow(find("edit_event_button"));
         var_856 = IWindowContainer(find("embed_info"));
         var_1281 = ITextWindow(find("embed_info_txt"));
         var_1019 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1283,onAddFavouriteClick);
         Util.setProcDirectly(var_1280,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1513,onRoomSettingsClick);
         Util.setProcDirectly(var_1278,onMakeHomeClick);
         Util.setProcDirectly(var_1279,onUnmakeHomeClick);
         Util.setProcDirectly(var_1517,onEventSettingsClick);
         Util.setProcDirectly(var_1515,onEventSettingsClick);
         Util.setProcDirectly(var_1019,onEmbedSrcClick);
         _navigator.refreshButton(var_1283,"favourite",true,null,0);
         _navigator.refreshButton(var_1280,"favourite",true,null,0);
         _navigator.refreshButton(var_1278,"home",true,null,0);
         _navigator.refreshButton(var_1279,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_306,onHover);
         Util.setProcDirectly(var_277,onHover);
         var_1018.width = var_1018.textWidth;
         Util.moveChildrenToRow(var_2135,["owner_caption","owner_name"],var_1018.x,var_1018.y,3);
         var_857.width = var_857.textWidth;
         Util.moveChildrenToRow(var_2136,["rating_caption","rating_txt"],var_857.x,var_857.y,3);
         var_1281.height = NaN;
         Util.moveChildrenToColumn(var_856,["embed_info_txt","embed_src_txt"],var_1281.y,2);
         var_856.height = Util.getLowestPoint(var_856) + 5;
         var_2249 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1885.text = param1.eventName;
         var_690.text = param1.eventDescription;
         var_925.refreshTags(var_855,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_690.visible = false;
         if(param1.eventDescription != "")
         {
            var_690.height = NaN;
            var_690.y = Util.getLowestPoint(var_855) + 2;
            var_690.visible = true;
         }
         var_855.visible = true;
         var_855.height = Util.getLowestPoint(var_855);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_851,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
