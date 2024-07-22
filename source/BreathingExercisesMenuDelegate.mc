import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class BreathingExercisesMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        var view = new TimePickerView();
        if (item == :box_breathing) {
            WatchUi.pushView(view, new TimePickerDelegate(view, "Box Breathing"), WatchUi.SLIDE_UP);
        } else if (item == :Four78_breathing) {
            WatchUi.pushView(view, new TimePickerDelegate(view, "4-7-8 Breathing"), WatchUi.SLIDE_UP);
        }
    }

}