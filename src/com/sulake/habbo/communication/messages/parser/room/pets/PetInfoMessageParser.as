package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1612:int;
      
      private var var_559:String;
      
      private var var_1608:int;
      
      private var var_1554:int;
      
      private var var_1610:int;
      
      private var var_1940:int;
      
      private var _nutrition:int;
      
      private var var_1087:int;
      
      private var var_1943:int;
      
      private var var_1941:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1607:int;
      
      private var var_1942:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1608;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_1940;
      }
      
      public function flush() : Boolean
      {
         var_1087 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_1943;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1941;
      }
      
      public function get maxNutrition() : int
      {
         return var_1942;
      }
      
      public function get figure() : String
      {
         return var_559;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1554;
      }
      
      public function get petId() : int
      {
         return var_1087;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1087 = param1.readInteger();
         _name = param1.readString();
         var_1608 = param1.readInteger();
         var_1943 = param1.readInteger();
         var_1610 = param1.readInteger();
         var_1941 = param1.readInteger();
         _energy = param1.readInteger();
         var_1940 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_1942 = param1.readInteger();
         var_559 = param1.readString();
         var_1554 = param1.readInteger();
         var_1607 = param1.readInteger();
         var_1612 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1610;
      }
      
      public function get ownerId() : int
      {
         return var_1607;
      }
      
      public function get age() : int
      {
         return var_1612;
      }
   }
}
