package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1986:int;
      
      private var var_1983:Boolean;
      
      private var var_1724:int;
      
      private var var_1303:String;
      
      private var var_1982:Boolean = false;
      
      private var var_1784:int;
      
      private var var_423:int;
      
      private var var_1032:String;
      
      private var var_1952:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1117:int;
      
      private var var_1985:Boolean;
      
      private var var_1984:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1986 = param1;
         var_1032 = param2;
         _objId = param3;
         var_1117 = param4;
         var_1303 = param5;
         var_1983 = param6;
         var_1985 = param7;
         var_1784 = param8;
         var_1952 = param9;
         var_1724 = param10;
         var_423 = -1;
      }
      
      public function get songId() : int
      {
         return var_1724;
      }
      
      public function get iconCallbackId() : int
      {
         return var_423;
      }
      
      public function get expiryTime() : int
      {
         return var_1784;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1984 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1982 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_423 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1985;
      }
      
      public function get slotId() : String
      {
         return var_1952;
      }
      
      public function get classId() : int
      {
         return var_1117;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1983;
      }
      
      public function get stuffData() : String
      {
         return var_1303;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1986;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1982;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1984;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1032;
      }
   }
}
