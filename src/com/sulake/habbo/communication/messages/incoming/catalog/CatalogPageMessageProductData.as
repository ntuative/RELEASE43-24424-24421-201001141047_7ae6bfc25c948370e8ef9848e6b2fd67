package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_215:String = "e";
      
      public static const const_74:String = "i";
      
      public static const const_76:String = "s";
       
      
      private var var_1001:String;
      
      private var var_1243:String;
      
      private var var_1245:int;
      
      private var var_2172:int;
      
      private var var_1000:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1243 = param1.readString();
         var_2172 = param1.readInteger();
         var_1001 = param1.readString();
         var_1000 = param1.readInteger();
         var_1245 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1000;
      }
      
      public function get productType() : String
      {
         return var_1243;
      }
      
      public function get expiration() : int
      {
         return var_1245;
      }
      
      public function get furniClassId() : int
      {
         return var_2172;
      }
      
      public function get extraParam() : String
      {
         return var_1001;
      }
   }
}
