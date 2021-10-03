package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1211:String = "WN_CREATED";
      
      public static const const_1009:String = "WN_DISABLE";
      
      public static const const_794:String = "WN_DEACTIVATED";
      
      public static const const_953:String = "WN_OPENED";
      
      public static const const_971:String = "WN_CLOSED";
      
      public static const const_784:String = "WN_DESTROY";
      
      public static const const_1589:String = "WN_ARRANGED";
      
      public static const const_424:String = "WN_PARENT_RESIZED";
      
      public static const const_802:String = "WN_ENABLE";
      
      public static const const_832:String = "WN_RELOCATE";
      
      public static const const_816:String = "WN_FOCUS";
      
      public static const const_846:String = "WN_PARENT_RELOCATED";
      
      public static const const_364:String = "WN_PARAM_UPDATED";
      
      public static const const_705:String = "WN_PARENT_ACTIVATED";
      
      public static const const_230:String = "WN_RESIZED";
      
      public static const const_834:String = "WN_CLOSE";
      
      public static const const_838:String = "WN_PARENT_REMOVED";
      
      public static const const_258:String = "WN_CHILD_RELOCATED";
      
      public static const const_649:String = "WN_ENABLED";
      
      public static const const_268:String = "WN_CHILD_RESIZED";
      
      public static const const_887:String = "WN_MINIMIZED";
      
      public static const const_562:String = "WN_DISABLED";
      
      public static const const_209:String = "WN_CHILD_ACTIVATED";
      
      public static const const_386:String = "WN_STATE_UPDATED";
      
      public static const const_527:String = "WN_UNSELECTED";
      
      public static const const_407:String = "WN_STYLE_UPDATED";
      
      public static const const_1546:String = "WN_UPDATE";
      
      public static const const_475:String = "WN_PARENT_ADDED";
      
      public static const const_609:String = "WN_RESIZE";
      
      public static const const_687:String = "WN_CHILD_REMOVED";
      
      public static const const_1500:String = "";
      
      public static const const_952:String = "WN_RESTORED";
      
      public static const const_283:String = "WN_SELECTED";
      
      public static const const_977:String = "WN_MINIMIZE";
      
      public static const const_884:String = "WN_FOCUSED";
      
      public static const const_1229:String = "WN_LOCK";
      
      public static const const_292:String = "WN_CHILD_ADDED";
      
      public static const const_921:String = "WN_UNFOCUSED";
      
      public static const const_449:String = "WN_RELOCATED";
      
      public static const const_956:String = "WN_DEACTIVATE";
      
      public static const const_1241:String = "WN_CRETAE";
      
      public static const const_1010:String = "WN_RESTORE";
      
      public static const const_280:String = "WN_ACTVATED";
      
      public static const const_1168:String = "WN_LOCKED";
      
      public static const const_365:String = "WN_SELECT";
      
      public static const const_906:String = "WN_MAXIMIZE";
      
      public static const const_990:String = "WN_OPEN";
      
      public static const const_671:String = "WN_UNSELECT";
      
      public static const const_1592:String = "WN_ARRANGE";
      
      public static const const_1224:String = "WN_UNLOCKED";
      
      public static const const_1531:String = "WN_UPDATED";
      
      public static const const_786:String = "WN_ACTIVATE";
      
      public static const const_1163:String = "WN_UNLOCK";
      
      public static const const_814:String = "WN_MAXIMIZED";
      
      public static const const_822:String = "WN_DESTROYED";
      
      public static const const_981:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1530,cancelable);
      }
   }
}
