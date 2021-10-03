package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRedeemClubPromoMessage extends RoomWidgetMessage
   {
      
      public static const const_605:String = "rwrcp_redeem_club_promo";
       
      
      private var var_2091:String;
      
      private var var_2092:Boolean;
      
      public function RoomWidgetRedeemClubPromoMessage(param1:String, param2:String, param3:Boolean)
      {
         super(param1);
         var_2091 = param2;
         var_2092 = param3;
      }
      
      public function get code() : String
      {
         return var_2091;
      }
      
      public function get isTrial() : Boolean
      {
         return var_2092;
      }
   }
}
