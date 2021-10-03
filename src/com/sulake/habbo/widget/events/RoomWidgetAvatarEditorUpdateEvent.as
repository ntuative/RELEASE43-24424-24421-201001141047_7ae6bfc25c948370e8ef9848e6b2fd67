package com.sulake.habbo.widget.events
{
   public class RoomWidgetAvatarEditorUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_950:String = "RWAEUE_HIDE_CLUB_PROMO";
      
      public static const const_618:String = "RWUE_AVATAR_EDITOR_CLOSED";
      
      public static const const_1342:String = "RWAEUE_MODE_TRIAL";
      
      public static const const_864:String = "RWAEUE_MODE_FULL";
      
      public static const const_408:String = "RWAEUE_SHOW_CLUB_PROMO";
       
      
      private var var_1836:String;
      
      private var var_1837:String;
      
      public function RoomWidgetAvatarEditorUpdateEvent(param1:String, param2:String = "", param3:String = "RWAEUE_MODE_FULL", param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         var_1836 = param2;
         var_1837 = param3;
      }
      
      public function get promoMode() : String
      {
         return var_1837;
      }
      
      public function get promoImageUrl() : String
      {
         return var_1836;
      }
   }
}
