package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_731;
         param1["bitmap"] = const_597;
         param1["border"] = const_598;
         param1["border_notify"] = const_1169;
         param1["button"] = const_379;
         param1["button_thick"] = const_700;
         param1["button_icon"] = const_1212;
         param1["button_group_left"] = const_686;
         param1["button_group_center"] = const_596;
         param1["button_group_right"] = const_728;
         param1["canvas"] = const_631;
         param1["checkbox"] = const_710;
         param1["closebutton"] = const_883;
         param1["container"] = const_321;
         param1["container_button"] = const_560;
         param1["display_object_wrapper"] = const_510;
         param1["dropmenu"] = const_383;
         param1["dropmenu_item"] = const_443;
         param1["frame"] = const_276;
         param1["frame_notify"] = const_1230;
         param1["header"] = const_681;
         param1["icon"] = const_826;
         param1["itemgrid"] = const_963;
         param1["itemgrid_horizontal"] = const_429;
         param1["itemgrid_vertical"] = const_559;
         param1["itemlist"] = const_905;
         param1["itemlist_horizontal"] = const_324;
         param1["itemlist_vertical"] = const_325;
         param1["maximizebox"] = const_1275;
         param1["menu"] = const_1363;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_978;
         param1["minimizebox"] = const_1310;
         param1["notify"] = const_1135;
         param1["com.sulake.habbo.friendlist.events"] = const_447;
         param1["password"] = const_727;
         param1["radiobutton"] = const_640;
         param1["region"] = const_412;
         param1["restorebox"] = const_1377;
         param1["scaler"] = const_843;
         param1["scaler_horizontal"] = const_1324;
         param1["scaler_vertical"] = const_1296;
         param1["scrollbar_horizontal"] = const_468;
         param1["scrollbar_vertical"] = const_548;
         param1["scrollbar_slider_button_up"] = const_797;
         param1["scrollbar_slider_button_down"] = const_912;
         param1["scrollbar_slider_button_left"] = const_936;
         param1["scrollbar_slider_button_right"] = const_798;
         param1["scrollbar_slider_bar_horizontal"] = const_874;
         param1["scrollbar_slider_bar_vertical"] = const_954;
         param1["scrollbar_slider_track_horizontal"] = const_997;
         param1["scrollbar_slider_track_vertical"] = const_793;
         param1["scrollable_itemlist"] = const_1158;
         param1["scrollable_itemlist_vertical"] = const_382;
         param1["scrollable_itemlist_horizontal"] = const_962;
         param1["selector"] = const_714;
         param1["selector_list"] = const_665;
         param1["submenu"] = const_978;
         param1["tab_button"] = const_573;
         param1["tab_container_button"] = const_1012;
         param1["tab_context"] = const_426;
         param1["tab_content"] = const_880;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_500;
         param1["input"] = const_502;
         param1["toolbar"] = const_1141;
         param1["tooltip"] = WINDOW_TYPE_TOOLTIP;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
