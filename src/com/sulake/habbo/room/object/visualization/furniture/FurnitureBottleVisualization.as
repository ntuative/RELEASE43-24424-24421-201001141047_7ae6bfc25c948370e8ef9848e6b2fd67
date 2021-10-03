package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1049:int = -1;
      
      private static const const_750:int = 20;
      
      private static const const_490:int = 9;
       
      
      private var var_570:Boolean = false;
      
      private var var_231:Array;
      
      public function FurnitureBottleVisualization()
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
            var_231.push(const_1049);
            return;
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_570)
            {
               var_570 = false;
               var_231 = new Array();
               var_231.push(const_750);
               var_231.push(const_490 + param1);
               var_231.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
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
