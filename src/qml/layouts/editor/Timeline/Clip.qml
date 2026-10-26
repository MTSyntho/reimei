import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import Reimei

Item {
	id: clip
	property string name
	property real position
	property real duration
	property bool isSelected: false

	property real initialPosition: 0
	property real initialDuration: 0
	property real initialMouseX: 0
	property real initialScale: 1

	property bool isTrimLeft: false

	readonly property real minimumDuration: ( 1 / Global.frameRate )

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

		MouseArea {
			x: 0
			width: 3
			height: parent.height
			enabled: isSelected
			preventStealing: true
			cursorShape: Qt.SizeHorCursor

			onPressed: function(mouse) {
				isTrimLeft = true
				initialPosition = clip.position;
				initialDuration = clip.duration;
				initialMouseX = mapToItem( clip.parent, mouse.x, mouse.y ).x
				initialScale = clipLength * zoom
			}

			onPositionChanged: function(mouse) {
				let timeOffset = ( mapToItem( clip.parent, mouse.x, mouse.y ).x - clip.initialMouseX ) / clip.initialScale

				let maxTrim = Math.max( 0, clip.initialDuration - clip.minimumDuration ) // prevent going below 1 frame in length
				timeOffset = Math.max( -clip.initialPosition, Math.min( maxTrim, timeOffset ) )

				clip.position = clip.initialPosition + timeOffset
				clip.duration = clip.initialDuration - timeOffset
			}

			onReleased: {
				isTrimLeft = false
			}

		}

		MouseArea {
			x: parent.width - 3
			width: 3
			height: parent.height
			enabled: isSelected
			preventStealing: true
			cursorShape: Qt.SizeHorCursor

			onPressed: function(mouse) {
				initialPosition = clip.position
				initialDuration = clip.duration
				initialMouseX = mapToItem( clip.parent, mouse.x, mouse.y ).x
				initialScale = clipLength * zoom
			}

			onPositionChanged: function(mouse) {
				let timeOffset = ( mapToItem( clip.parent, mouse.x, mouse.y ).x - clip.initialMouseX ) / clip.initialScale

				let maxTrim = Math.max( 0, clip.initialDuration - clip.minimumDuration ) // prevent going below 1 frame in length
				timeOffset = Math.max( clip.minimumDuration - clip.initialDuration, timeOffset )

				duration = initialDuration + timeOffset
			}
		}

		Behavior on width {
			enabled: !isTrimLeft

			NumberAnimation {
				easing: Easing.OutQuart
				duration: 200
			}
		}

		Behavior on x {
			enabled: !isTrimLeft

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
    MouseArea {
        anchors.fill: parent
        preventStealing: true
			cursorShape: Qt.SizeHorCursor

        onClicked: function(mouse) {
            isSelected = !isSelected
        }

        onPositionChanged: 
    }	
}