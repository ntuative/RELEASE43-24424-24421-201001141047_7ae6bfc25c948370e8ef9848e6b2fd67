package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_970:String = "select_outfit";
       
      
      private var var_1844:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_970);
         var_1844 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_1844;
      }
   }
}
