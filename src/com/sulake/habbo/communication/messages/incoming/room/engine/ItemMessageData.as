package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_91:Number = 0;
      
      private var _data:String = "";
      
      private var var_1492:int = 0;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_2026:Boolean = false;
      
      private var var_2282:String = "";
      
      private var _id:int = 0;
      
      private var var_204:Boolean = false;
      
      private var var_213:String = "";
      
      private var var_2025:int = 0;
      
      private var var_2024:int = 0;
      
      private var var_1749:int = 0;
      
      private var var_1748:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_2026 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_204)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_2026;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_204)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_213;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_204)
         {
            var_1749 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_204)
         {
            var_2025 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_204)
         {
            var_2024 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_204)
         {
            var_213 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_204)
         {
            var_1748 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_204)
         {
            _state = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1749;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_204)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_2025;
      }
      
      public function get wallY() : Number
      {
         return var_2024;
      }
      
      public function get localY() : Number
      {
         return var_1748;
      }
      
      public function setReadOnly() : void
      {
         var_204 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_91;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_204)
         {
            var_91 = param1;
         }
      }
   }
}
