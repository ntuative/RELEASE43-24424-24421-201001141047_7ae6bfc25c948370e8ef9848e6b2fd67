package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class IssuePickFailedMessageParser implements IMessageParser
   {
       
      
      private var var_1823:String;
      
      private var var_1822:int;
      
      private var var_1821:int;
      
      public function IssuePickFailedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1821 = param1.readInteger();
         var_1822 = param1.readInteger();
         var_1823 = param1.readString();
         return true;
      }
      
      public function get issueId() : int
      {
         return var_1821;
      }
      
      public function get pickerUserId() : int
      {
         return var_1822;
      }
      
      public function get pickerUserName() : String
      {
         return var_1823;
      }
   }
}
