package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1521:int = 2;
      
      public static const const_300:int = 4;
      
      public static const const_1225:int = 1;
      
      public static const const_1136:int = 3;
       
      
      private var var_1007:int = 0;
      
      private var var_848:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_1007;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1007 = param1.readInteger();
         if(var_1007 == 3)
         {
            var_848 = param1.readString();
         }
         else
         {
            var_848 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1007 = 0;
         var_848 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_848;
      }
   }
}
