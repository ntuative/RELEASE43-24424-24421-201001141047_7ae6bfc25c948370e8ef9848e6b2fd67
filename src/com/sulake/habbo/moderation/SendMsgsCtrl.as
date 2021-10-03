package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModMessageMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class SendMsgsCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_1264:String;
      
      private var _disposed:Boolean;
      
      private var var_1402:String;
      
      private var var_1265:int;
      
      private var var_58:ModerationManager;
      
      private var var_784:IDropMenuWindow;
      
      private var var_411:ITextFieldWindow;
      
      private var var_60:IFrameWindow;
      
      private var var_303:Boolean = true;
      
      public function SendMsgsCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         var_58 = param1;
         var_1265 = param2;
         var_1402 = param3;
         var_1264 = param4;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_251)
         {
            return;
         }
         if(!var_303)
         {
            return;
         }
         var_411.text = "";
         var_303 = false;
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_60;
      }
      
      public function getId() : String
      {
         return var_1402;
      }
      
      private function onSendMessageButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending message...");
         if(var_303 || false)
         {
            var_58.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return;
         }
         var_58.connection.send(new ModMessageMessageComposer(var_1265,var_411.text,var_1264));
         this.dispose();
      }
      
      public function show() : void
      {
         var_60 = IFrameWindow(var_58.getXmlWindow("send_msgs"));
         var_60.caption = "Msg To: " + var_1402;
         var_60.findChildByName("send_message_but").procedure = onSendMessageButton;
         var_411 = ITextFieldWindow(var_60.findChildByName("message_input"));
         var_411.procedure = onInputClick;
         var_784 = IDropMenuWindow(var_60.findChildByName("msgTemplatesSelect"));
         prepareMsgSelect(var_784);
         var_784.procedure = onSelectTemplate;
         var _loc1_:IWindow = var_60.findChildByTag("close");
         _loc1_.procedure = onClose;
         var_60.visible = true;
      }
      
      private function prepareMsgSelect(param1:IDropMenuWindow) : void
      {
         Logger.log("MSG TEMPLATES: " + var_58.initMsg.messageTemplates.length);
         param1.populate(var_58.initMsg.messageTemplates);
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
         var_784 = null;
         var_411 = null;
         var_58 = null;
      }
      
      private function onSelectTemplate(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_53)
         {
            return;
         }
         var _loc3_:String = var_58.initMsg.messageTemplates["null"];
         if(_loc3_ != null)
         {
            var_303 = false;
            var_411.text = _loc3_;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1260;
      }
   }
}
