package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1885:String;
      
      private var var_383:int;
      
      private var var_1882:String;
      
      private var var_1883:String;
      
      private var var_1884:int;
      
      private var var_1887:String;
      
      private var var_1886:int;
      
      private var var_587:Array;
      
      private var var_912:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_587 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_912 = false;
            return;
         }
         this.var_912 = true;
         var_1884 = int(_loc2_);
         var_1882 = param1.readString();
         var_383 = int(param1.readString());
         var_1886 = param1.readInteger();
         var_1885 = param1.readString();
         var_1883 = param1.readString();
         var_1887 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_587.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_1886;
      }
      
      public function get eventName() : String
      {
         return var_1885;
      }
      
      public function get eventDescription() : String
      {
         return var_1883;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_1882;
      }
      
      public function get tags() : Array
      {
         return var_587;
      }
      
      public function get creationTime() : String
      {
         return var_1887;
      }
      
      public function get exists() : Boolean
      {
         return var_912;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_1884;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
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
      
      public function get flatId() : int
      {
         return var_383;
      }
   }
}
