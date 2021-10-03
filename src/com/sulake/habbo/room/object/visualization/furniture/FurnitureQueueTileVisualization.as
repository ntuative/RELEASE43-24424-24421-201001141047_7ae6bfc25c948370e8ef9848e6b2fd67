package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1122:int = 1;
      
      private static const const_1049:int = 3;
      
      private static const const_1123:int = 2;
      
      private static const const_1121:int = 15;
       
      
      private var var_862:int;
      
      private var var_231:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_231 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1123)
         {
            var_231 = new Array();
            var_231.push(const_1122);
            var_862 = const_1121;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_862 > 0)
         {
            --var_862;
         }
         if(var_862 == 0)
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
