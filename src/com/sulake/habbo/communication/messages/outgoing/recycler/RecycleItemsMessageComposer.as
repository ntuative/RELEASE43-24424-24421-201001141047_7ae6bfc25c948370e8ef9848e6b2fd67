package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_718:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_718 = new Array();
         var_718.push(param1.length);
         var_718 = var_718.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_718;
      }
   }
}
