package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1855:Date;
      
      private var var_1180:Boolean = false;
      
      private var _type:int;
      
      private var var_360:BitmapData;
      
      private var var_264:Boolean = false;
      
      private var var_1073:int;
      
      private var var_546:int = 1;
      
      private var var_966:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_360;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_546;
         if(var_546 < 0)
         {
            var_546 = 0;
         }
         var_966 = var_1073;
         var_264 = false;
         var_1180 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_966 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_264;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_360 = param1;
      }
      
      public function get duration() : int
      {
         return var_1073;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1180;
      }
      
      public function get effectsInInventory() : int
      {
         return var_546;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_360;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_264)
         {
            var_1855 = new Date();
         }
         var_264 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_546 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_264)
         {
            _loc1_ = var_966 - (new Date().valueOf() - var_1855.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_966;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1180 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1073 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
