package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1415:int = 10;
       
      
      private var var_1452:NavigatorSettingsMessageParser;
      
      private var var_1213:int;
      
      private var var_1947:Boolean;
      
      private var var_1948:int;
      
      private var var_822:Dictionary;
      
      private var var_2239:int;
      
      private var var_1946:int;
      
      private var var_1949:int;
      
      private var var_338:Array;
      
      private var var_1950:int;
      
      private var var_560:PublicRoomShortData;
      
      private var var_398:RoomEventData;
      
      private var var_136:MsgWithRequestId;
      
      private var var_1951:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1945:Boolean;
      
      private var var_199:GuestRoomData;
      
      private var var_657:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_338 = new Array();
         var_822 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_1948;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1945;
      }
      
      public function startLoading() : void
      {
         this.var_657 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1945 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_398 != null)
         {
            var_398.dispose();
         }
         var_398 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_136 != null && var_136 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_136 != null && var_136 as GuestRoomSearchResultData != null;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_136 = param1;
         var_657 = false;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_136 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_199;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_560 = null;
         var_199 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_560 = param1.publicSpace;
            var_398 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(var_398 != null)
         {
            var_398.dispose();
            var_398 = null;
         }
         if(var_560 != null)
         {
            var_560.dispose();
            var_560 = null;
         }
         if(var_199 != null)
         {
            var_199.dispose();
            var_199 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1452;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_136 = param1;
         var_657 = false;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function getCategoryByIndex(param1:int) : FlatCategory
      {
         if(var_338.length > param1)
         {
            return var_338[param1] as FlatCategory;
         }
         return null;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2239 = param1.limit;
         this.var_1213 = param1.favouriteRoomIds.length;
         this.var_822 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_822[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_136 as PopularRoomTagsData;
      }
      
      public function get categories() : Array
      {
         return var_338;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_560;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1949 = param1;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1947;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_136 = param1;
         var_657 = false;
      }
      
      public function getCategoryIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < var_338.length)
         {
            if((var_338[_loc2_] as FlatCategory).nodeId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_199 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_657;
      }
      
      public function set categories(param1:Array) : void
      {
         var_338 = param1;
      }
      
      public function get currentRoomRating() : int
      {
         return var_1946;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1950;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1452 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_136 == null)
         {
            return;
         }
         var_136.dispose();
         var_136 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_398;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_822[param1] = !!param2 ? "yes" : null;
         var_1213 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_136 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1949;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_136 != null && var_136 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1947 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1946 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1951 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_199 != null)
         {
            var_199.dispose();
         }
         var_199 = param1;
      }
      
      public function getCategoryById(param1:int) : FlatCategory
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_338)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_199 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1452.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1213 >= var_2239;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1950 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1951;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_199 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1948 = param1;
      }
   }
}
