package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1628:int;
      
      private var var_1872:String;
      
      private var var_1869:int;
      
      private var var_1873:int;
      
      private var var_685:Boolean;
      
      private var var_1867:Boolean;
      
      private var var_383:int;
      
      private var var_1067:String;
      
      private var var_1874:int;
      
      private var var_1105:int;
      
      private var _ownerName:String;
      
      private var var_651:String;
      
      private var var_1870:int;
      
      private var var_1871:RoomThumbnailData;
      
      private var var_1868:Boolean;
      
      private var var_587:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_587 = new Array();
         super();
         var_383 = param1.readInteger();
         var_685 = param1.readBoolean();
         var_651 = param1.readString();
         _ownerName = param1.readString();
         var_1874 = param1.readInteger();
         var_1628 = param1.readInteger();
         var_1870 = param1.readInteger();
         var_1067 = param1.readString();
         var_1869 = param1.readInteger();
         var_1868 = param1.readBoolean();
         var_1873 = param1.readInteger();
         var_1105 = param1.readInteger();
         var_1872 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_587.push(_loc4_);
            _loc3_++;
         }
         var_1871 = new RoomThumbnailData(param1);
         var_1867 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_1870;
      }
      
      public function get roomName() : String
      {
         return var_651;
      }
      
      public function get userCount() : int
      {
         return var_1628;
      }
      
      public function get score() : int
      {
         return var_1873;
      }
      
      public function get eventCreationTime() : String
      {
         return var_1872;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1868;
      }
      
      public function get tags() : Array
      {
         return var_587;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1867;
      }
      
      public function get event() : Boolean
      {
         return var_685;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_587 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1105;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_1869;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_1871;
      }
      
      public function get doorMode() : int
      {
         return var_1874;
      }
      
      public function get flatId() : int
      {
         return var_383;
      }
      
      public function get description() : String
      {
         return var_1067;
      }
   }
}
