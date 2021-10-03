package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectRoomMaskUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_1205:String = "door";
      
      public static const const_466:String = "window";
      
      public static const const_540:String = "RORMUM_ADD_MASK";
      
      public static const const_368:String = "RORMUM_ADD_MASK";
      
      public static const const_190:String = "hole";
       
      
      private var var_1966:String = "";
      
      private var var_1967:String = "";
      
      private var var_1968:String = "window";
      
      private var var_1969:Vector3d = null;
      
      private var _type:String = "";
      
      public function RoomObjectRoomMaskUpdateMessage(param1:String, param2:String, param3:String = null, param4:IVector3d = null, param5:String = "window")
      {
         super(null,null);
         _type = param1;
         var_1967 = param2;
         var_1966 = param3;
         if(param4 != null)
         {
            var_1969 = new Vector3d(param4.x,param4.y,param4.z);
         }
         var_1968 = param5;
      }
      
      public function get maskCategory() : String
      {
         return var_1968;
      }
      
      public function get maskId() : String
      {
         return var_1967;
      }
      
      public function get maskLocation() : IVector3d
      {
         return var_1969;
      }
      
      public function get maskType() : String
      {
         return var_1966;
      }
      
      public function get type() : String
      {
         return _type;
      }
   }
}
