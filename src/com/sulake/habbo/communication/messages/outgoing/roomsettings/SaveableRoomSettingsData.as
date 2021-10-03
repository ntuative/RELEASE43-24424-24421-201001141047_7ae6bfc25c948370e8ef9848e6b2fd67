package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var var_2037:Boolean;
      
      private var var_2039:Array;
      
      private var var_1867:Boolean;
      
      private var var_1067:String;
      
      private var var_2040:Boolean;
      
      private var var_2038:int;
      
      private var var_1874:int;
      
      private var var_1105:int;
      
      private var var_2035:Boolean;
      
      private var _roomId:int;
      
      private var var_1868:Boolean;
      
      private var _name:String;
      
      private var _password:String;
      
      private var var_587:Array;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_2037 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return var_2038;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_2038 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_587;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1867;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1868;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_2039 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_587 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_2037;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function get categoryId() : int
      {
         return var_1105;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1867 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         var_1868 = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         var_2035 = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         var_2040 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_2039;
      }
      
      public function get showOwnerName() : Boolean
      {
         return var_2035;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return var_2040;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1874 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1874;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1105 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1067 = param1;
      }
      
      public function get description() : String
      {
         return var_1067;
      }
   }
}
