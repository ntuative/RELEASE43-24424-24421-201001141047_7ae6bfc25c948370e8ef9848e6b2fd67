package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_951:Boolean;
      
      private var var_1157:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_951 = param1.readInteger() > 0;
         var_1157 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_951;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1157;
      }
      
      public function flush() : Boolean
      {
         var_951 = false;
         var_1157 = false;
         return true;
      }
   }
}
