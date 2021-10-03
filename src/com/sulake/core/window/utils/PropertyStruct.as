package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_569:String = "Rectangle";
      
      public static const const_54:String = "Boolean";
      
      public static const const_702:String = "Number";
      
      public static const const_60:String = "int";
      
      public static const STRING:String = "String";
      
      public static const const_610:String = "Point";
      
      public static const const_853:String = "Array";
      
      public static const const_862:String = "uint";
      
      public static const const_452:String = "hex";
      
      public static const const_871:String = "Map";
       
      
      private var var_564:String;
      
      private var var_180:Object;
      
      private var var_2240:Boolean;
      
      private var _type:String;
      
      private var var_1993:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_564 = param1;
         var_180 = param2;
         _type = param3;
         var_1993 = param4;
         var_2240 = param3 == const_871 || param3 == const_853 || param3 == const_610 || param3 == const_569;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_452:
               return "0x" + uint(var_180).toString(16);
            case const_54:
               return Boolean(var_180) == true ? "true" : "false";
            case const_610:
               return "Point(" + Point(var_180).x + ", " + Point(var_180).y + ")";
            case const_569:
               return "Rectangle(" + Rectangle(var_180).x + ", " + Rectangle(var_180).y + ", " + Rectangle(var_180).width + ", " + Rectangle(var_180).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_871:
               _loc3_ = var_180 as Map;
               _loc1_ = "<var key=\"" + var_564 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_853:
               _loc4_ = var_180 as Array;
               _loc1_ = "<var key=\"" + var_564 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_610:
               _loc5_ = var_180 as Point;
               _loc1_ = "<var key=\"" + var_564 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_60 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_60 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_569:
               _loc6_ = var_180 as Rectangle;
               _loc1_ = "<var key=\"" + var_564 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_60 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_60 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_60 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_60 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_452:
               _loc1_ = "<var key=\"" + var_564 + "\" value=\"" + "0x" + uint(var_180).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_564 + "\" value=\"" + var_180 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_180;
      }
      
      public function get valid() : Boolean
      {
         return var_1993;
      }
      
      public function get key() : String
      {
         return var_564;
      }
   }
}
