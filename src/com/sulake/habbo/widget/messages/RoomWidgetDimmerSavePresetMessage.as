package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_517:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_2051:int;
      
      private var var_2049:int;
      
      private var var_2050:Boolean;
      
      private var var_968:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_517);
         var_2049 = param1;
         var_2051 = param2;
         _color = param3;
         var_968 = param4;
         var_2050 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_2051;
      }
      
      public function get presetNumber() : int
      {
         return var_2049;
      }
      
      public function get brightness() : int
      {
         return var_968;
      }
      
      public function get apply() : Boolean
      {
         return var_2050;
      }
   }
}
