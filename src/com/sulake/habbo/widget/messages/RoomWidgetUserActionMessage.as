package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_594:String = "RWUAM_RESPECT_USER";
      
      public static const const_507:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_523:String = "RWUAM_START_TRADING";
      
      public static const const_724:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_535:String = "RWUAM_WHISPER_USER";
      
      public static const const_677:String = "RWUAM_IGNORE_USER";
      
      public static const const_374:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_566:String = "RWUAM_BAN_USER";
      
      public static const const_732:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_346:String = "RWUAM_KICK_USER";
      
      public static const const_547:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_682:String = " RWUAM_RESPECT_PET";
      
      public static const const_440:String = "RWUAM_KICK_BOT";
      
      public static const const_1247:String = "RWUAM_TRAIN_PET";
      
      public static const const_713:String = "RWUAM_PICKUP_PET";
      
      public static const const_729:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_533:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
