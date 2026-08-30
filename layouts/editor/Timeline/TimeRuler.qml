import QtQuick 2.15
import "../../." 1.0


Canvas {
	property real rulerZoom: zoom
    // id: timeRuler
    width: parent.width
    height: 20

    onPaint: {
        var ctx = getContext("2d");
        ctx.strokeStyle = Reimei.timelineTimeRulerLineColor
        ctx.fillStyle = Reimei.timelineTimeRulerTextColor
        ctx.font = "8px sans-serif"

        for ( var i = 0 ; i < timelineViewport.contentWidth ; i++) {
        	var second = ( i * clipLength ) * rulerZoom
	        ctx.beginPath()
			ctx.moveTo(second, 0)
			ctx.lineTo(second, 10)
			ctx.stroke()        
        }

	    if (!zoomSlider.pressed) {
	        for ( var i = 0 ; i < timelineViewport.contentWidth ; i++) {
	        	var second = ( i * clipLength ) * rulerZoom        
				ctx.fillText(i, second + 4, 8)	
	        }    	
	    }
    }
}