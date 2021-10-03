package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_91:Number = 0;
      
      private var var_213:int = 0;
      
      private var var_1915:int = 0;
      
      private var var_1916:Number = 0;
      
      private var var_1917:Number = 0;
      
      private var var_1912:Number = 0;
      
      private var var_1913:Number = 0;
      
      private var var_1914:Boolean = false;
      
      private var var_92:Number = 0;
      
      private var _id:int = 0;
      
      private var var_196:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_196 = [];
         super();
         _id = param1;
         var_92 = param2;
         _y = param3;
         var_91 = param4;
         var_1913 = param5;
         var_213 = param6;
         var_1915 = param7;
         var_1916 = param8;
         var_1917 = param9;
         var_1912 = param10;
         var_1914 = param11;
         var_196 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_91;
      }
      
      public function get dir() : int
      {
         return var_213;
      }
      
      public function get localZ() : Number
      {
         return var_1913;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1914;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1915;
      }
      
      public function get targetX() : Number
      {
         return var_1916;
      }
      
      public function get targetY() : Number
      {
         return var_1917;
      }
      
      public function get targetZ() : Number
      {
         return var_1912;
      }
      
      public function get x() : Number
      {
         return var_92;
      }
      
      public function get actions() : Array
      {
         return var_196.slice();
      }
   }
}
