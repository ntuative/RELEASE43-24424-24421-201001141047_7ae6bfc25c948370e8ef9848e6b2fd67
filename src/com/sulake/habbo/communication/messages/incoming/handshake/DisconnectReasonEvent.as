package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1160:String = "DisconnectReasonPeerConnectionLost";
      
      public static const const_919:String = "DisconnectReasonTimeout";
      
      public static const const_499:String = "DisconnectReasonDisconnected";
      
      public static const const_300:String = "DisconnectReasonBanned";
      
      public static const const_824:String = "DisconnectReasonLoggedOut";
      
      public static const const_818:String = "DisconnectReasonConcurrentLogin";
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : String
      {
         var _loc1_:int = (this.var_21 as DisconnectReasonParser).reason;
         switch(_loc1_)
         {
            case -1:
               return const_499;
            case 0:
               return const_499;
            case 1:
               return const_824;
            case 1009:
            case 2:
               return const_818;
            case 3:
               return const_919;
            case 4:
               return const_1160;
            default:
               return const_499;
         }
      }
   }
}
