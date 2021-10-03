package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1294:int = 4;
      
      public static const const_623:int = 3;
      
      public static const const_698:int = 2;
      
      public static const const_855:int = 1;
       
      
      private var var_1706:String;
      
      private var _disposed:Boolean;
      
      private var var_1628:int;
      
      private var var_1705:Boolean;
      
      private var var_850:String;
      
      private var var_753:PublicRoomData;
      
      private var var_1703:int;
      
      private var _index:int;
      
      private var var_1704:String;
      
      private var _type:int;
      
      private var var_1641:String;
      
      private var var_752:GuestRoomData;
      
      private var var_1702:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_1706 = param1.readString();
         var_1702 = param1.readString();
         var_1705 = param1.readInteger() == 1;
         var_1704 = param1.readString();
         var_850 = param1.readString();
         var_1703 = param1.readInteger();
         var_1628 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_855)
         {
            var_1641 = param1.readString();
         }
         else if(_type == const_623)
         {
            var_753 = new PublicRoomData(param1);
         }
         else if(_type == const_698)
         {
            var_752 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_1703;
      }
      
      public function get popupCaption() : String
      {
         return var_1706;
      }
      
      public function get userCount() : int
      {
         return var_1628;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1705;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_855)
         {
            return 0;
         }
         if(this.type == const_698)
         {
            return this.var_752.maxUserCount;
         }
         if(this.type == const_623)
         {
            return this.var_753.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1702;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_752 != null)
         {
            this.var_752.dispose();
            this.var_752 = null;
         }
         if(this.var_753 != null)
         {
            this.var_753.dispose();
            this.var_753 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_752;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_1704;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_753;
      }
      
      public function get picRef() : String
      {
         return var_850;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1641;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
