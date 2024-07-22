import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;

class Four78BreathingView extends WatchUi.View {

    private var _seconds = 0;
    private var _end;

    private var _timeOffset = 0;
    private var _paused = false;

    private var TRI_COORDS = [
        [44, 175] as Array<Number>,
        [44 + 4*15*Math.cos(Math.asin(Math.sin(Math.acos(1d/56d))*(7d/8d))), 175 - 4*15*Math.sin(Math.asin(Math.sin(Math.acos(1d/56d))*(7d/8d)))] as Array<Number>,
        [164, 175] as Array<Number>
    ] as Array<Array<Number>>;

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

        var relative_seconds = _seconds % 19;
        System.println(relative_seconds);
        var instruction;
        var circleX = TRI_COORDS[0][0];
        var circleY = TRI_COORDS[0][1];
        if (_seconds == 0) {
            instruction = "Press start";
        } else if (relative_seconds >= 0 && relative_seconds < 4) {
            instruction = "Breathe in";
            circleX = TRI_COORDS[0][0] + ((TRI_COORDS[1][0] - TRI_COORDS[0][0])/4d)*relative_seconds;
            circleY = TRI_COORDS[0][1] + ((TRI_COORDS[1][1] - TRI_COORDS[0][1])/4d)*relative_seconds;
        } else if (relative_seconds >= 4 && relative_seconds < 11) {
            instruction = "Hold";
            circleX = TRI_COORDS[1][0] + ((TRI_COORDS[2][0] - TRI_COORDS[1][0])/7d)*(relative_seconds-4);
            circleY = TRI_COORDS[1][1] + ((TRI_COORDS[2][1] - TRI_COORDS[1][1])/7d)*(relative_seconds-4);
        } else {
            instruction = "Breathe out";
            circleX = TRI_COORDS[2][0] + ((TRI_COORDS[0][0] - TRI_COORDS[2][0])/8d)*(relative_seconds-11);
            circleY = TRI_COORDS[2][1] + ((TRI_COORDS[0][1] - TRI_COORDS[2][1])/8d)*(relative_seconds-11);
        }
        if (_paused) {
            instruction = "Paused";
        }
        if (_seconds == _end) {
            instruction = "Done!";
        }

        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.drawText(104, 20, Graphics.FONT_SMALL, "4-7-8 Breathing", Graphics.TEXT_JUSTIFY_CENTER);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(104, 60, Graphics.FONT_TINY, instruction, Graphics.TEXT_JUSTIFY_CENTER);
        if (_seconds != 0) {
            dc.drawText(104, 90, Graphics.FONT_TINY, formatSeconds(_seconds), Graphics.TEXT_JUSTIFY_CENTER);
        }

        dc.setPenWidth(4);
        dc.setColor(Graphics.COLOR_DK_BLUE, Graphics.COLOR_BLACK);
        dc.drawLine(TRI_COORDS[0][0], TRI_COORDS[0][1], TRI_COORDS[1][0], TRI_COORDS[1][1]);
        dc.drawLine(TRI_COORDS[1][0], TRI_COORDS[1][1], TRI_COORDS[2][0], TRI_COORDS[2][1]);
        dc.drawLine(TRI_COORDS[2][0], TRI_COORDS[2][1], TRI_COORDS[0][0], TRI_COORDS[0][1]);

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
