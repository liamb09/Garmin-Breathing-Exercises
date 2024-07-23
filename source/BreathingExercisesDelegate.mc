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
        // TODO: add settings page and vibration
    }

    function onKey (keyEvent) {
        // up
        if (keyEvent.getKey() == 13) {

        // down
        } else if (keyEvent.getKey() == 8) {
            var menu = new WatchUi.Menu2({:title=>"Settings"});
            var vibeEnabled = Application.Storage.getValue("vibration");
            menu.addItem(
                new ToggleMenuItem(
                    "Vibration",
                    null,
                    "vibe_setter",
                    vibeEnabled,
                    {}
                )
            );
            WatchUi.pushView(menu, new SettingsDelegate(), WatchUi.SLIDE_UP);
        // back
        } else if (keyEvent.getKey() == 5) {
            
        }
        return true;
    }

}