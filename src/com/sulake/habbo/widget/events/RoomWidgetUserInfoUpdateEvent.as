package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_196:String = "RWUIUE_PEER";
      
      public static const const_201:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1303:String = "BOT";
      
      public static const const_1002:int = 2;
      
      public static const const_1203:int = 0;
      
      public static const const_783:int = 3;
       
      
      private var var_1102:String = "";
      
      private var var_1671:Boolean = false;
      
      private var var_1663:int = 0;
      
      private var var_1664:int = 0;
      
      private var var_1674:Boolean = false;
      
      private var var_1103:String = "";
      
      private var var_1670:Boolean = false;
      
      private var var_807:int = 0;
      
      private var var_1675:Boolean = true;
      
      private var var_892:int = 0;
      
      private var var_1669:Boolean = false;
      
      private var var_1186:Boolean = false;
      
      private var var_1673:Boolean = false;
      
      private var var_1676:int = 0;
      
      private var var_1667:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_258:Array;
      
      private var var_1187:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1665:int = 0;
      
      private var var_1666:Boolean = false;
      
      private var var_1668:int = 0;
      
      private var var_1672:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_258 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1664;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1664 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_1671;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_1675;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_1675 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_1670 = param1;
      }
      
      public function get motto() : String
      {
         return var_1102;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_1669 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1186;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1102 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_1666;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1672;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1186 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_1667;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1676 = param1;
      }
      
      public function get badges() : Array
      {
         return var_258;
      }
      
      public function get amIController() : Boolean
      {
         return var_1674;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_1674 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_1666 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_1668 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1672 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1103 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_1670;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_1669;
      }
      
      public function get carryItem() : int
      {
         return var_1676;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1187;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1187 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_807 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_1668;
      }
      
      public function get realName() : String
      {
         return var_1103;
      }
      
      public function set webID(param1:int) : void
      {
         var_1665 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_258 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_1673 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_1667 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_807;
      }
      
      public function get webID() : int
      {
         return var_1665;
      }
      
      public function set groupId(param1:int) : void
      {
         var_892 = param1;
      }
      
      public function get xp() : int
      {
         return var_1663;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_1671 = param1;
      }
      
      public function get groupId() : int
      {
         return var_892;
      }
      
      public function get canTrade() : Boolean
      {
         return var_1673;
      }
      
      public function set xp(param1:int) : void
      {
         var_1663 = param1;
      }
   }
}
