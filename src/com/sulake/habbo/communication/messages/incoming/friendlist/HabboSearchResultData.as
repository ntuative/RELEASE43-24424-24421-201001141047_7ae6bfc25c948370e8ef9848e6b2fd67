package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2223:Boolean;
      
      private var var_2221:int;
      
      private var var_2220:Boolean;
      
      private var var_1428:String;
      
      private var var_1103:String;
      
      private var var_1949:int;
      
      private var var_1846:String;
      
      private var var_2222:String;
      
      private var var_1845:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1949 = param1.readInteger();
         this.var_1428 = param1.readString();
         this.var_1846 = param1.readString();
         this.var_2223 = param1.readBoolean();
         this.var_2220 = param1.readBoolean();
         param1.readString();
         this.var_2221 = param1.readInteger();
         this.var_1845 = param1.readString();
         this.var_2222 = param1.readString();
         this.var_1103 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1103;
      }
      
      public function get avatarName() : String
      {
         return this.var_1428;
      }
      
      public function get avatarId() : int
      {
         return this.var_1949;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2223;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2222;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1845;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2220;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1846;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2221;
      }
   }
}
