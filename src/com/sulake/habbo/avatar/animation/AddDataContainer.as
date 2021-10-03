package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1378:String;
      
      private var var_1395:String;
      
      private var var_959:String;
      
      private var var_395:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1378 = String(param1.@align);
         var_959 = String(param1.@base);
         var_1395 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_395 = Number(_loc2_);
            if(var_395 > 1)
            {
               var_395 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1378;
      }
      
      public function get ink() : String
      {
         return var_1395;
      }
      
      public function get base() : String
      {
         return var_959;
      }
      
      public function get isBlended() : Boolean
      {
         return var_395 != 1;
      }
      
      public function get blend() : Number
      {
         return var_395;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
