import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import "Timeline"
import "../." 1.0

Rectangle {

	width: parent.width
	height: parent.height
	color: "#00000000"

	readonly property var clipLength: Reimei.clipLength
	readonly property real zoom: zoomSlider.value
	// property real projectLength: Global.projectLength
	// property real currentTime: Global.currentTime

	Component { id: trackDataPlaceholder ; ListModel {} }
	Component { id: trackPlaceholder ; Track {} }

	Timer {
		id: playerHeadTimer
		interval: ( 1 / Global.frameRate ) * 1000
		repeat: true
		running: isPlaying ? true : false

		onTriggered: {
			Global.currentTime += interval / 1000

			if (Global.currentTime >= Global.projectLength) {
				Global.currentTime = 0
				isPlaying = false
			}
		}
	}

	Column {
		width: parent.width
		height: parent.height

		Rectangle {
			color: Reimei.backgroundColor
			width: parent.width
			height: 35

			Slider {
				id: zoomSlider
				width: 250
				from: 0.5
				value: 1
				to: 5

				onPressedChanged: {
					if (!pressed) { timeRuler.requestPaint() }
				}
			}
		}

		Rectangle { width: parent.width; height: 1; color: Reimei.borderColor; y: -5 } 

		Rectangle {
			color: Reimei.timelineColor
			width: parent.width
			height: parent.height - 36

			Flickable {
				id: timelineViewport
				width: parent.width
				height: parent.height

				// contentWidth: childrenRect.width
				contentWidth: ( ( Global.projectLength + 2 ) * clipLength ) * zoom // 10 seconds

				TimeRuler { id: timeRuler }

				Column {
					y: 4 + 20
					id: timelineColumn
					width: parent.width
					spacing: 4
					height: childrenRect.height + 85
				}

				PlayerHead { id: playerHead }

				ScrollBar.horizontal: ScrollBar {
					policy: ScrollBar.AlwaysOn
				}

				ScrollBar.vertical: ScrollBar {
					policy: ScrollBar.AlwaysOn
				}
			}
	
		}

	}

	Component.onCompleted: {
		var projectData = JSON.parse(dummyData);
		var longestEndTime = 0;
		// dummyData.forEach(function(index) {

		// })

		for (var i = 0; i < projectData.tracks.length; i++)  {
			var track = trackPlaceholder.createObject(timelineColumn);
			var trackData = projectData.tracks[i];


		    for (var l = 0; l < trackData.length; l++) {
		        var clip = trackData[l]
		        var endTime = clip.clipPosition + clip.clipDuration

		        if (endTime > longestEndTime)
		            longestEndTime = endTime
		    }

			track.load(trackData);
		}

	    Global.projectLength = longestEndTime;

	}	

}