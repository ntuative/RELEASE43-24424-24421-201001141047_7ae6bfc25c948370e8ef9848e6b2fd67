package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1389:BigInteger;
      
      private var var_943:BigInteger;
      
      private var var_1766:BigInteger;
      
      private var var_1390:BigInteger;
      
      private var var_1765:BigInteger;
      
      private var var_1764:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1389 = param1;
         var_1766 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1765.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1390 = new BigInteger();
         var_1390.fromRadix(param1,param2);
         var_1765 = var_1390.modPow(var_943,var_1389);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1764.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_943 = new BigInteger();
         var_943.fromRadix(param1,param2);
         var_1764 = var_1766.modPow(var_943,var_1389);
         return true;
      }
   }
}
