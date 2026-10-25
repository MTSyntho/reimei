import QtQuick
import Reimei

Canvas {
	property real rulerZoom: zoom
    // id: timeRuler
    width: timelineViewport.width
    x: timelineViewport.contentX
    height: 20

    onRulerZoomChanged: requestPaint()

    onPaint: {
        var ctx = getContext("2d");
        ctx.strokeStyle = Reimei.timelineTimeRulerLineColor
        ctx.fillStyle = Reimei.timelineTimeRulerTextColor
        ctx.font = "8px sans-serif"

        var startPos = Math.floor( timelineViewport.contentX / ( clipLength * rulerZoom ) )

        var endPos = Math.ceil( ( timelineViewport.contentX + width ) / ( clipLength * rulerZoom ) )

        ctx.clearRect(0, 0, width, height)


        for ( var i = startPos ; i <= endPos ; i++) {
            var second = i * ( clipLength * rulerZoom ) - timelineViewport.contentX
            // console.log(parent.x)
	        ctx.beginPath()
			ctx.moveTo(second, 0)
			ctx.lineTo(second, 10)
			ctx.stroke()        
        }

	    if (!zoomSlider.pressed) {
	        for ( var i = startPos ; i <= endPos ; i++) {
                var second = i * ( clipLength * rulerZoom ) - timelineViewport.contentX
				ctx.fillText(i, second + 4, 8)	
	        }    	
	    }
    }

    MouseArea {
        anchors.fill: parent
        preventStealing: true

        onClicked: function(mouse) {
            Global.currentTime = ( mouse.x + timelineViewport.contentX ) / ( clipLength * zoom )
        }

        onPositionChanged: function(mouse) {
            Global.currentTime = ( mouse.x + timelineViewport.contentX ) / ( clipLength * zoom )
        }
    }
}