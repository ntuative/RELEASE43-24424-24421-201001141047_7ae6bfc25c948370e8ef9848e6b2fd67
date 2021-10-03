package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.MouseCursorType;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class InteractiveController extends WindowController implements IInteractiveWindow
   {
      
      protected static const KEY_TOOLTIP_DELAY:String = "tool_tip_delay";
      
      protected static const const_1019:String = "tool_tip_caption";
      
      protected static const const_1390:uint = 500;
      
      protected static const const_734:String = "";
      
      protected static var var_315:Array;
       
      
      protected var var_2195:uint = 0;
      
      protected var var_878:String = "";
      
      protected var var_424:Array;
      
      protected var var_879:uint = 500;
      
      public function InteractiveController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         param4 |= 0;
         var_424 = new Array();
         var_424[0] = MouseCursorType.const_287;
         var_424[1] = MouseCursorType.const_39;
         var_424[2] = MouseCursorType.const_287;
         var_424[3] = MouseCursorType.const_287;
         var_424[4] = MouseCursorType.const_39;
         var_424[5] = MouseCursorType.const_39;
         var_424[6] = MouseCursorType.const_287;
         if(var_315 == null)
         {
            var_315 = new Array();
            var_315[0] = WindowState.const_90;
            var_315[1] = WindowState.const_70;
            var_315[2] = WindowState.const_77;
            var_315[3] = WindowState.const_62;
            var_315[4] = WindowState.const_46;
            var_315[5] = WindowState.const_88;
            var_315[6] = WindowState.const_65;
         }
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public static function writeInteractiveWindowProperties(param1:IInteractiveWindow, param2:Array) : Array
      {
         param2.push(new PropertyStruct(const_1019,param1.toolTipCaption,PropertyStruct.STRING,param1.toolTipCaption != const_734));
         param2.push(new PropertyStruct(KEY_TOOLTIP_DELAY,param1.toolTipDelay,PropertyStruct.const_862,param1.toolTipDelay != const_1390));
         return param2;
      }
      
      public static function method_3(param1:IInteractiveWindow, param2:Array) : void
      {
         var _loc3_:* = null;
         for each(_loc3_ in param2)
         {
            switch(_loc3_.key)
            {
               case const_1019:
                  param1.toolTipCaption = _loc3_.value as String;
                  break;
               case KEY_TOOLTIP_DELAY:
                  param1.toolTipDelay = _loc3_.value as uint;
                  break;
               case "mouse_cursor_hovering":
                  param1.setMouseCursorByState(WindowState.const_77,_loc3_.value as uint);
                  break;
               case "mouse_cursor_pressed":
                  param1.setMouseCursorByState(WindowState.const_88,_loc3_.value as uint);
                  break;
               case "mouse_cursor_disabled":
                  param1.setMouseCursorByState(WindowState.const_65,_loc3_.value as uint);
                  break;
            }
         }
      }
      
      public static function processInteractiveWindowEvents(param1:IInteractiveWindow, param2:Event) : void
      {
         if(param1.toolTipCaption != const_734)
         {
            if(param2.type == MouseEvent.MOUSE_OVER)
            {
               param1.context.getWindowServices().getToolTipAgentService().begin(param1);
            }
            else if(param2.type != MouseEvent.MOUSE_MOVE)
            {
               if(param2.type == MouseEvent.MOUSE_OUT)
               {
                  param1.context.getWindowServices().getToolTipAgentService().end(param1);
               }
            }
         }
      }
      
      public function set toolTipDelay(param1:uint) : void
      {
         var_879 = param1;
      }
      
      public function hideToolTip() : void
      {
      }
      
      override public function get properties() : Array
      {
         return writeInteractiveWindowProperties(this,super.properties);
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         if(param1 == this)
         {
            processInteractiveWindowEvents(this,param2);
         }
         return super.update(param1,param2);
      }
      
      public function get toolTipCaption() : String
      {
         return var_878;
      }
      
      public function set toolTipCaption(param1:String) : void
      {
         var_878 = param1 == null ? const_734 : param1;
      }
      
      override public function set properties(param1:Array) : void
      {
         method_3(this,param1);
         super.properties = param1;
      }
      
      public function getMouseCursorByState(param1:uint) : uint
      {
         var _loc2_:int = 0;
         while(_loc2_-- > 0)
         {
            if((param1 & 0) > 0)
            {
               return var_424[_loc2_];
            }
         }
         return MouseCursorType.const_39;
      }
      
      public function setMouseCursorByState(param1:uint, param2:uint) : void
      {
         var _loc3_:int = var_315.indexOf(param1);
         if(_loc3_ > -1)
         {
            var_424[_loc3_] = param2;
         }
      }
      
      public function showToolTip(param1:IToolTipWindow) : void
      {
      }
      
      public function get toolTipDelay() : uint
      {
         return var_879;
      }
      
      public function set mouseCursorType(param1:uint) : void
      {
         var_2195 = param1;
      }
      
      public function get mouseCursorType() : uint
      {
         return var_2195;
      }
   }
}
