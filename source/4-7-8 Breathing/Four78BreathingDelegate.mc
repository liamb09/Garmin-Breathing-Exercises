import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Timer;
import Toybox.Math;

class Four78BreathingDelegate extends WatchUi.BehaviorDelegate {

    private var _inProgress = false;
    private var _paused = false;

    private var _timer;

    private var _currentTimestamp;

    private var _maxSeconds;

    private var _view;

    function initialize(_myView, _mySeconds) {
        BehaviorDelegate.initialize();
        _view = _myView;
        _maxSeconds = _mySeconds;
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
        } else if (!_paused) {
            _paused = true;
            _maxSeconds -= _currentTimestamp;
            _view.pauseTimer(_currentTimestamp);
            _timer.stop();
        } else {
            _paused = false;
            _view.unpauseTimer();
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
        if (_currentTimestamp == _maxSeconds) {
            _timer.stop();
        }

        _view.updateSeconds(_currentTimestamp);

        _currentTimestamp++;
    }

}