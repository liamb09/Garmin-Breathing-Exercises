import Toybox.Lang;
import Toybox.WatchUi;

class BreathingExercisesDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new BreathingExercisesMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}