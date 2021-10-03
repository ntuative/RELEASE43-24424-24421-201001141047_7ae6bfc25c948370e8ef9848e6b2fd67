package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_971:Boolean;
      
      private var _name:String;
      
      private var var_2171:String;
      
      private var var_970:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_2171 = String(param1.@link);
         var_970 = Boolean(parseInt(param1.@fliph));
         var_971 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_970;
      }
      
      public function get flipV() : Boolean
      {
         return var_971;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_2171;
      }
   }
}
