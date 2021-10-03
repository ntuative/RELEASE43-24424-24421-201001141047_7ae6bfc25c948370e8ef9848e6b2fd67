package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class UserInfoFrameCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_735:UserInfoCtrl;
      
      private var _disposed:Boolean;
      
      private var _userId:int;
      
      private var var_60:IFrameWindow;
      
      private var var_58:ModerationManager;
      
      public function UserInfoFrameCtrl(param1:ModerationManager, param2:int)
      {
         super();
         var_58 = param1;
         _userId = param2;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_60 != null)
         {
            var_60.destroy();
            var_60 = null;
         }
         if(var_735 != null)
         {
            var_735.dispose();
            var_735 = null;
         }
         var_58 = null;
      }
      
      public function getId() : String
      {
         return "" + _userId;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1214;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      public function show() : void
      {
         var_60 = IFrameWindow(var_58.getXmlWindow("user_info_frame"));
         var_60.caption = "User Info";
         var _loc1_:IWindow = var_60.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_735 = new UserInfoCtrl(var_60,var_58,"",true);
         var_735.load(var_60.content,_userId);
         var_60.visible = true;
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_60;
      }
   }
}
