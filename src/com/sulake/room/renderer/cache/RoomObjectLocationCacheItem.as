package com.sulake.room.renderer.cache
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectLocationCacheItem
   {
       
      
      private var var_1679:int = -1;
      
      private var var_1116:int = -1;
      
      private var var_618:Vector3d = null;
      
      public function RoomObjectLocationCacheItem()
      {
         super();
         var_618 = new Vector3d();
      }
      
      public function get objectUpdateId() : int
      {
         return var_1679;
      }
      
      public function set objectUpdateId(param1:int) : void
      {
         var_1679 = param1;
      }
      
      public function set screenLoc(param1:IVector3d) : void
      {
         var_618.assign(param1);
         var_618.x = Math.round(var_618.x);
         var_618.y = Math.round(var_618.y);
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         var_1116 = param1;
      }
      
      public function get screenLoc() : IVector3d
      {
         return var_618;
      }
      
      public function get geometryUpdateId() : int
      {
         return var_1116;
      }
   }
}
