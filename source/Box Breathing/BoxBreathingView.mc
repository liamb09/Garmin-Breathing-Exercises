import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;

class BoxBreathingView extends WatchUi.View {

    private var _seconds = 0;
    private var _end;

    private var _timeOffset = 0;
    private var _paused = false;

    function initialize(_myEnd) {
        View.initialize();
        _end = _myEnd;
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        var relative_seconds = _seconds % 16;
        var instruction;
        var circleX = dc.getWidth()/2 - 40;
        var circleY = dc.getHeight()-30;
        if (_seconds == 0) {
            instruction = "Press start";
        } else if (relative_seconds >= 0 && relative_seconds < 4) {
            instruction = "Breathe in";
            circleX = dc.getWidth()/2 - 40;
            circleY = dc.getHeight()-30 - 20*relative_seconds;
        } else if (relative_seconds >= 4 && relative_seconds < 8) {
            instruction = "Hold";
            circleX = dc.getWidth()/2 - 40 + 20*(relative_seconds%4);
            circleY = dc.getHeight()-110;
        } else if (relative_seconds >= 8 && relative_seconds < 12) {
            instruction = "Breathe out";
            circleX = dc.getWidth()/2 + 40;
            circleY = dc.getHeight()-110 + 20*(relative_seconds%4);
        } else {
            instruction = "Hold";
            circleX = dc.getWidth()/2 + 40 - 20*(relative_seconds%4);
            circleY = dc.getHeight()-30;
        }
        if (_paused) {
            instruction = "Paused";
        }
        if (_seconds == _end) {
            instruction = "Done!";
        }

        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.drawText(104, 20, Graphics.FONT_SMALL, "Box Breathing", Graphics.TEXT_JUSTIFY_CENTER);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(104, 60, Graphics.FONT_TINY, instruction, Graphics.TEXT_JUSTIFY_CENTER);
        if (_seconds != 0) {
            dc.drawText(104, 124, Graphics.FONT_TINY, formatSeconds(_seconds), Graphics.TEXT_JUSTIFY_CENTER);
        }

        dc.setPenWidth(4);
        dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_BLACK);
        dc.drawRectangle(dc.getWidth()/2 - 40, dc.getHeight()-110, 80, 80);
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.fillCircle(circleX, circleY, 6);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    function updateSeconds (s as Number) as Void {
        _seconds = s+_timeOffset;

        WatchUi.requestUpdate();
    }

    function formatSeconds (s as Number) as String {
        var seconds = s%60 < 10 ? "0" + s%60 : s%60;
        var minutes = s/60;

        return minutes.toString() + ":" + seconds.toString();
    }

    function pauseTimer (elapsedTime as Number) as Void {
        _paused = true;
        _timeOffset += elapsedTime;
        WatchUi.requestUpdate();
    }

    function unpauseTimer () as Void {
        _paused = false;
        WatchUi.requestUpdate();
    }

}
