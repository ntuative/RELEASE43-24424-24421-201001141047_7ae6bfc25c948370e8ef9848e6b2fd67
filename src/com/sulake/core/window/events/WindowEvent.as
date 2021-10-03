package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_299:String = "WE_CHILD_RESIZED";
      
      public static const const_1350:String = "WE_CLOSE";
      
      public static const const_1301:String = "WE_DESTROY";
      
      public static const const_165:String = "WE_CHANGE";
      
      public static const const_1151:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1475:String = "WE_PARENT_RESIZE";
      
      public static const const_92:String = "WE_UPDATE";
      
      public static const const_1165:String = "WE_MAXIMIZE";
      
      public static const const_421:String = "WE_DESTROYED";
      
      public static const const_920:String = "WE_UNSELECT";
      
      public static const const_1202:String = "WE_MAXIMIZED";
      
      public static const const_1532:String = "WE_UNLOCKED";
      
      public static const const_456:String = "WE_CHILD_REMOVED";
      
      public static const const_157:String = "WE_OK";
      
      public static const const_43:String = "WE_RESIZED";
      
      public static const const_1172:String = "WE_ACTIVATE";
      
      public static const const_228:String = "WE_ENABLED";
      
      public static const const_451:String = "WE_CHILD_RELOCATED";
      
      public static const const_1316:String = "WE_CREATE";
      
      public static const const_624:String = "WE_SELECT";
      
      public static const const_169:String = "";
      
      public static const const_1480:String = "WE_LOCKED";
      
      public static const const_1434:String = "WE_PARENT_RELOCATE";
      
      public static const const_1467:String = "WE_CHILD_REMOVE";
      
      public static const const_1568:String = "WE_CHILD_RELOCATE";
      
      public static const const_1508:String = "WE_LOCK";
      
      public static const const_251:String = "WE_FOCUSED";
      
      public static const const_707:String = "WE_UNSELECTED";
      
      public static const const_791:String = "WE_DEACTIVATED";
      
      public static const const_1148:String = "WE_MINIMIZED";
      
      public static const const_1583:String = "WE_ARRANGED";
      
      public static const const_1575:String = "WE_UNLOCK";
      
      public static const const_1436:String = "WE_ATTACH";
      
      public static const const_1357:String = "WE_OPEN";
      
      public static const const_1285:String = "WE_RESTORE";
      
      public static const const_1442:String = "WE_PARENT_RELOCATED";
      
      public static const const_1356:String = "WE_RELOCATE";
      
      public static const const_1441:String = "WE_CHILD_RESIZE";
      
      public static const const_1576:String = "WE_ARRANGE";
      
      public static const const_1378:String = "WE_OPENED";
      
      public static const const_1190:String = "WE_CLOSED";
      
      public static const const_1544:String = "WE_DETACHED";
      
      public static const const_1428:String = "WE_UPDATED";
      
      public static const const_1278:String = "WE_UNFOCUSED";
      
      public static const const_411:String = "WE_RELOCATED";
      
      public static const const_1259:String = "WE_DEACTIVATE";
      
      public static const const_208:String = "WE_DISABLED";
      
      public static const const_568:String = "WE_CANCEL";
      
      public static const const_592:String = "WE_ENABLE";
      
      public static const const_1276:String = "WE_ACTIVATED";
      
      public static const const_1238:String = "WE_FOCUS";
      
      public static const const_1564:String = "WE_DETACH";
      
      public static const const_1162:String = "WE_RESTORED";
      
      public static const const_1268:String = "WE_UNFOCUS";
      
      public static const const_53:String = "WE_SELECTED";
      
      public static const const_1152:String = "WE_PARENT_RESIZED";
      
      public static const const_1217:String = "WE_CREATED";
      
      public static const const_1460:String = "WE_ATTACHED";
      
      public static const const_1231:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1530:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1301:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1530 = param3;
         var_1301 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1301;
      }
      
      public function get related() : IWindow
      {
         return var_1530;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1301 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
