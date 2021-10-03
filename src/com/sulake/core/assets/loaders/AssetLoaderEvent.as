package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_867:String = "AssetLoaderEventUnload";
      
      public static const const_45:String = "AssetLoaderEventError";
      
      public static const const_922:String = "AssetLoaderEventOpen";
      
      public static const const_941:String = "AssetLoaderEventProgress";
      
      public static const const_844:String = "AssetLoaderEventStatus";
      
      public static const const_31:String = "AssetLoaderEventComplete";
       
      
      private var var_357:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_357 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_357;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_357);
      }
   }
}
