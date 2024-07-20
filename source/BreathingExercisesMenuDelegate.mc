import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class BreathingExercisesMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :box_breathing) {
            WatchUi.popView(WatchUi.SLIDE_DOWN);
            var view = new BoxBreathingView();
            WatchUi.pushView(view, new BoxBreathingDelegate(view, 2), WatchUi.SLIDE_UP);
        } else if (item == :item_2) {
            System.println("item 2");
        }
    }

}