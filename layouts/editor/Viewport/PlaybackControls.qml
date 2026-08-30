import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

Row {
	spacing: 22
	height: 13
	anchors.horizontalCenter: parent.horizontalCenter

	Button {
		width: 16
		height: 10
		anchors.verticalCenter: parent.verticalCenter

		background: Rectangle {
			width: parent.width
			height: parent.height
			color: "#00ffffff"
		}

		Image {
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            source: "../../../assets/playbackControls/fastRewind.svg"
        }
	}
	
	Button {
		width: 15
		height: 13

		background: Rectangle {
			width: parent.width
			height: parent.height
			color: "#00ffffff"
		}

		Image {
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            source: "../../../assets/playbackControls/frameBack.svg"
        }
	}
	
	Button {
		width: 11
		height: 13

		background: Rectangle {
			width: parent.width
			height: parent.height
			color: "#00ffffff"
		}

		Image {
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            source: "../../../assets/playbackControls/play.svg"
        }
	}
	
	Button {
		width: 15
		height: 13

		background: Rectangle {
			width: parent.width
			height: parent.height
			color: "#00ffffff"
		}

		Image {
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            source: "../../../assets/playbackControls/frameForward.svg"
        }
	}
	
	Button {
		width: 16
		height: 10
		anchors.verticalCenter: parent.verticalCenter

		background: Rectangle {
			width: parent.width
			height: parent.height
			color: "#00ffffff"
		}

		Image {
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            source: "../../../assets/playbackControls/fastForward.svg"
        }
	}
}