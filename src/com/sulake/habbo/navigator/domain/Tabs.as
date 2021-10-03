package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_561:int = 6;
      
      public static const const_212:int = 5;
      
      public static const const_526:int = 2;
      
      public static const const_298:int = 9;
      
      public static const const_286:int = 4;
      
      public static const const_245:int = 2;
      
      public static const const_498:int = 4;
      
      public static const const_218:int = 8;
      
      public static const const_639:int = 7;
      
      public static const const_262:int = 3;
      
      public static const const_311:int = 1;
      
      public static const const_216:int = 5;
      
      public static const const_471:int = 12;
      
      public static const const_302:int = 1;
      
      public static const const_590:int = 11;
      
      public static const const_558:int = 3;
      
      public static const const_1556:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_393:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_393 = new Array();
         var_393.push(new Tab(_navigator,const_311,const_471,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_413));
         var_393.push(new Tab(_navigator,const_245,const_302,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_413));
         var_393.push(new Tab(_navigator,const_286,const_590,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_900));
         var_393.push(new Tab(_navigator,const_262,const_212,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_413));
         var_393.push(new Tab(_navigator,const_216,const_218,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_606));
         setSelectedTab(const_311);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_393)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_393)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_393)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_286;
      }
      
      public function get tabs() : Array
      {
         return var_393;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
