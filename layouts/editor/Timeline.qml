import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.12
import "Timeline"

Rectangle {
	width: parent.width
	height: parent.height
	color: "#00000000"

	readonly property var clipLength: 80 // Length of clip for 1 second of time
	readonly property real zoom: zoomSlider.value
	property real projectLength: 0

	Component { id: trackDataPlaceholder ; ListModel {} }
	Component { id: trackPlaceholder ; Track {} }

	Column {
		width: parent.width
		height: parent.height

		Rectangle {
			color: "#252525"
			width: parent.width
			height: 35

			Slider {
				id: zoomSlider
				width: 250
				from: 0.5
				value: 1
				to: 5
			}
		}

		Rectangle { width: parent.width; height: 1; color: "#0fffffff"; y: -5 } 

		Rectangle {
			color: "#1C1C1C"
			width: parent.width
			height: parent.height - 36

			Flickable {
				id: timelineViewport
				width: parent.width
				height: parent.height

				// contentWidth: childrenRect.width
				contentWidth: ( ( projectLength + 2 ) * clipLength ) * zoom // 10 seconds

				Column {
					y: 4
					id: timelineColumn
					width: parent.width
					spacing: 4
					height: childrenRect.height + 85
				}

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

	    projectLength = longestEndTime;

	}	

}