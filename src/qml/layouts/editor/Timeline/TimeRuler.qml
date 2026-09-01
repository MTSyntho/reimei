import QtQuick 2.15
import "../../." 1.0


Canvas {
	property real rulerZoom: zoom
    // id: timeRuler
    width: window.width
    x: timelineViewport.contentX
    height: 20

    onPaint: {
        var ctx = getContext("2d");
        ctx.strokeStyle = Reimei.timelineTimeRulerLineColor
        ctx.fillStyle = Reimei.timelineTimeRulerTextColor
        ctx.font = "8px sans-serif"

        // var startPos = Math.floor(timelineViewport.contentX / clipLength)
        // var endPos = Math.ceil(timelineViewport.contentX + parent.width) / clipLength

        ctx.clearRect(0, 0, width, height)

        for ( var i = ( timelineViewport.contentX / clipLength ) ; i < timelineViewport.contentWidth ; i++) {
            var second = ( i * clipLength ) * rulerZoom
            console.log(parent.x)
	        ctx.beginPath()
			ctx.moveTo(second, 0)
			ctx.lineTo(second, 10)
			ctx.stroke()        
        }

	    // if (!zoomSlider.pressed) {
	    //     for ( var i = 0 ; i < timelineViewport.contentWidth ; i++) {
	    //     	var second = ( i * clipLength ) * rulerZoom        
		// 		ctx.fillText(i, second + 4, 8)	
	    //     }    	
	    // }
    }

    MouseArea {
        anchors.fill: parent
        preventStealing: true

        onClicked: function(mouse) {
            Global.currentTime = mouse.x / ( clipLength * zoom )
        }

        onPositionChanged: function(mouse) {
            Global.currentTime = mouse.x / ( clipLength * zoom )
        }
    }
}