import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;

class TimePickerView extends WatchUi.View {

    private var _minutes = 5;
    private var _seconds = 0;
    private var _focus = "minutes";

    function initialize() {
        View.initialize();
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

        var minutes = _minutes;
        var seconds = _seconds;

        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.drawText(dc.getWidth()/2, dc.getHeight()*.1, Graphics.FONT_SMALL, "Choose duration", Graphics.TEXT_JUSTIFY_CENTER);

        // draw colon
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.fillCircle(dc.getWidth()/2, dc.getHeight()/2, 5);
        dc.fillCircle(dc.getWidth()/2, dc.getHeight()/2+20, 5);

        // draw minutes and seconds
        dc.drawText(dc.getWidth()/4, dc.getHeight()/3, Graphics.FONT_NUMBER_MEDIUM, minutes.format("%02d"), Graphics.TEXT_JUSTIFY_CENTER);
        dc.drawText(dc.getWidth()*3/4, dc.getHeight()/3, Graphics.FONT_NUMBER_MEDIUM, seconds.format("%02d"), Graphics.TEXT_JUSTIFY_CENTER);
        if (minutes < 10) {
            dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
            dc.fillRectangle(0, dc.getHeight()/4, 52, dc.getHeight()/2);
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        }

        // draw focus box and arrows
        dc.setPenWidth(2);
        var textDimensions = dc.getTextDimensions("00", Graphics.FONT_NUMBER_MEDIUM);
        if (_focus.equals("minutes")) {
            dc.drawRectangle(12, 85, textDimensions[0]+10, textDimensions[1]-25);
            dc.fillPolygon([
                [12+(textDimensions[0]+10)/2, 70],
                [12+(textDimensions[0]+10)/2+7, 80],
                [12+(textDimensions[0]+10)/2-7, 80],
            ]);
            dc.fillPolygon([
                [12+(textDimensions[0]+10)/2, 85+textDimensions[1]-25 + 15],
                [12+(textDimensions[0]+10)/2+7, 85+textDimensions[1]-25 + 5],
                [12+(textDimensions[0]+10)/2-7, 85+textDimensions[1]-25 + 5],
            ]);
        } else if (_focus.equals("seconds")) {
            dc.drawRectangle(115, 85, textDimensions[0]+10, textDimensions[1]-25);
            dc.fillPolygon([
                [115+(textDimensions[0]+10)/2, 70],
                [115+(textDimensions[0]+10)/2+7, 80],
                [115+(textDimensions[0]+10)/2-7, 80],
            ]);
            dc.fillPolygon([
                [115+(textDimensions[0]+10)/2, 85+textDimensions[1]-25 + 15],
                [115+(textDimensions[0]+10)/2+7, 85+textDimensions[1]-25 + 5],
                [115+(textDimensions[0]+10)/2-7, 85+textDimensions[1]-25 + 5],
            ]);   
        }
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    function setMinutes (m as Number) as Void {
        _minutes = m;
        WatchUi.requestUpdate();
        System.println(_minutes);
    }

    function setSeconds (s as Number) as Void {
        _seconds = s;
        WatchUi.requestUpdate();
    }

    function setFocus (f) as Void {
        _focus = f;
        WatchUi.requestUpdate();
    }

}
