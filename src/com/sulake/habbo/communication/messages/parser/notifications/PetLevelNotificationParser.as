package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_559:String;
      
      private var var_1608:int;
      
      private var var_1682:String;
      
      private var var_985:int;
      
      private var var_1087:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1087;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1087 = param1.readInteger();
         var_1682 = param1.readString();
         var_1608 = param1.readInteger();
         var_559 = param1.readString();
         var_985 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_1682;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_559;
      }
      
      public function get petType() : int
      {
         return var_985;
      }
      
      public function get level() : int
      {
         return var_1608;
      }
   }
}
