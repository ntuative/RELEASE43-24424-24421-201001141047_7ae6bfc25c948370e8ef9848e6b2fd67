package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1185:int;
      
      private var var_894:String;
      
      private var var_643:Array;
      
      private var var_930:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_643.slice();
      }
      
      public function flush() : Boolean
      {
         var_894 = "";
         var_930 = [];
         var_643 = [];
         var_1185 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1185;
      }
      
      public function get question() : String
      {
         return var_894;
      }
      
      public function get choices() : Array
      {
         return var_930.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_894 = param1.readString();
         var_930 = [];
         var_643 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_930.push(param1.readString());
            var_643.push(param1.readInteger());
            _loc3_++;
         }
         var_1185 = param1.readInteger();
         return true;
      }
   }
}
