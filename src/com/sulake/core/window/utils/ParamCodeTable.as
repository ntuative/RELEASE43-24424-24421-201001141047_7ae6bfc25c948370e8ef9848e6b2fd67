package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["com.sulake.habbo.friendlist.events"] = const_94;
         param1["bound_to_parent_rect"] = const_84;
         param1["child_window"] = const_836;
         param1["embedded_controller"] = const_317;
         param1["resize_to_accommodate_children"] = const_59;
         param1["input_event_processor"] = const_48;
         param1["internal_event_handling"] = const_718;
         param1["mouse_dragging_target"] = const_213;
         param1["mouse_dragging_trigger"] = const_301;
         param1["mouse_scaling_target"] = const_238;
         param1["mouse_scaling_trigger"] = const_439;
         param1["horizontal_mouse_scaling_trigger"] = const_221;
         param1["vertical_mouse_scaling_trigger"] = const_217;
         param1["observe_parent_input_events"] = const_849;
         param1["optimize_region_to_layout_size"] = const_371;
         param1["parent_window"] = const_835;
         param1["relative_horizontal_scale_center"] = const_152;
         param1["relative_horizontal_scale_fixed"] = const_124;
         param1["relative_horizontal_scale_move"] = const_297;
         param1["relative_horizontal_scale_strech"] = const_243;
         param1["relative_scale_center"] = const_926;
         param1["relative_scale_fixed"] = const_546;
         param1["relative_scale_move"] = const_812;
         param1["relative_scale_strech"] = const_916;
         param1["relative_vertical_scale_center"] = const_161;
         param1["relative_vertical_scale_fixed"] = const_112;
         param1["relative_vertical_scale_move"] = const_323;
         param1["relative_vertical_scale_strech"] = const_265;
         param1["on_resize_align_left"] = const_550;
         param1["on_resize_align_right"] = const_461;
         param1["on_resize_align_center"] = const_363;
         param1["on_resize_align_top"] = const_650;
         param1["on_resize_align_bottom"] = const_378;
         param1["on_resize_align_middle"] = const_352;
         param1["on_accommodate_align_left"] = const_946;
         param1["on_accommodate_align_right"] = const_472;
         param1["on_accommodate_align_center"] = const_508;
         param1["on_accommodate_align_top"] = const_957;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_691;
         param1["route_input_events_to_parent"] = const_372;
         param1["use_parent_graphic_context"] = const_30;
         param1["draggable_with_mouse"] = const_827;
         param1["scalable_with_mouse"] = const_955;
         param1["reflect_horizontal_resize_to_parent"] = const_425;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_247;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
