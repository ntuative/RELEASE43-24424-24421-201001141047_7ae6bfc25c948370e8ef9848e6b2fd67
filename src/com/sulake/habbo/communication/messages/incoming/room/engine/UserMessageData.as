package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1208:String = "F";
      
      public static const const_873:String = "M";
       
      
      private var var_92:Number = 0;
      
      private var var_559:String = "";
      
      private var var_2100:int = 0;
      
      private var var_1891:String = "";
      
      private var var_1892:int = 0;
      
      private var var_1663:int = 0;
      
      private var var_1890:String = "";
      
      private var var_1069:String = "";
      
      private var _id:int = 0;
      
      private var var_204:Boolean = false;
      
      private var var_213:int = 0;
      
      private var var_2099:String = "";
      
      private var _name:String = "";
      
      private var var_1665:int = 0;
      
      private var _y:Number = 0;
      
      private var var_91:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_91;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_213;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_204)
         {
            var_213 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_204)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2100;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_204)
         {
            var_1892 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2099;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_204)
         {
            var_1890 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_204)
         {
            var_2099 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_204)
         {
            var_1663 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_204)
         {
            var_559 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_204)
         {
            var_2100 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_204)
         {
            var_1069 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1892;
      }
      
      public function get groupID() : String
      {
         return var_1890;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_204)
         {
            var_1665 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_204)
         {
            var_1891 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_204 = true;
      }
      
      public function get sex() : String
      {
         return var_1069;
      }
      
      public function get figure() : String
      {
         return var_559;
      }
      
      public function get webID() : int
      {
         return var_1665;
      }
      
      public function get custom() : String
      {
         return var_1891;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_204)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_204)
         {
            var_91 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_204)
         {
            var_92 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_92;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1663;
      }
   }
}
