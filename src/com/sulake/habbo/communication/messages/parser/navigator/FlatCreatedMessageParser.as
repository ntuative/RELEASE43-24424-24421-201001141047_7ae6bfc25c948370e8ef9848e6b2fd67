package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCreatedMessageParser implements IMessageParser
   {
       
      
      private var var_2170:String;
      
      private var var_383:int;
      
      public function FlatCreatedMessageParser()
      {
         super();
      }
      
      public function get flatName() : String
      {
         return var_2170;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_383 = param1.readInteger();
         this.var_2170 = param1.readString();
         Logger.log("FLAT CREATED: " + this.var_383 + ", " + this.var_2170);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get flatId() : int
      {
         return var_383;
      }
   }
}
