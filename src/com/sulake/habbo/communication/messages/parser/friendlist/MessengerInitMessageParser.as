package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2233:int;
      
      private var var_2231:int;
      
      private var var_2229:int;
      
      private var var_227:Array;
      
      private var var_2230:int;
      
      private var var_2232:int;
      
      private var var_338:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_338 = new Array();
         this.var_227 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2233;
      }
      
      public function get friends() : Array
      {
         return this.var_227;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2229;
      }
      
      public function get categories() : Array
      {
         return this.var_338;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2231;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2232;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2232 = param1.readInteger();
         this.var_2229 = param1.readInteger();
         this.var_2233 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_338.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_227.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2231 = param1.readInteger();
         this.var_2230 = param1.readInteger();
         return true;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2230;
      }
   }
}
