package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1863:Class;
      
      private var var_1864:Class;
      
      private var var_1862:String;
      
      private var var_1181:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1862 = param1;
         var_1864 = param2;
         var_1863 = param3;
         if(rest == null)
         {
            var_1181 = new Array();
         }
         else
         {
            var_1181 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1863;
      }
      
      public function get assetClass() : Class
      {
         return var_1864;
      }
      
      public function get mimeType() : String
      {
         return var_1862;
      }
      
      public function get fileTypes() : Array
      {
         return var_1181;
      }
   }
}
