package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_119:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1628:int;
      
      private var var_383:int;
      
      private var var_685:RoomData;
      
      private var var_1607:int;
      
      private var _ownerName:String;
      
      private var var_1629:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_383 = param1.readInteger();
         var_1628 = param1.readInteger();
         var_1629 = param1.readBoolean();
         var_1607 = param1.readInteger();
         _ownerName = param1.readString();
         var_119 = new RoomData(param1);
         var_685 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_1628;
      }
      
      public function get event() : RoomData
      {
         return var_685;
      }
      
      public function get room() : RoomData
      {
         return var_119;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_119 != null)
         {
            var_119.dispose();
            var_119 = null;
         }
         if(var_685 != null)
         {
            var_685.dispose();
            var_685 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_383;
      }
      
      public function get ownerId() : int
      {
         return var_1607;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_1629;
      }
   }
}
