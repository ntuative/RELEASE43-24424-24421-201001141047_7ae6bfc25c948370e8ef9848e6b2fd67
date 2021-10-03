package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_123:DisplayObject;
      
      private var var_2211:uint;
      
      private var var_757:IWindowToolTipAgentService;
      
      private var var_758:IWindowMouseScalingService;
      
      private var var_414:IWindowContext;
      
      private var var_755:IWindowFocusManagerService;
      
      private var var_754:IWindowMouseListenerService;
      
      private var var_756:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2211 = 0;
         var_123 = param2;
         var_414 = param1;
         var_756 = new WindowMouseDragger(param2);
         var_758 = new WindowMouseScaler(param2);
         var_754 = new WindowMouseListener(param2);
         var_755 = new FocusManager(param2);
         var_757 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_758;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_755;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_757;
      }
      
      public function dispose() : void
      {
         if(var_756 != null)
         {
            var_756.dispose();
            var_756 = null;
         }
         if(var_758 != null)
         {
            var_758.dispose();
            var_758 = null;
         }
         if(var_754 != null)
         {
            var_754.dispose();
            var_754 = null;
         }
         if(var_755 != null)
         {
            var_755.dispose();
            var_755 = null;
         }
         if(var_757 != null)
         {
            var_757.dispose();
            var_757 = null;
         }
         var_414 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_754;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_756;
      }
   }
}
