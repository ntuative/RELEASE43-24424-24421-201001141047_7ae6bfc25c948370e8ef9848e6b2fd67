package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var var_953:int = 0;
      
      private var var_91:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_204:Boolean = false;
      
      private var var_213:int = 0;
      
      private var _type:String = "";
      
      private var _name:String = "";
      
      private var var_92:Number = 0;
      
      private var var_954:int = 0;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_204)
         {
            var_91 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return var_953;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get dir() : int
      {
         return var_213;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         if(!var_204)
         {
            _name = param1;
         }
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_204)
         {
            var_213 = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_204)
         {
            _y = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_204 = true;
      }
      
      public function get z() : Number
      {
         return var_91;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_204)
         {
            var_953 = param1;
         }
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_204)
         {
            var_954 = param1;
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
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set type(param1:String) : void
      {
         if(!var_204)
         {
            _type = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_954;
      }
   }
}
