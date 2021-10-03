package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1712:int;
      
      private var var_1203:String;
      
      private var var_1711:int;
      
      private var var_1713:int;
      
      private var var_1710:int;
      
      private var var_1709:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1203;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1709;
      }
      
      public function get responseType() : int
      {
         return var_1713;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1711;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1203 = param1.readString();
         var_1711 = param1.readInteger();
         var_1712 = param1.readInteger();
         var_1710 = param1.readInteger();
         var_1713 = param1.readInteger();
         var_1709 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_1712;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1710;
      }
   }
}
