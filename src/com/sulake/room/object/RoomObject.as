package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1271:int = 0;
       
      
      private var var_74:Vector3d;
      
      private var _updateID:uint;
      
      private var _type:String = "";
      
      private var _visualization:IRoomObjectVisualization;
      
      private var var_93:RoomObjectModel;
      
      private var var_412:IRoomObjectEventHandler;
      
      private var var_1501:Vector3d;
      
      private var var_2104:int = 0;
      
      private var _id:int;
      
      private var var_1502:Vector3d;
      
      private var var_213:Vector3d;
      
      private var var_487:Array;
      
      public function RoomObject(param1:int, param2:uint)
      {
         super();
         _id = param1;
         var_74 = new Vector3d();
         var_213 = new Vector3d();
         var_1501 = new Vector3d();
         var_1502 = new Vector3d();
         var_487 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            var_487[_loc3_] = 0;
            _loc3_--;
         }
         var_93 = new RoomObjectModel();
         _visualization = null;
         var_412 = null;
         _updateID = 0;
         var_2104 = var_1271++;
      }
      
      public function getInstanceId() : int
      {
         return var_2104;
      }
      
      public function getId() : int
      {
         return _id;
      }
      
      public function getUpdateID() : uint
      {
         return _updateID;
      }
      
      public function dispose() : void
      {
         var_74 = null;
         var_213 = null;
         if(var_93 != null)
         {
            var_93.dispose();
            var_93 = null;
         }
         var_487 = null;
         setVisualization(null);
         setEventHandler(null);
      }
      
      public function getType() : String
      {
         return _type;
      }
      
      public function getLocation() : IVector3d
      {
         var_1501.assign(var_74);
         return var_1501;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_74.x != param1.x || var_74.y != param1.y || var_74.z != param1.z)
         {
            var_74.x = param1.x;
            var_74.y = param1.y;
            var_74.z = param1.z;
            ++_updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_213.x != param1.x || var_213.y != param1.y || var_213.z != param1.z)
         {
            var_213.x = (param1.x % 360 + 360) % 360;
            var_213.y = (param1.y % 360 + 360) % 360;
            var_213.z = (param1.z % 360 + 360) % 360;
            ++_updateID;
         }
      }
      
      public function setType(param1:String) : void
      {
         _type = param1;
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return var_412;
      }
      
      public function getDirection() : IVector3d
      {
         var_1502.assign(var_213);
         return var_1502;
      }
      
      public function setState(param1:int, param2:uint) : Boolean
      {
         if(param2 < var_487.length)
         {
            if(var_487[param2] != param1)
            {
               var_487[param2] = param1;
               ++_updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == var_412)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = var_412;
         if(_loc2_ != null)
         {
            var_412 = null;
            _loc2_.object = null;
         }
         var_412 = param1;
         if(var_412 != null)
         {
            var_412.object = this;
         }
      }
      
      public function getState(param1:uint) : int
      {
         if(param1 < var_487.length)
         {
            return var_487[param1];
         }
         return -1;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != _visualization)
         {
            if(_visualization != null)
            {
               _visualization.dispose();
            }
            _visualization = param1;
            if(_visualization != null)
            {
               _visualization.object = this;
            }
         }
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return _visualization;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return var_93;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return var_93;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return getEventHandler();
      }
   }
}
