import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import "../../." 1.0

Item {
	id: playerHead
	width: 4
	height: parent.height

	x: ( Global.currentTime * clipLength ) * zoom

	Rectangle {
		id: playerHeadTrail
		width: isPlaying ? 32 : 0
		height: parent.height
		color: "#00ffffff"
		x: isPlaying ? -30 : 0
		opacity: 0.2

		Behavior on width {
	        NumberAnimation { duration: 500 ; easing.type: Easing.OutCirc }
	    }

		Behavior on x {
	        NumberAnimation { duration: 500 ; easing.type: Easing.OutCirc }
	    }

		gradient: Gradient {
			orientation: Gradient.Horizontal

	        GradientStop { position: 0.0; color: "#00ffffff" }
	        GradientStop { position: 1.0; color: "#ffffffff" }
		}

	}

	Rectangle {
		width: 4
		height: 4
		radius: 2
		color: "#ffffff"
	}


	Rectangle {
		width: 2
		anchors.horizontalCenter: parent.horizontalCenter
		height: parent.height

		color: "#ffffff"
	}	

}
