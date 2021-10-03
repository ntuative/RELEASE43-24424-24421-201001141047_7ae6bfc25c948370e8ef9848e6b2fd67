package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   
   public class AvatarPopupCtrl extends PopupCtrl
   {
       
      
      private var var_1106:String;
      
      private var var_1428:String;
      
      private var var_1103:String;
      
      private var var_1846:String;
      
      private var var_648:Boolean;
      
      private var var_1845:String;
      
      public function AvatarPopupCtrl(param1:HabboFriendList)
      {
         super(param1,5,-5,"avatar_popup");
      }
      
      public function setData(param1:Boolean, param2:String, param3:String, param4:String, param5:String, param6:String = "") : void
      {
         var_648 = param1;
         var_1428 = param2;
         var_1846 = param3;
         var_1845 = param4;
         var_1106 = param5;
         var_1103 = param6;
      }
      
      override public function refreshContent(param1:IWindowContainer) : void
      {
         Util.hideChildren(param1);
         if(var_1103 != "")
         {
            friendList.refreshText(param1,"name_text_online",var_648,var_1103);
         }
         else
         {
            friendList.refreshText(param1,"name_text_online",var_648,var_1428);
         }
         friendList.refreshText(param1,"name_text_offline",!var_648,var_1428);
         friendList.refreshText(param1,"motto_text",var_648,var_1846);
         friendList.refreshButton(param1,"offline",!var_648,null,0);
         if(var_648)
         {
            refreshFigure(param1,var_1845);
            param1.findChildByName("online_text").visible = true;
         }
         else
         {
            param1.findChildByName("last_access_text").visible = true;
            friendList.registerParameter("friendlist.avatarpopup.lastaccess","last_access",var_1106 == null ? "" : var_1106);
         }
         param1.height = Util.getLowestPoint(param1) + 10;
      }
      
      private function refreshFigure(param1:IWindowContainer, param2:String) : void
      {
         var _loc3_:IBitmapWrapperWindow = param1.getChildByName(HabboFriendList.const_174) as IBitmapWrapperWindow;
         if(param2 == null || param2 == "")
         {
            _loc3_.visible = false;
         }
         else
         {
            _loc3_.bitmap = friendList.getAvatarFaceBitmap(param2);
            _loc3_.width = _loc3_.bitmap.width;
            _loc3_.height = _loc3_.bitmap.height;
            _loc3_.visible = true;
         }
      }
   }
}
