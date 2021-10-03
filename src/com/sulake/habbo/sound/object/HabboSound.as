package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_981:SoundChannel = null;
      
      private var var_809:Boolean;
      
      private var var_982:Sound = null;
      
      private var var_630:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_982 = param1;
         var_982.addEventListener(Event.COMPLETE,onComplete);
         var_630 = 1;
         var_809 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_809;
      }
      
      public function stop() : Boolean
      {
         var_981.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_809 = false;
         var_981 = var_982.play(0);
         this.volume = var_630;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_630;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_981.position;
      }
      
      public function get length() : Number
      {
         return var_982.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_630 = param1;
         if(var_981 != null)
         {
            var_981.soundTransform = new SoundTransform(var_630);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_809 = true;
      }
   }
}
