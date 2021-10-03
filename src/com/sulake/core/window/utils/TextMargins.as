package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   
   public class TextMargins implements IMargins, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_726:int;
      
      private var _right:int;
      
      private var var_725:int;
      
      private var var_724:int;
      
      private var var_183:Function;
      
      public function TextMargins(param1:int, param2:int, param3:int, param4:int, param5:Function)
      {
         super();
         var_725 = param1;
         var_724 = param2;
         _right = param3;
         var_726 = param4;
         var_183 = param5 != null ? param5 : nullCallback;
      }
      
      public function set bottom(param1:int) : void
      {
         var_726 = param1;
         var_183(this);
      }
      
      public function get left() : int
      {
         return var_725;
      }
      
      public function get isZeroes() : Boolean
      {
         return var_725 == 0 && _right == 0 && var_724 == 0 && var_726 == 0;
      }
      
      public function get right() : int
      {
         return _right;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function set top(param1:int) : void
      {
         var_724 = param1;
         var_183(this);
      }
      
      public function get top() : int
      {
         return var_724;
      }
      
      public function set left(param1:int) : void
      {
         var_725 = param1;
         var_183(this);
      }
      
      public function get bottom() : int
      {
         return var_726;
      }
      
      public function clone(param1:Function) : TextMargins
      {
         return new TextMargins(var_725,var_724,_right,var_726,param1);
      }
      
      public function dispose() : void
      {
         var_183 = null;
         _disposed = true;
      }
      
      public function set right(param1:int) : void
      {
         _right = param1;
         var_183(this);
      }
      
      private function nullCallback(param1:IMargins) : void
      {
      }
   }
}
