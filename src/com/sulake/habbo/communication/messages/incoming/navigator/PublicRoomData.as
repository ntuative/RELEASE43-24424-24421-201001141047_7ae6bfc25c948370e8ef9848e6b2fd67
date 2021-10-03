package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2008:int;
      
      private var var_2142:String;
      
      private var var_1843:int;
      
      private var _disposed:Boolean;
      
      private var var_2141:int;
      
      private var var_2074:String;
      
      private var var_1197:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_2074 = param1.readString();
         var_2008 = param1.readInteger();
         var_1843 = param1.readInteger();
         var_2142 = param1.readString();
         var_2141 = param1.readInteger();
         var_1197 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_2141;
      }
      
      public function get worldId() : int
      {
         return var_1843;
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
      }
      
      public function get unitPropertySet() : String
      {
         return var_2074;
      }
      
      public function get unitPort() : int
      {
         return var_2008;
      }
      
      public function get castLibs() : String
      {
         return var_2142;
      }
      
      public function get nodeId() : int
      {
         return var_1197;
      }
   }
}
