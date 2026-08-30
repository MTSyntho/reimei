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
		focusPolicy: Qt.NoFocus
		anchors.verticalCenter: parent.verticalCenter

		onPressed: {
			playbackState.skipBack()
		}

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
		focusPolicy: Qt.NoFocus

		onPressed: {
			playbackState.backFrame()
		}

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
		focusPolicy: Qt.NoFocus
		checkable: true

		background: Rectangle {
			width: parent.width
			height: parent.height
			color: "#00ffffff"
		}

		onCheckedChanged: {
			if (checked) {
				playbackState.play()
			} else {
				playbackState.pause()
			}

		}

		Image {
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            source: isPlaying ? "../../../assets/playbackControls/pause.svg" : "../../../assets/playbackControls/play.svg" 
        }
	}
	
	Button {
		width: 15
		height: 13
		focusPolicy: Qt.NoFocus

		onPressed: {
			playbackState.forwardFrame()
		}

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
		focusPolicy: Qt.NoFocus
		anchors.verticalCenter: parent.verticalCenter

		onPressed: {
			playbackState.skipForward()
		}

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