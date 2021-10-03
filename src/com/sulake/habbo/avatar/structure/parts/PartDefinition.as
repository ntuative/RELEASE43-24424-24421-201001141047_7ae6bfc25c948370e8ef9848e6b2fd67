package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1454:int = -1;
      
      private var var_1215:Boolean;
      
      private var var_1216:String;
      
      private var var_1964:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1964 = String(param1["set-type"]);
         var_1216 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1215 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1454 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1216;
      }
      
      public function get staticId() : int
      {
         return var_1454;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1454 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1215;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1215 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1216 = param1;
      }
      
      public function get setType() : String
      {
         return var_1964;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
