import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects


Column {
	property var name
	property var type
	property var preview
	spacing: 8

	Image {
		id: previewSrc
		width: mask.width - 2
		height: mask.height - 2
		fillMode: Image.PreserveAspectCrop
		source: preview
		visible: false

		Image {
			anchors.right: parent.right
			anchors.top: parent.top
			source: "../../../assets/assetLibrary/" + type + "Overlay.png"
			width: 57
			height: 57
		}
	}

	Rectangle {
		id: mask
		width: 146
		height: 82
		radius: 8
		color: "#000000"
		border.color: "#20ffffff"
		border.width: 1
		anchors.horizontalCenter: parent.horizontalCenter

		gradient: Gradient {
	        GradientStop { position: 0.0; color: "#202020" }
	        GradientStop { position: 1.0; color: "#000000" }
	    }

		OpacityMask {
			width: parent.width
			height: parent.height
			source: previewSrc
			maskSource: mask
		}

	}

	Text {
		text: name
		font.pixelSize: 12
		color: "#99ffffff"

	}
}