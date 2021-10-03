package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1050:int = 31;
      
      private static const const_1049:int = 32;
      
      private static const const_489:int = 30;
      
      private static const const_750:int = 20;
      
      private static const const_490:int = 10;
       
      
      private var var_570:Boolean = false;
      
      private var var_231:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_231 = new Array();
         super();
         super.setAnimation(const_489);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_570 = true;
            var_231 = new Array();
            var_231.push(const_1050);
            var_231.push(const_1049);
            return;
         }
         if(param1 > 0 && param1 <= const_490)
         {
            if(var_570)
            {
               var_570 = false;
               var_231 = new Array();
               if(_direction == 2)
               {
                  var_231.push(const_750 + 5 - param1);
                  var_231.push(const_490 + 5 - param1);
               }
               else
               {
                  var_231.push(const_750 + param1);
                  var_231.push(const_490 + param1);
               }
               var_231.push(const_489);
               return;
            }
            super.setAnimation(const_489);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
