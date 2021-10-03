package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_559:String;
      
      private var var_1106:String;
      
      private var var_1102:String;
      
      private var var_1105:int;
      
      private var _gender:int;
      
      private var var_1103:String;
      
      private var _name:String;
      
      private var var_1104:Boolean;
      
      private var var_648:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this._gender = param1.readInteger();
         this.var_648 = param1.readBoolean();
         this.var_1104 = param1.readBoolean();
         this.var_559 = param1.readString();
         this.var_1105 = param1.readInteger();
         this.var_1102 = param1.readString();
         this.var_1106 = param1.readString();
         this.var_1103 = param1.readString();
      }
      
      public function get gender() : int
      {
         return _gender;
      }
      
      public function get realName() : String
      {
         return var_1103;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1102;
      }
      
      public function get categoryId() : int
      {
         return var_1105;
      }
      
      public function get online() : Boolean
      {
         return var_648;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1104;
      }
      
      public function get lastAccess() : String
      {
         return var_1106;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_559;
      }
   }
}
