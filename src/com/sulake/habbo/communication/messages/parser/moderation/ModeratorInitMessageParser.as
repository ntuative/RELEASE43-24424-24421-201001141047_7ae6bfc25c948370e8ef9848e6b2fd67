package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_1731:Boolean;
      
      private var var_1381:Array;
      
      private var var_1732:Boolean;
      
      private var var_1734:Boolean;
      
      private var var_1738:Boolean;
      
      private var var_152:Array;
      
      private var var_1735:Boolean;
      
      private var var_1736:Boolean;
      
      private var var_1382:Array;
      
      private var var_1733:Boolean;
      
      private var var_1737:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_1737;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_1731;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_1732;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_1735;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_1736;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1381;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_152 = [];
         var_1381 = [];
         _roomMessageTemplates = [];
         var_1382 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_152.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1381.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1382.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_1735 = param1.readBoolean();
         var_1738 = param1.readBoolean();
         var_1732 = param1.readBoolean();
         var_1734 = param1.readBoolean();
         var_1737 = param1.readBoolean();
         var_1736 = param1.readBoolean();
         var_1731 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_1733 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_1734;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1382;
      }
      
      public function get issues() : Array
      {
         return var_152;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_1733;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_1738;
      }
   }
}
