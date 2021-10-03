package com.sulake.habbo.communication
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.connection.IConnectionStateListener;
   import com.sulake.core.communication.enum.ConnectionType;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.CoreComponent;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.communication.enum.HabboConnectionType;
   import com.sulake.habbo.communication.enum.HabboProtocolType;
   import com.sulake.habbo.communication.protocol.WedgieProtocol;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.tracking.HabboErrorVariableEnum;
   import com.sulake.iid.IIDCoreCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboCommunicationManager extends Component implements IHabboCommunicationManager, IConnectionStateListener
   {
       
      
      private var var_687:int = 0;
      
      private var var_47:String = "";
      
      private var var_1286:Timer;
      
      private var var_241:Array;
      
      private var var_2151:Boolean = false;
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_1016:IMessageConfiguration;
      
      private const const_1625:int = 5;
      
      private var var_351:int = -1;
      
      private var var_697:ICoreCommunicationManager;
      
      private var var_860:int = 1;
      
      private var var_2150:Boolean = false;
      
      private var var_2152:Boolean = false;
      
      private var _connection:IConnection;
      
      public function HabboCommunicationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1016 = new HabboMessages();
         var_241 = [];
         var_1286 = new Timer(100,1);
         super(param1,param2,param3);
         this.queueInterface(new IIDCoreCommunicationManager(),onCoreCommunicationManagerInit);
         this.queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationInit);
      }
      
      public function get port() : int
      {
         if(var_351 < 0 || var_351 >= var_241.length)
         {
            return 0;
         }
         return var_241[var_351];
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] Security Error: " + param1.text);
         ErrorReportStorage.addDebugData("Communication Security Error","SecurityError on connect: " + param1.text + ". Port was " + var_241[var_351]);
         tryNextPort();
      }
      
      private function onConnect(param1:Event) : void
      {
         ErrorReportStorage.addDebugData("Connection","Connected with " + var_860 + " attempts");
      }
      
      private function onConfigurationReady(param1:Event = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         Logger.log("Habbo Communication Manager: init based on configuration: " + _habboConfiguration);
         if(_habboConfiguration == null)
         {
            Core.crash("Received configuration ready event but configuration was null",CoreComponent.const_805);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Ready");
            var_241 = [];
            var_47 = _habboConfiguration.getKey("connection.info.host","fused37-public-proxy-1.hotel.varoke.net");
            _loc2_ = _habboConfiguration.getKey("connection.info.port","25001");
            _loc3_ = _loc2_.split(",");
            for each(_loc4_ in _loc3_)
            {
               var_241.push(parseInt(_loc4_.replace(" ","")));
            }
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Host: " + var_47);
            Logger.log("Connection Host: " + var_47);
            Logger.log("Connection Ports: " + var_241);
            Logger.log("Habbo Connection Info:" + _connection);
            var_2150 = true;
            if(var_2152)
            {
               nextPort();
            }
         }
      }
      
      public function messageReceived(param1:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1317,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1319,param1);
      }
      
      private function nextPort() : void
      {
         var _loc1_:* = null;
         ++var_351;
         if(var_351 >= var_241.length)
         {
            ++var_860;
            ErrorReportStorage.addDebugData("ConnectionRetry","Connection attempt " + var_860);
            if(var_860 > const_1625)
            {
               if(var_2151)
               {
                  return;
               }
               var_2151 = true;
               _loc1_ = this.context as CoreComponent;
               if(_loc1_ != null)
               {
                  _loc1_.error("Connection failed to host " + var_47 + " ports " + var_241,true,CoreComponent.const_556);
                  return;
               }
               throw new Error("Connection failed to host " + var_47 + " ports " + var_241);
            }
            var_351 = 0;
         }
         _connection.timeout = var_860 * 5000;
         _connection.init(var_47,var_241[var_351]);
      }
      
      public function initConnection(param1:String) : void
      {
         switch(param1)
         {
            case HabboConnectionType.const_266:
               if(_habboConfiguration == null)
               {
                  Core.crash("Tried to connect to proxy but configuration was null",CoreComponent.const_556);
                  return;
               }
               if(_connection == null)
               {
                  Core.crash("Tried to connect to proxy but connection was null",CoreComponent.const_556);
                  return;
               }
               var_2152 = true;
               if(var_2150)
               {
                  nextPort();
               }
               break;
            default:
               Logger.log("Unknown Habbo Connection Type: " + param1);
         }
      }
      
      private function onTryNextPort(param1:TimerEvent) : void
      {
         var_1286.stop();
         nextPort();
      }
      
      public function get mode() : int
      {
         return var_687;
      }
      
      public function addHabboConnectionMessageEvent(param1:IMessageEvent) : void
      {
         return var_697.addConnectionMessageEvent(HabboConnectionType.const_266,param1);
      }
      
      public function connectionInit(param1:String, param2:int) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1130,param1);
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1133,String(param2));
      }
      
      public function habboWebLogin(param1:String, param2:String) : IHabboWebLogin
      {
         var _loc3_:String = "";
         _loc3_ = _habboConfiguration.getKey("url.prefix",_loc3_);
         _loc3_ = _loc3_.replace("http://","");
         _loc3_ = _loc3_.replace("https://","");
         return new HabboWebLogin(param1,param2,_loc3_);
      }
      
      public function messageSent(param1:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1256,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1181,param1);
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] IO Error: " + param1.text);
         switch(param1.type)
         {
            case IOErrorEvent.IO_ERROR:
               break;
            case IOErrorEvent.DISK_ERROR:
               break;
            case IOErrorEvent.NETWORK_ERROR:
               break;
            case IOErrorEvent.VERIFY_ERROR:
         }
         ErrorReportStorage.addDebugData("Communication IO Error","IOError " + param1.type + " on connect: " + param1.text + ". Port was " + var_241[var_351]);
         tryNextPort();
      }
      
      public function set mode(param1:int) : void
      {
         var_687 = param1;
      }
      
      private function onCoreCommunicationManagerInit(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         Logger.log("Habbo Communication Manager: Core Communication Manager found:: " + [param1,param2]);
         if(param2 != null)
         {
            var_697 = param2 as ICoreCommunicationManager;
            var_697.connectionStateListener = this;
            var_697.registerProtocolType(HabboProtocolType.const_837,WedgieProtocol);
            _connection = var_697.createConnection(HabboConnectionType.const_266,ConnectionType.const_788);
            _loc3_ = var_697.getProtocolInstanceOfType(HabboProtocolType.const_837);
            _connection.registerMessageClasses(var_1016);
            _connection.protocol = _loc3_;
            _connection.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
            _connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
            _connection.addEventListener(Event.CONNECT,onConnect);
         }
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Received");
            _habboConfiguration = param2 as IHabboConfigurationManager;
            (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationReady);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config NOT received");
         }
      }
      
      private function tryNextPort() : void
      {
         var_1286.addEventListener(TimerEvent.TIMER,onTryNextPort);
         var_1286.start();
      }
      
      public function getHabboMainConnection(param1:Function) : IConnection
      {
         return var_697.queueConnection(HabboConnectionType.const_266,param1);
      }
   }
}
