package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1050:int = 31;
      
      private static const const_1049:int = 32;
      
      private static const const_750:int = 10;
      
      private static const const_490:int = 20;
       
      
      private var var_570:Boolean = false;
      
      private var var_231:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_231 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_570 = true;
            var_231 = new Array();
            var_231.push(const_1050);
            var_231.push(const_1049);
            return;
         }
         if(param1 > 0 && param1 <= const_750)
         {
            if(var_570)
            {
               var_570 = false;
               var_231 = new Array();
               var_231.push(const_750 + param1);
               var_231.push(const_490 + param1);
               var_231.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(false)
            {
               super.setAnimation(var_231.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
