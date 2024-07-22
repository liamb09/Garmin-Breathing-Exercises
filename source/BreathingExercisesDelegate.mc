import Toybox.Lang;
import Toybox.WatchUi;

class BreathingExercisesDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        openMenu();
        return true;
    }

    function onSelect () as Boolean {
        openMenu();
        return true;
    }

    function openMenu () as Void {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new BreathingExercisesMenuDelegate(), WatchUi.SLIDE_UP);
    }

}