package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_711:String = "RWOCM_CLUB_MAIN";
      
      public static const const_579:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1783:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_579);
         var_1783 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1783;
      }
   }
}
