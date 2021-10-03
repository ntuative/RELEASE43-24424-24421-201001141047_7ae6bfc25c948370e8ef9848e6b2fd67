package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_334:Number = 0.5;
      
      private static const const_753:int = 3;
      
      private static const const_1060:Number = 1;
       
      
      private var var_1795:Boolean = false;
      
      private var var_1792:Boolean = false;
      
      private var var_945:int = 0;
      
      private var var_257:Vector3d = null;
      
      private var var_1790:int = 0;
      
      private var var_1787:int = 0;
      
      private var var_1786:Boolean = false;
      
      private var var_1794:int = -2;
      
      private var var_1789:Boolean = false;
      
      private var var_1791:int = 0;
      
      private var var_1793:int = -1;
      
      private var var_385:Vector3d = null;
      
      private var var_1788:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1790;
      }
      
      public function get targetId() : int
      {
         return var_1793;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1791 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1790 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1795 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1793 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1792 = param1;
      }
      
      public function dispose() : void
      {
         var_385 = null;
         var_257 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_385 == null)
         {
            var_385 = new Vector3d();
         }
         var_385.assign(param1);
         var_945 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1794;
      }
      
      public function get screenHt() : int
      {
         return var_1788;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1787 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_257;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1788 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1791;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1795;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1792;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_385 != null && var_257 != null)
         {
            ++var_945;
            _loc2_ = Vector3d.dif(var_385,var_257);
            if(_loc2_.length <= const_334)
            {
               var_257 = var_385;
               var_385 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_334 * (const_753 + 1))
               {
                  _loc2_.mul(const_334);
               }
               else if(var_945 <= const_753)
               {
                  _loc2_.mul(const_334);
               }
               else
               {
                  _loc2_.mul(const_1060);
               }
               var_257 = Vector3d.sum(var_257,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1786 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1787;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1789 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1794 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_257 != null)
         {
            return;
         }
         var_257 = new Vector3d();
         var_257.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1786;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1789;
      }
   }
}
