package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_311:Timer;
      
      protected var var_878:String;
      
      protected var var_879:uint;
      
      protected var var_1055:Point;
      
      protected var var_244:IToolTipWindow;
      
      protected var var_1054:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1055 = new Point();
         var_1054 = new Point(20,20);
         var_879 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_311 != null)
         {
            var_311.stop();
            var_311.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_311 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function method_2(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1055);
            if(var_244 != null && true)
            {
               var_244.x = param1 + var_1054.x;
               var_244.y = param2 + var_1054.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_311 != null)
         {
            var_311.reset();
         }
         if(_window && true)
         {
            if(var_244 == null || false)
            {
               var_244 = _window.context.create("undefined::ToolTip",var_878,WindowType.WINDOW_TYPE_TOOLTIP,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_244.x = _loc2_.x + var_1055.x + var_1054.x;
            var_244.y = _loc2_.y + var_1055.y + var_1054.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_878 = IInteractiveWindow(param1).toolTipCaption;
               var_879 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_878 = param1.caption;
               var_879 = 500;
            }
            _mouse.x = var_123.mouseX;
            _mouse.y = var_123.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1055);
            if(var_878 != null && var_878 != "")
            {
               if(var_311 == null)
               {
                  var_311 = new Timer(var_879,1);
                  var_311.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_311.reset();
               var_311.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_244 != null && true)
         {
            var_244.destroy();
            var_244 = null;
         }
      }
   }
}
