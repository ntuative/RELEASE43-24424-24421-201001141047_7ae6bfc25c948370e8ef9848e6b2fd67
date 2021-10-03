package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1032:String;
      
      private var var_2075:int;
      
      private var var_2081:int;
      
      private var var_1492:int;
      
      private var var_2085:int;
      
      private var _category:int;
      
      private var var_2293:int;
      
      private var var_2082:int;
      
      private var var_2087:int;
      
      private var var_2086:int;
      
      private var var_2084:int;
      
      private var var_2083:Boolean;
      
      private var var_1303:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_2075 = param1;
         var_1032 = param2;
         var_2081 = param3;
         var_2086 = param4;
         _category = param5;
         var_1303 = param6;
         var_1492 = param7;
         var_2087 = param8;
         var_2082 = param9;
         var_2084 = param10;
         var_2085 = param11;
         var_2083 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_2086;
      }
      
      public function get extra() : int
      {
         return var_1492;
      }
      
      public function get stuffData() : String
      {
         return var_1303;
      }
      
      public function get groupable() : Boolean
      {
         return var_2083;
      }
      
      public function get creationMonth() : int
      {
         return var_2084;
      }
      
      public function get roomItemID() : int
      {
         return var_2081;
      }
      
      public function get itemType() : String
      {
         return var_1032;
      }
      
      public function get itemID() : int
      {
         return var_2075;
      }
      
      public function get songID() : int
      {
         return var_1492;
      }
      
      public function get timeToExpiration() : int
      {
         return var_2087;
      }
      
      public function get creationYear() : int
      {
         return var_2085;
      }
      
      public function get creationDay() : int
      {
         return var_2082;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
