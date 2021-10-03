package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   
   public class EffectListProxy implements IThumbListDataProvider
   {
       
      
      private var var_457:int;
      
      private var var_93:EffectsModel;
      
      public function EffectListProxy(param1:EffectsModel, param2:int)
      {
         super();
         var_93 = param1;
         var_457 = param2;
      }
      
      public function getDrawableList() : Array
      {
         return var_93.getEffects(var_457);
      }
      
      public function dispose() : void
      {
         var_93 = null;
      }
   }
}
