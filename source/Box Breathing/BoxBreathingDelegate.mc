import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Timer;

class BoxBreathingDelegate extends WatchUi.BehaviorDelegate {

    private var _inProgress = false;

    private var _timer;

    private var _currentTimestamp;

    private var _numCycles;

    private var _view;

    function initialize(_myView, _myCycles) {
        BehaviorDelegate.initialize();
        _view = _myView;
        _numCycles = _myCycles;
        _view.setCycles(_numCycles);
    }

    function onKey (keyEvent) {
        // up
        if (keyEvent.getKey() == 13) {

        // down
        } else if (keyEvent.getKey() == 8) {

        // back
        } else if (keyEvent.getKey() == 5) {
            WatchUi.popView(WatchUi.SLIDE_DOWN);
        }
        return true;
    }

    function onSelect () as Boolean {
        if (!_inProgress) {
            _inProgress = true;
            startCountdown();
        }

        return true;
    }

    function startCountdown() {
        _currentTimestamp = 0;
        _timer = new Timer.Timer();
        _timer.start(method(:updateTimestamp), 1000, true);
    }

    function updateTimestamp () as Void {
        if (_currentTimestamp == 16*_numCycles) {
            _timer.stop();
        }

        _view.updateSeconds(_currentTimestamp);

        _currentTimestamp++;
    }

}