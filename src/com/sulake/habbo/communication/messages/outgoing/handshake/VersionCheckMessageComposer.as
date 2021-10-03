package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2113:String;
      
      private var var_1226:String;
      
      private var var_2114:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2114 = param1;
         var_1226 = param2;
         var_2113 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2114,var_1226,var_2113];
      }
      
      public function dispose() : void
      {
      }
   }
}
