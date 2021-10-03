package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_559:String;
      
      private var var_2215:String;
      
      private var var_2214:int;
      
      private var var_2213:int;
      
      private var var_1069:String;
      
      private var var_1103:String;
      
      private var _name:String;
      
      private var var_464:int;
      
      private var var_807:int;
      
      private var var_2216:int;
      
      private var _respectTotal:int;
      
      private var var_2212:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2213;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1103;
      }
      
      public function get customData() : String
      {
         return this.var_2215;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_464;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2214;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2212;
      }
      
      public function get figure() : String
      {
         return this.var_559;
      }
      
      public function get respectTotal() : int
      {
         return this._respectTotal;
      }
      
      public function get sex() : String
      {
         return this.var_1069;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_559 = param1.readString();
         this.var_1069 = param1.readString();
         this.var_2215 = param1.readString();
         this.var_1103 = param1.readString();
         this.var_2216 = param1.readInteger();
         this.var_2212 = param1.readString();
         this.var_2214 = param1.readInteger();
         this.var_2213 = param1.readInteger();
         this._respectTotal = param1.readInteger();
         this.var_807 = param1.readInteger();
         this.var_464 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2216;
      }
      
      public function get respectLeft() : int
      {
         return this.var_807;
      }
   }
}
