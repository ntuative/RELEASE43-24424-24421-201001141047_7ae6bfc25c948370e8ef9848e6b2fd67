package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_142:int = 1;
      
      public static const const_1351:int = 3;
      
      public static const const_342:int = 2;
       
      
      private var var_2006:int;
      
      private var var_2008:int;
      
      private var var_2010:int;
      
      private var var_1843:int;
      
      private var _state:int;
      
      private var var_383:int;
      
      private var var_1080:int;
      
      private var var_1821:int;
      
      private var var_886:int;
      
      private var _roomResources:String;
      
      private var var_2003:int;
      
      private var var_2011:int;
      
      private var var_2004:String;
      
      private var var_1823:String;
      
      private var var_2005:int = 0;
      
      private var var_1058:String;
      
      private var _message:String;
      
      private var var_1773:int;
      
      private var var_2007:String;
      
      private var var_1105:int;
      
      private var var_651:String;
      
      private var var_2009:String;
      
      private var var_1384:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_886 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_2005 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_2011;
      }
      
      public function set roomName(param1:String) : void
      {
         var_651 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_2003 = param1;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_651;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1843 = param1;
      }
      
      public function set state(param1:int) : void
      {
         _state = param1;
      }
      
      public function get unitPort() : int
      {
         return var_2008;
      }
      
      public function get priority() : int
      {
         return var_2006 + var_2005;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1821 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1823;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1384) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1105;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_2011 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1080;
      }
      
      public function set flatType(param1:String) : void
      {
         var_2004 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_2003;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1843;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_2009 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1058 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1821;
      }
      
      public function set priority(param1:int) : void
      {
         var_2006 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_2008 = param1;
      }
      
      public function get flatType() : String
      {
         return var_2004;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_2010 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1823 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1773 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1058;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1080 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_2010;
      }
      
      public function set flatId(param1:int) : void
      {
         var_383 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1105 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1384 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1773;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_2007 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1384;
      }
      
      public function get reportedUserId() : int
      {
         return var_886;
      }
      
      public function get flatId() : int
      {
         return var_383;
      }
      
      public function get flatOwnerName() : String
      {
         return var_2009;
      }
      
      public function get reporterUserName() : String
      {
         return var_2007;
      }
   }
}
