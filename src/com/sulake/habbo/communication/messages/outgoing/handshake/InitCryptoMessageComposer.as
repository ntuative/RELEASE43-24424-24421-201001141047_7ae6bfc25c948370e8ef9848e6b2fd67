package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class InitCryptoMessageComposer implements IMessageComposer
   {
       
      
      private var var_34:Array;
      
      public function InitCryptoMessageComposer(param1:int)
      {
         super();
         var_34 = new Array();
         var_34.push(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_34;
      }
   }
}
