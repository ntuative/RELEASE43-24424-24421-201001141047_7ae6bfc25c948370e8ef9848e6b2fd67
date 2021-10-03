package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_935:String = "inventory_badges";
      
      public static const const_1327:String = "inventory_clothes";
      
      public static const const_1206:String = "inventory_furniture";
      
      public static const const_603:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_813:String = "inventory_effects";
       
      
      private var var_2020:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_603);
         var_2020 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_2020;
      }
   }
}
