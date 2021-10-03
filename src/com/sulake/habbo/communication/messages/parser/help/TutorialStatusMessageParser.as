package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1029:Boolean;
      
      private var var_1030:Boolean;
      
      private var var_1031:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1029;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1030;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1031 = param1.readBoolean();
         var_1030 = param1.readBoolean();
         var_1029 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1031;
      }
      
      public function flush() : Boolean
      {
         var_1031 = false;
         var_1030 = false;
         var_1029 = false;
         return true;
      }
   }
}
