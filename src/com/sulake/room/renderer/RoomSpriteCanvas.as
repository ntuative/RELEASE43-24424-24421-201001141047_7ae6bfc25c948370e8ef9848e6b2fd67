package com.sulake.room.renderer
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.Map;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
   import com.sulake.room.renderer.cache.BitmapDataCache;
   import com.sulake.room.renderer.cache.RoomObjectLocationCache;
   import com.sulake.room.renderer.utils.ExtendedBitmap;
   import com.sulake.room.renderer.utils.ExtendedBitmapData;
   import com.sulake.room.renderer.utils.ExtendedSprite;
   import com.sulake.room.renderer.utils.ObjectMouseData;
   import com.sulake.room.renderer.utils.SortableSprite;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.utils.getTimer;
   
   public class RoomSpriteCanvas implements IRoomRenderingCanvas
   {
       
      
      private var _master:Sprite;
      
      private var _container:IRoomSpriteCanvasContainer;
      
      private var var_57:Sprite;
      
      private var var_1453:int = 0;
      
      private var var_472:Array;
      
      private var var_296:Map = null;
      
      private var var_471:Map;
      
      private var var_991:int;
      
      private var var_987:int = 0;
      
      private var var_823:RoomObjectLocationCache;
      
      private var var_824:Array;
      
      private var _id:String = "";
      
      private var var_1956:int = -1;
      
      private var var_137:Array;
      
      private var var_226:BitmapDataCache;
      
      private var _geometry:RoomGeometry;
      
      private var var_1955:Number = -10000000;
      
      private var var_1957:Number = -10000000;
      
      private var var_20:uint = 0;
      
      private var var_989:int;
      
      private var var_267:Sprite;
      
      private var var_990:IRoomRenderingCanvasMouseListener = null;
      
      private var var_988:Point;
      
      public function RoomSpriteCanvas(param1:IRoomSpriteCanvasContainer, param2:String, param3:int, param4:int, param5:int)
      {
         var_471 = new Map();
         var_988 = new Point();
         var_137 = [];
         var_472 = [];
         var_824 = [];
         super();
         _container = param1;
         _id = param2;
         _master = new Sprite();
         _master.mouseEnabled = false;
         var_57 = new Sprite();
         var_57.name = "canvas";
         var_57.mouseEnabled = false;
         _master.addChild(var_57);
         var_57.mouseEnabled = true;
         var_57.doubleClickEnabled = true;
         var_57.addEventListener(MouseEvent.CLICK,clickHandler);
         var_57.addEventListener(MouseEvent.DOUBLE_CLICK,clickHandler);
         _geometry = new RoomGeometry(param5,new Vector3d(-135,30,0),new Vector3d(11,11,5),new Vector3d(-135,0.5,0));
         var_226 = new BitmapDataCache(1024 * 1024 * 16);
         var _loc6_:* = null;
         if(_container != null)
         {
            _loc6_ = "null";
         }
         var_823 = new RoomObjectLocationCache(_loc6_);
         var_296 = new Map();
         initialize(param3,param4);
      }
      
      private function createSortableSprite(param1:BitmapData, param2:Boolean, param3:uint, param4:String, param5:String) : SortableSprite
      {
         var _loc6_:SortableSprite = new SortableSprite();
         updateSortableSprite(_loc6_,param1,param2,param3,param4,param5);
         return _loc6_;
      }
      
      private function updateSortableSprite(param1:SortableSprite, param2:BitmapData, param3:Boolean, param4:uint, param5:String, param6:String) : void
      {
         if(param1 == null || param2 == null)
         {
            return;
         }
         var _loc7_:BitmapData = getBitmapData(param2,param5,param3,param4);
         param1.bitmapData = _loc7_;
         param1.blendMode = param6;
      }
      
      public function update() : void
      {
         if(var_987 == 0)
         {
            checkMouseHits(var_988.x,var_988.y,MouseEvent.MOUSE_MOVE);
         }
         var_987 = 0;
         ++var_1453;
      }
      
      public function initialize(param1:int, param2:int) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(param2 < 1)
         {
            param2 = 1;
         }
         if(var_267 != null)
         {
            var_267.graphics.clear();
         }
         else
         {
            var_267 = new Sprite();
            var_267.name = "mask";
            _master.addChild(var_267);
         }
         var_267.graphics.beginFill(0);
         var_267.graphics.drawRect(0,0,param1,param2);
         var_989 = param1;
         var_991 = param2;
         var_57.graphics.clear();
         var_57.graphics.beginFill(var_20);
         var_57.graphics.drawRect(0,0,param1,param2);
         var_57.mask = var_267;
      }
      
      private function createMouseEvent(param1:int, param2:int, param3:int, param4:int, param5:String, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean) : RoomSpriteMouseEvent
      {
         var _loc11_:Number = param1 - var_989 / 2;
         var _loc12_:Number = param2 - var_991 / 2;
         var _loc13_:* = null;
         return new RoomSpriteMouseEvent(param5,_id,param6,_loc11_,_loc12_,param3,param4,param8,param7,param9,param10);
      }
      
      public function render(param1:int) : void
      {
         var _loc2_:int = getTimer();
         var _loc3_:int = 0;
         var _loc4_:String = "Canvas render times:";
         var _loc5_:int = -1;
         while(_loc5_ >= 0)
         {
            _loc4_ += " undefined";
            _loc5_--;
         }
         ErrorReportStorage.addDebugData("Canvas size","Canvas size: " + width + "x" + height + "@" + _geometry.scale);
         ErrorReportStorage.addDebugData("Canvas rendering time",_loc4_);
         ErrorReportStorage.addDebugData("Canvas render","Canvas rendering");
         if(_container == null || _geometry == null)
         {
            return;
         }
         if(param1 == var_1956)
         {
            return;
         }
         var_226.compress();
         var _loc6_:int = _container.getRoomObjectCount();
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:String = "";
         var _loc10_:* = null;
         var _loc11_:* = null;
         if(_loc6_ <= 100)
         {
            ErrorReportStorage.addDebugData("Canvas object count","Total RO count " + _loc6_);
         }
         else if(_loc6_ <= 500)
         {
            ErrorReportStorage.addDebugData("Canvas object count","Total RO count > 100 " + _loc6_);
         }
         else
         {
            ErrorReportStorage.addDebugData("Canvas object count","Total RO count > 500 " + _loc6_);
         }
         _loc7_ = 0;
         while(_loc7_ < _loc6_)
         {
            _loc10_ = _container.getRoomObjectWithIndex(_loc7_);
            if(_loc10_ != null)
            {
               _loc9_ = _container.getRoomObjectIdWithIndex(_loc7_);
               _loc11_ = _loc10_.getVisualization() as IRoomObjectSpriteVisualization;
               if(_loc11_ != null)
               {
                  ErrorReportStorage.addDebugData("Canvas object type","Updating RO " + _loc10_.getType());
                  _loc3_ = getTimer();
                  ErrorReportStorage.addDebugData("Canvas rendering split time","Canvas render split: " + (_loc3_ - _loc2_));
                  _loc11_.update(_geometry);
                  _loc8_ += renderObject(_loc10_,_loc9_,_loc8_);
                  ErrorReportStorage.addDebugData("Canvas object type","Updated RO " + _loc10_.getType());
               }
            }
            _loc7_++;
         }
         if(_loc8_ < var_137.length)
         {
            var_137.splice(_loc8_);
         }
         _loc3_ = getTimer();
         ErrorReportStorage.addDebugData("Canvas rendering split time","Canvas render split: " + (_loc3_ - _loc2_));
         var _loc12_:String = " ";
         if(true)
         {
            _loc12_ = " ";
         }
         else if(true)
         {
            _loc12_ = " > 500 ";
         }
         else
         {
            _loc12_ = " > 1000 ";
         }
         ErrorReportStorage.addDebugData("Canvas sprite count","Sorting sprites" + _loc12_ + var_137.length);
         var_137.sortOn("z",0 | 0);
         ErrorReportStorage.addDebugData("Canvas sprite count","Sorted sprites" + _loc12_ + var_137.length);
         var _loc13_:* = null;
         var _loc14_:int = 0;
         _loc7_ = 0;
         while(_loc7_ < _loc8_)
         {
            _loc13_ = var_137[_loc7_] as SortableSprite;
            updateSprite(_loc7_,_loc13_);
            _loc13_.bitmapData = null;
            _loc7_++;
         }
         cleanSprites(var_137.length);
         var_1956 = param1;
         ErrorReportStorage.addDebugData("Canvas render","Canvas rendered");
         var _loc15_:int = getTimer();
         if(false)
         {
            var_824.splice(0,1);
         }
         ErrorReportStorage.addDebugData("Canvas rendering split time","Canvas render split: " + (_loc15_ - _loc2_));
         var_824.push(_loc15_ - _loc2_);
      }
      
      public function set mouseListener(param1:IRoomRenderingCanvasMouseListener) : void
      {
         var_990 = param1;
      }
      
      public function get displayObject() : DisplayObject
      {
         return _master;
      }
      
      public function dispose() : void
      {
         if(_geometry != null)
         {
            _geometry.dispose();
            _geometry = null;
         }
         if(var_267 != null)
         {
            var_267 = null;
         }
         if(var_226 != null)
         {
            var_226.dispose();
            var_226 = null;
         }
         if(var_823 != null)
         {
            var_823.dispose();
            var_823 = null;
         }
         _container = null;
         cleanSprites(0,true);
         if(_master != null)
         {
            while(false)
            {
               _master.removeChildAt(0);
            }
            _master = null;
         }
         var_57 = null;
         var_267 = null;
         var_137 = [];
         if(var_471 != null)
         {
            var_471.dispose();
            var_471 = null;
         }
         var _loc1_:int = 0;
         if(var_472 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_472.length)
            {
               cleanSprite(var_472[_loc1_] as ExtendedSprite,true);
               _loc1_++;
            }
            var_472 = [];
         }
         if(var_296 != null)
         {
            var_296.dispose();
            var_296 = null;
         }
         var_990 = null;
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = false;
         if(param1.type == MouseEvent.CLICK || param1.type == MouseEvent.DOUBLE_CLICK)
         {
            _loc2_ = param1.type == MouseEvent.DOUBLE_CLICK;
            checkMouseClickHits(param1.localX,param1.localY,_loc2_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
         }
      }
      
      private function processMouseEvents() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(_container == null || var_296 == null)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < var_296.length)
         {
            _loc2_ = var_296.getKey(_loc1_);
            _loc3_ = var_296.getWithIndex(_loc1_);
            if(_loc2_ != null && _loc3_ != null)
            {
               _loc4_ = _container.getRoomObject(_loc2_);
               if(_loc4_ != null)
               {
                  if(var_990 != null)
                  {
                     var_990.processRoomCanvasMouseEvent(_loc3_,_loc4_,_id + var_1453,geometry);
                  }
                  else
                  {
                     _loc5_ = _loc4_.getMouseHandler();
                     if(_loc5_ != null)
                     {
                        _loc5_.mouseEvent(_loc3_,_geometry);
                     }
                  }
               }
            }
            _loc1_++;
         }
         var_296.reset();
      }
      
      private function getObjectId(param1:Sprite) : String
      {
         var _loc2_:* = null;
         if(param1 != null)
         {
            return param1.name;
         }
         return "";
      }
      
      private function getSprite(param1:int) : ExtendedSprite
      {
         if(param1 < 0 || param1 >= var_57.numChildren)
         {
            return null;
         }
         return var_57.getChildAt(param1) as ExtendedSprite;
      }
      
      private function getColoredBitmapData(param1:BitmapData, param2:uint, param3:String, param4:Boolean = false) : BitmapData
      {
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:* = null;
         var _loc5_:String = param3 + " " + param2;
         var _loc6_:* = null;
         if(param3.length > 0)
         {
            _loc6_ = var_226.getBitmapData(_loc5_);
            if(!param4)
            {
               return _loc6_;
            }
         }
         if(_loc6_ == null)
         {
            _loc7_ = uint(param2 >> 16 & 255);
            _loc8_ = uint(param2 >> 8 & 255);
            _loc9_ = uint(param2 & 255);
            _loc10_ = _loc7_ / 255;
            _loc11_ = _loc8_ / 255;
            _loc12_ = _loc9_ / 255;
            _loc6_ = param1.clone();
            _loc13_ = new ColorTransform(_loc10_,_loc11_,_loc12_);
            _loc6_.colorTransform(_loc6_.rect,_loc13_);
            if(param3.length > 0)
            {
               var_226.addBitmapData(_loc5_,_loc6_);
            }
         }
         return _loc6_;
      }
      
      public function get height() : int
      {
         return var_991;
      }
      
      public function handleMouseEvent(param1:int, param2:int, param3:String, param4:Boolean, param5:Boolean, param6:Boolean, param7:Boolean) : Boolean
      {
         var_988.x = param1;
         var_988.y = param2;
         return Boolean(checkMouseHits(param1,param2,param3,param4,param5,param6,param7));
      }
      
      private function cleanSprites(param1:int, param2:Boolean = false) : void
      {
         var _loc6_:* = null;
         if(var_57 == null)
         {
            return;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = -1;
         while(_loc5_ >= param1)
         {
            _loc3_ = var_57.getChildAt(_loc5_);
            _loc6_ = null;
            _loc4_ = _loc3_ as ExtendedSprite;
            cleanSprite(_loc4_,param2);
            _loc5_--;
         }
      }
      
      public function get width() : int
      {
         return var_989;
      }
      
      private function getSortableSprite(param1:int) : SortableSprite
      {
         if(param1 < 0 || param1 >= var_137.length)
         {
            return null;
         }
         return var_137[param1] as SortableSprite;
      }
      
      private function bufferMouseEvent(param1:RoomSpriteMouseEvent, param2:String) : void
      {
         if(var_296 != null && param1 != null)
         {
            var_296.add(param2,param1);
         }
      }
      
      private function checkMouseHits(param1:Number, param2:Number, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : Boolean
      {
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:String = "";
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = [];
         var _loc13_:* = null;
         var _loc14_:int = 0;
         _loc14_ = -1;
         while(_loc14_ >= 0)
         {
            _loc10_ = var_57.getChildAt(_loc14_) as ExtendedSprite;
            if(_loc10_ != null && _loc10_.hitTestPoint(param1 - _loc10_.x,param2 - _loc10_.y))
            {
               if(param3 != MouseEvent.CLICK && param3 != MouseEvent.DOUBLE_CLICK || !_loc10_.clickHandling)
               {
                  _loc9_ = getObjectId(_loc10_);
                  if(_loc12_.indexOf(_loc9_) < 0)
                  {
                     _loc16_ = _loc10_.tag;
                     _loc13_ = var_471.getValue(_loc9_) as ObjectMouseData;
                     if(_loc13_ != null)
                     {
                        if(_loc13_.spriteTag != _loc16_)
                        {
                           _loc11_ = createMouseEvent(0,0,0,0,MouseEvent.ROLL_OUT,_loc13_.spriteTag,param4,param5,param6,param7);
                           bufferMouseEvent(_loc11_,_loc9_);
                        }
                     }
                     if(param3 == MouseEvent.MOUSE_MOVE && (_loc13_ == null || _loc13_.spriteTag != _loc16_))
                     {
                        _loc11_ = createMouseEvent(param1,param2,param1 - _loc10_.x,param2 - _loc10_.y,MouseEvent.ROLL_OVER,_loc16_,param4,param5,param6,param7);
                     }
                     else
                     {
                        _loc11_ = createMouseEvent(param1,param2,param1 - _loc10_.y,param2 - _loc10_.y,param3,_loc16_,param4,param5,param6,param7);
                     }
                     if(_loc13_ == null)
                     {
                        _loc13_ = new ObjectMouseData();
                        _loc13_.objectId = _loc9_;
                        var_471.add(_loc9_,_loc13_);
                     }
                     _loc13_.spriteTag = _loc16_;
                     if(param3 != MouseEvent.MOUSE_MOVE || param1 != var_1955 || param2 != var_1957)
                     {
                        bufferMouseEvent(_loc11_,_loc9_);
                     }
                     _loc12_.push(_loc9_);
                  }
                  _loc8_ = true;
               }
            }
            _loc14_--;
         }
         var _loc15_:Array = var_471.getKeys();
         _loc14_ = 0;
         while(_loc14_ < _loc15_.length)
         {
            _loc17_ = _loc15_[_loc14_] as String;
            _loc18_ = _loc12_.indexOf(_loc17_);
            if(_loc18_ >= 0)
            {
               _loc15_[_loc14_] = null;
            }
            _loc14_++;
         }
         _loc14_ = 0;
         while(_loc14_ < _loc15_.length)
         {
            _loc9_ = _loc15_[_loc14_] as String;
            if(_loc9_ != null)
            {
               _loc13_ = var_471.remove(_loc9_) as ObjectMouseData;
               if(_loc13_ != null)
               {
                  _loc11_ = createMouseEvent(0,0,0,0,MouseEvent.ROLL_OUT,_loc13_.spriteTag,param4,param5,param6,param7);
                  bufferMouseEvent(_loc11_,_loc9_);
               }
            }
            _loc14_++;
         }
         processMouseEvents();
         var_1955 = param1;
         var_1957 = param2;
         ++var_987;
         return _loc8_;
      }
      
      private function createSprite(param1:SortableSprite, param2:int = -1) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(false)
         {
            _loc3_ = var_472.pop() as ExtendedSprite;
         }
         if(_loc3_ == null)
         {
            _loc3_ = new ExtendedSprite();
         }
         if(_loc3_.numChildren > 0)
         {
            _loc4_ = _loc3_.getChildAt(0) as Bitmap;
         }
         if(_loc4_ == null)
         {
            _loc4_ = new ExtendedBitmap();
            _loc4_.pixelSnapping = PixelSnapping.ALWAYS;
            _loc3_.addChildAt(_loc4_,0);
         }
         _loc3_.x = param1.x;
         _loc3_.y = param1.y;
         _loc3_.alpha = param1.alpha / 255;
         _loc3_.name = param1.name;
         _loc3_.tag = param1.tag;
         _loc3_.blendMode = param1.blendMode;
         _loc3_.varyingDepth = param1.varyingDepth;
         _loc3_.clickHandling = param1.clickHandling;
         _loc4_.bitmapData = param1.bitmapData;
         _loc3_.addChildAt(_loc4_,0);
         if(param1.capturesMouse)
         {
            _loc3_.alphaTolerance = 128;
         }
         else
         {
            _loc3_.alphaTolerance = 256;
         }
         if(param2 < 0 || param2 >= var_57.numChildren)
         {
            var_57.addChild(_loc3_);
         }
         else
         {
            var_57.addChildAt(_loc3_,param2);
         }
         _loc3_.mouseEnabled = false;
      }
      
      private function getFlippedBitmapData(param1:BitmapData, param2:String, param3:Boolean = false) : BitmapData
      {
         var _loc6_:* = null;
         var _loc4_:* = param2 + " FH";
         var _loc5_:* = null;
         if(param2.length > 0)
         {
            _loc5_ = var_226.getBitmapData(_loc4_);
            if(!param3)
            {
               return _loc5_;
            }
         }
         if(_loc5_ == null)
         {
            _loc5_ = new ExtendedBitmapData(param1.width,param1.height,true,16777215);
            _loc6_ = new Matrix();
            _loc6_.scale(-1,1);
            _loc6_.translate(param1.width,0);
            _loc5_.draw(param1,_loc6_);
            if(param2.length > 0)
            {
               var_226.addBitmapData(_loc4_,_loc5_);
            }
         }
         return _loc5_;
      }
      
      private function checkMouseClickHits(param1:Number, param2:Number, param3:Boolean, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : Boolean
      {
         var _loc15_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:String = "";
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:String = "null";
         if(param3)
         {
            _loc12_ = "null";
         }
         var _loc13_:* = [];
         var _loc14_:int = 0;
         _loc14_ = -1;
         while(_loc14_ >= 0)
         {
            _loc10_ = var_57.getChildAt(_loc14_) as ExtendedSprite;
            if(_loc10_ != null)
            {
               if(_loc10_.hitTestPoint(param1 - _loc10_.x,param2 - _loc10_.y))
               {
                  if(_loc10_.clickHandling)
                  {
                     _loc9_ = getObjectId(_loc10_);
                     if(_loc13_.indexOf(_loc9_) < 0)
                     {
                        _loc15_ = _loc10_.tag;
                        _loc11_ = createMouseEvent(param1,param2,param1 - _loc10_.y,param2 - _loc10_.y,_loc12_,_loc15_,param4,param5,param6,param7);
                        bufferMouseEvent(_loc11_,_loc9_);
                        _loc13_.push(_loc9_);
                     }
                  }
                  _loc8_ = true;
                  break;
               }
            }
            _loc14_--;
         }
         processMouseEvents();
         return _loc8_;
      }
      
      private function updateSprite(param1:int, param2:SortableSprite) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         if(param2 == null)
         {
            return false;
         }
         if(param1 < 0)
         {
            return false;
         }
         if(param1 >= var_57.numChildren)
         {
            createSprite(param2);
            return true;
         }
         var _loc3_:ExtendedSprite = var_57.getChildAt(param1) as ExtendedSprite;
         if(_loc3_ != null)
         {
            if(_loc3_.varyingDepth && !param2.varyingDepth)
            {
               var_57.removeChildAt(param1);
               var_472.push(_loc3_);
               return updateSprite(param1,param2);
            }
            if(!_loc3_.varyingDepth && param2.varyingDepth)
            {
               createSprite(param2,param1);
               return true;
            }
            if(param2.capturesMouse)
            {
               _loc3_.alphaTolerance = 128;
            }
            else
            {
               _loc3_.alphaTolerance = 256;
            }
            _loc4_ = null;
            if(_loc3_.numChildren > 0)
            {
               _loc4_ = _loc3_.getChildAt(0) as Bitmap;
            }
            if(_loc4_ == null)
            {
               _loc4_ = new ExtendedBitmap();
               _loc3_.addChildAt(_loc4_,0);
            }
            if(_loc4_ != null)
            {
               if(_loc3_.x != param2.x)
               {
                  _loc3_.x = param2.x;
               }
               if(_loc3_.y != param2.y)
               {
                  _loc3_.y = param2.y;
               }
               _loc5_ = param2.alpha / 255;
               if(_loc3_.alpha != _loc5_)
               {
                  _loc3_.alpha = _loc5_;
               }
               _loc3_.name = param2.name;
               _loc3_.tag = param2.tag;
               _loc3_.varyingDepth = param2.varyingDepth;
               if(_loc3_.blendMode != param2.blendMode)
               {
                  _loc3_.blendMode = param2.blendMode;
               }
               _loc3_.clickHandling = param2.clickHandling;
               if(_loc4_.bitmapData != param2.bitmapData)
               {
                  _loc4_.bitmapData = param2.bitmapData;
               }
               return true;
            }
            return false;
         }
         return false;
      }
      
      private function getBitmapData(param1:BitmapData, param2:String, param3:Boolean, param4:uint) : BitmapData
      {
         param4 &= 16777215;
         if(!param3 && param4 == 16777215)
         {
            return param1;
         }
         var _loc5_:* = null;
         var _loc6_:String = "";
         if(param3 && param4 != 16777215)
         {
            _loc6_ = param2 + " FH " + param4;
            if(param2.length > 0)
            {
               _loc5_ = var_226.getBitmapData(_loc6_);
            }
            if(_loc5_ == null)
            {
               _loc5_ = getColoredBitmapData(param1,param4,param2);
               if(_loc5_ != null)
               {
                  _loc5_ = getFlippedBitmapData(_loc5_,"",true);
                  var_226.addBitmapData(_loc6_,_loc5_);
                  return _loc5_;
               }
               _loc5_ = getFlippedBitmapData(_loc5_,param2);
               if(_loc5_ != null)
               {
                  _loc5_ = getColoredBitmapData(_loc5_,param4,"",true);
                  var_226.addBitmapData(_loc6_,_loc5_);
                  return _loc5_;
               }
               _loc5_ = getColoredBitmapData(param1,param4,param2,true);
               _loc5_ = getFlippedBitmapData(_loc5_,"",true);
               var_226.addBitmapData(_loc6_,_loc5_);
            }
         }
         else if(param3)
         {
            _loc5_ = getFlippedBitmapData(param1,param2,true);
         }
         else
         {
            _loc5_ = getColoredBitmapData(param1,param4,param2,true);
         }
         return _loc5_;
      }
      
      private function renderObject(param1:IRoomObject, param2:String, param3:int) : int
      {
         var _loc18_:* = null;
         if(param1 == null || var_137 == null)
         {
            return 0;
         }
         var _loc4_:IRoomObjectSpriteVisualization = param1.getVisualization() as IRoomObjectSpriteVisualization;
         if(_loc4_ == null)
         {
            return 0;
         }
         var _loc5_:int = _loc4_.spriteCount;
         var _loc6_:IVector3d = var_823.getScreenLocation(param1,_geometry);
         if(_loc6_ == null)
         {
            return 0;
         }
         var _loc7_:int = _loc6_.x;
         var _loc8_:int = _loc6_.y;
         var _loc9_:* = 0;
         if(_loc7_ > 0)
         {
            _loc9_ = Number(_loc7_ * 1.2e-7);
         }
         else
         {
            _loc9_ = Number(-_loc7_ * 1.2e-7);
         }
         _loc7_ += int(var_989 / 2);
         _loc8_ += int(var_991 / 2);
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc16_:* = null;
         var _loc17_:int = 0;
         while(_loc17_ < _loc5_)
         {
            _loc12_ = _loc4_.getSprite(_loc17_);
            if(_loc12_ != null && _loc12_.visible)
            {
               _loc16_ = _loc12_.asset;
               if(_loc16_ != null)
               {
                  _loc18_ = _loc16_.content as BitmapData;
                  if(_loc18_ != null)
                  {
                     _loc13_ = _loc7_;
                     _loc14_ = _loc8_;
                     _loc13_ += _loc12_.offsetX;
                     _loc14_ += _loc12_.offsetY;
                     if(_loc13_ + _loc18_.width >= 0 && _loc13_ < var_989 && (_loc14_ + _loc18_.height >= 0 && _loc14_ < var_991))
                     {
                        if(param3 + _loc10_ < var_137.length)
                        {
                           _loc11_ = var_137[param3 + _loc10_];
                           updateSortableSprite(_loc11_,_loc18_,_loc12_.flipH,_loc12_.color,_loc12_.assetName,_loc12_.blendMode);
                        }
                        else
                        {
                           _loc11_ = createSortableSprite(_loc18_,_loc12_.flipH,_loc12_.color,_loc12_.assetName,_loc12_.blendMode);
                           var_137.push(_loc11_);
                        }
                        _loc11_.name = param2;
                        _loc11_.tag = _loc12_.tag;
                        _loc11_.varyingDepth = _loc12_.varyingDepth;
                        _loc11_.clickHandling = _loc12_.clickHandling;
                        _loc11_.x = _loc13_;
                        _loc11_.y = _loc14_;
                        _loc11_.z = _loc6_.z + _loc12_.relativeDepth;
                        _loc11_.z += _loc9_;
                        _loc11_.z += 3.7e-11 * (param3 + _loc10_ + 1);
                        _loc11_.alpha = _loc12_.alpha;
                        _loc11_.color = _loc12_.color;
                        _loc11_.capturesMouse = _loc12_.capturesMouse;
                        _loc10_++;
                     }
                  }
               }
            }
            _loc17_++;
         }
         return _loc10_;
      }
      
      public function get geometry() : IRoomGeometry
      {
         return _geometry;
      }
      
      private function cleanSprite(param1:ExtendedSprite, param2:Boolean) : void
      {
         var _loc3_:* = null;
         if(param1 != null)
         {
            if(!param2)
            {
               _loc3_ = param1.removeChildAt(0) as Bitmap;
               if(_loc3_ != null)
               {
                  _loc3_.bitmapData = null;
               }
            }
            else
            {
               param1.dispose();
            }
         }
      }
   }
}
