import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import "Viewport"
import "../." 1.0

Column {
	width: parent.width
	spacing: 26
	anchors.centerIn: parent
	
	Rectangle {
		width: height * ( 1280 / 720 )
		height: Math.min(parent.parent.height * 0.73, (parent.parent.width - 12 * 2) / ( 1280 / 720 ))
		// height: parent.parent.height * 0.73
		anchors.horizontalCenter: parent.horizontalCenter
		color: "#000000"
		border.color: "#26ffffff"
	}

	PlaybackControls {}

	Slider {
		id: videoProgressbar
		from: 0
		value: Global.currentTime
		to: Global.projectLength

		width: parent.width * 0.86
		anchors.horizontalCenter: parent.horizontalCenter

		onPositionChanged: {
			Global.currentTime = value
		}

		background: Rectangle {
			width: videoProgressbar.availableWidth
			height: 8
			color: "#26ffffff"
			radius: 4
			border.color: "#26ffffff"
			border.width: 2
			x: videoProgressbar.leftPadding
			y: videoProgressbar.topPadding + videoProgressbar.availableHeight / 2 - height / 2

			Rectangle {
				width: videoProgressbar.visualPosition * parent.width - 4
				height: 4
				color: "#ffffff"
				radius: 2
				anchors.verticalCenter: parent.verticalCenter
				x: 2
			}
		}

		handle: Rectangle {
			id: videoProgressbarHandle
			x: videoProgressbar.leftPadding + videoProgressbar.visualPosition * (videoProgressbar.availableWidth - width) - 2
			implicitWidth: 10
			implicitHeight: 10
			radius: 5
			color: "#ffffff"
			anchors.verticalCenter: parent.verticalCenter
			// scale: videoProgressbar.hovered || videoProgressbar.pressed ? 1 : 0
			scale: videoProgressbar.pressed ? 1.15 : videoProgressbar.hovered ? 1 : 0

			Behavior on scale {
			    NumberAnimation {
			        duration: 200
			        easing.type: Easing.InOutCirc
			    }
			}


		}
	}
}