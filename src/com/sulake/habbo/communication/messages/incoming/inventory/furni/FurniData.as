package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1303:String;
      
      private var var_1032:String;
      
      private var var_2022:Boolean;
      
      private var var_1492:int;
      
      private var var_1986:int;
      
      private var var_2023:Boolean;
      
      private var var_1952:String = "";
      
      private var var_1983:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1117:int;
      
      private var var_1985:Boolean;
      
      private var var_1724:int = -1;
      
      private var var_1784:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1986 = param1;
         var_1032 = param2;
         _objId = param3;
         var_1117 = param4;
         _category = param5;
         var_1303 = param6;
         var_2022 = param7;
         var_1983 = param8;
         var_1985 = param9;
         var_2023 = param10;
         var_1784 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1952;
      }
      
      public function get extra() : int
      {
         return var_1492;
      }
      
      public function get classId() : int
      {
         return var_1117;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2023;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2022;
      }
      
      public function get stripId() : int
      {
         return var_1986;
      }
      
      public function get stuffData() : String
      {
         return var_1303;
      }
      
      public function get songId() : int
      {
         return var_1724;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1952 = param1;
         var_1492 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1032;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1784;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1985;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1983;
      }
   }
}
