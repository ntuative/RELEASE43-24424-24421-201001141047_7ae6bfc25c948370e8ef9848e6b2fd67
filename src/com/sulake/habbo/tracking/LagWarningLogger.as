package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LagWarningLogger
   {
      
      public static const const_839:int = 0;
      
      public static const WARNING_TYPE_CHAT_DELAY:int = 1;
       
      
      private var var_1241:Boolean = true;
      
      private var var_1254:int = 0;
      
      private var var_816:int = 0;
      
      private var var_1208:int = 0;
      
      private var var_817:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_1252:int = 15;
      
      private var var_177:IHabboConfigurationManager;
      
      private var _connection:IConnection;
      
      private var var_1251:int = 60;
      
      public function LagWarningLogger()
      {
         super();
         var_1208 = getTimer();
      }
      
      public function logWarnings() : void
      {
         if(!var_1241)
         {
            return;
         }
         if(nothingToReport)
         {
            return;
         }
         var _loc1_:LagWarningReportMessageComposer = new LagWarningReportMessageComposer(var_816,var_817);
         if(_connection != null)
         {
            _connection.send(_loc1_);
         }
         resetLog();
         ++var_1254;
      }
      
      private function get nothingToReport() : Boolean
      {
         return var_816 == 0 && var_817 == 0;
      }
      
      private function resetLog() : void
      {
         var_816 = 0;
         var_817 = 0;
      }
      
      public function update(param1:uint) : void
      {
         if(!var_1241)
         {
            return;
         }
         if(getTimer() - var_1208 > var_1251 * 1000 && var_1254 < var_1252)
         {
            var_1208 = getTimer();
            logWarnings();
         }
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_177 = param1;
         var_1251 = int(var_177.getKey("lagwarninglog.interval","60"));
         var_1252 = int(var_177.getKey("lagwarninglog.reportlimit","15"));
         var_1241 = Boolean(int(var_177.getKey("lagwarninglog.enabled","1")));
      }
      
      public function registerWarning(param1:int) : void
      {
         switch(param1)
         {
            case WARNING_TYPE_CHAT_DELAY:
               var_817 += 1;
            case const_839:
               var_816 += 1;
         }
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
