import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class SettingsDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item) {
        if (item.getId().equals("vibe_setter")) {
            Application.Storage.setValue("vibration", !Application.Storage.getValue("vibration"));
        }
    }
}