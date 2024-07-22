import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class BreathingExercisesMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :box_breathing) {
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
            var view = new TimePickerView();
            WatchUi.pushView(view, new TimePickerDelegate(view, "Box Breathing"), WatchUi.SLIDE_UP);
        } else if (item == :item_2) {
            System.println("item 2");
        }
    }

}