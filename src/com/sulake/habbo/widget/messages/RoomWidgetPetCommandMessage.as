package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPetCommandMessage extends RoomWidgetMessage
   {
      
      public static const const_662:String = "RWPCM_REQUEST_PET_COMMANDS";
      
      public static const const_636:String = "RWPCM_PET_COMMAND";
       
      
      private var var_180:String;
      
      private var var_1087:int = 0;
      
      public function RoomWidgetPetCommandMessage(param1:String, param2:int, param3:String = null)
      {
         super(param1);
         var_1087 = param2;
         var_180 = param3;
      }
      
      public function get value() : String
      {
         return var_180;
      }
      
      public function get petId() : int
      {
         return var_1087;
      }
   }
}
