import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import Reimei

Item {
	property string name
	property real position
	property real duration
	property bool isSelected: false

	x: (position * clipLength) * zoom
	width: (duration * clipLength) * zoom
	height: 85

	Rectangle {
		id: trimHandle
		// width: parent.width + 6 
		width: isSelected ? parent.width + 6 : parent.width - 6
		height: parent.height
		color: "white"
		radius: 6
		// x: -3
		x: isSelected ? -3 : 3
		enabled: isSelected
		visible: isSelected

		Behavior on width {
			NumberAnimation {
				easing: Easing.OutQuart
				duration: 200
			}
		}

		Behavior on x {
			NumberAnimation {
				easing: Easing.OutQuart
				duration: 200
			}
		}		
	}

	Rectangle {
		anchors.fill: parent
		color: Reimei.clipColor
		radius: 6
		clip: true
		// for clip selection
		border.color: "white"
		border.width: isSelected ? 1 : 0


		Behavior on border.width {
			NumberAnimation {
				easing: Easing.OutQuart
				duration: 200
			}
		}				


		Text {
			id: clipTextName
			text: name
			color: Reimei.clipTextColor
			font.pixelSize: Reimei.clipFontSize
			x: 4
			y: 6
		}

		Text {
			text: playbackState.getFormattedTime(duration)
			color: Reimei.clipTextColor
			font.pixelSize: Reimei.clipFontSize
			x: clipTextName.x + clipTextName.width + 6
			y: 6
		}

		Item {
			id: clipPreview
			width: parent.width
			height: 55
			y: Reimei.clipFontSize * 2
		}

	}

	// just for testing
    // MouseArea {
    //     anchors.fill: parent
    //     preventStealing: true

    //     onClicked: function(mouse) {
    //         isSelected = !isSelected
    //     }
    // }	
}