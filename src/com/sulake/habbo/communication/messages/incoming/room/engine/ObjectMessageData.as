package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_954:int = 0;
      
      private var _data:String = "";
      
      private var var_1492:int = -1;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var var_953:int = 0;
      
      private var var_2282:String = "";
      
      private var var_1784:int = 0;
      
      private var _id:int = 0;
      
      private var var_204:Boolean = false;
      
      private var var_213:int = 0;
      
      private var var_1785:String = null;
      
      private var var_92:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_91:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_204)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_204)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_213;
      }
      
      public function get extra() : int
      {
         return var_1492;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_204)
         {
            var_213 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_204)
         {
            var_92 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_204)
         {
            var_1492 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_91;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_204)
         {
            _state = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_1784;
      }
      
      public function get staticClass() : String
      {
         return var_1785;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_204)
         {
            var_1784 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_204)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_204)
         {
            var_1785 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_204 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_204)
         {
            var_954 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_204)
         {
            var_953 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_204)
         {
            var_91 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_954;
      }
      
      public function get x() : Number
      {
         return var_92;
      }
      
      public function get sizeY() : int
      {
         return var_953;
      }
   }
}
