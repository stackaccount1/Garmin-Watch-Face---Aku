using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;

class AkuView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
		// Set Color
        // Get and show the current time
        var clockTime = System.getClockTime();
        var hour, min, ampm;
		hour = clockTime.hour;
		min = clockTime.min.format("%02d");			
		ampm = (hour > 11) ? "PM" : "AM";
		hour = hour % 12;
		hour = (hour == 0) ? 12 : hour;			
		hour = hour.format("%02d");
        var timeString = Lang.format("$1$:$2$ $3$", [hour, min, ampm]);
        var view = View.findDrawableById("TimeLabel");
        view.setText(timeString);
        
        var myStats = System.getSystemStats();
        var batt1 = myStats.battery;
        var batt = batt1.toNumber();
        var view1 = View.findDrawableById("batt");
        view1.setText(batt.toString());

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }
    
    

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide(clickevent) {
    }
	

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
