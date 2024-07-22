import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Timer;

class TimePickerDelegate extends WatchUi.BehaviorDelegate {

    private var _view;
    private var _nextExercise;

    private var _focus = "minutes";
    private var _minutes = 5;
    private var _seconds = 0;

    function initialize(_myView, _myNextExercise) {
        BehaviorDelegate.initialize();
        _view = _myView;
        _nextExercise = _myNextExercise;
    }

    function onKey (keyEvent) {
        // up
        if (keyEvent.getKey() == 13) {
            if (_focus.equals("minutes")) {
                _minutes++;
                if (_minutes == 60) {
                    _minutes = 0;
                }
                System.println(_minutes);
                _view.setMinutes(_minutes);
            } else if (_focus.equals("seconds")) {
                _seconds++;
                _seconds %= 60;
                _view.setSeconds(_seconds);
            }
        // down
        } else if (keyEvent.getKey() == 8) {
            if (_focus.equals("minutes")) {
                _minutes--;
                if (_minutes == -1) {
                    _minutes = 59;
                }
                _view.setMinutes(_minutes);
            } else if (_focus.equals("seconds")) {
                _seconds--;
                _seconds = (_seconds+60)%60;
                _view.setSeconds(_seconds);
            }
        // back
        } else if (keyEvent.getKey() == 5) {
            if (_focus.equals("seconds")) {
                _focus = "minutes";
                _view.setFocus("minutes");
            } else if (_focus.equals("minutes")) {
                WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
            }
        }
        return true;
    }

    function onSelect () as Boolean {
        if (_focus.equals("minutes")) {
            _focus = "seconds";
            _view.setFocus("seconds");
        } else if (_focus.equals("seconds")) {
            if (_nextExercise.equals("Box Breathing")) {
                var view = new BoxBreathingView(_minutes*60 + _seconds);
                WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
                WatchUi.pushView(view, new BoxBreathingDelegate(view, _minutes*60 + _seconds), WatchUi.SLIDE_UP);
            }
        }

        return true;
    }

}