import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import "../../." 1.0

Item {
	property var name
	property var type
	property var preview

	width: 146
	height: 82

	Component {
		id: assetPreview
		AssetPreview {
			image: ""
		}
	}

	Column {
		spacing: 8
		width: parent.width
		height: parent.height

		Image {
			id: previewSrc
			width: mask.width - 2
			height: mask.height - 2
			fillMode: Image.PreserveAspectCrop
			source: preview
			visible: false

			Rectangle {
				width: parent.width
				height: parent.height
				color: assetEntryMouseArea.containsMouse ? "#20ffffff" : "#00ffffff"

				Behavior on color {
				    ColorAnimation {
				        duration: 100
				        easing.type: Easing.InOutSine
				    }
				}
			}

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
			width: parent.width
			height: parent.height
			radius: 8
			color: "#000000"
			border.color: "#20ffffff"
			border.width: 1
			anchors.horizontalCenter: parent.horizontalCenter

			gradient: Gradient {
		        GradientStop { position: 0.0; color: Reimei.placeholderGradientColor1 }
		        GradientStop { position: 1.0; color: Reimei.placeholderGradientColor2 }
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
			width: parent.width
			elide: Text.ElideRight
			font.pixelSize: 12
			color: "#99ffffff"

		}
	}

	MouseArea {
		id: assetEntryMouseArea
		width: parent.width
		height: parent.height
		hoverEnabled: true
		acceptedButtons: Qt.LeftButton | Qt.RightButton

		onPressAndHold: function(mouse) {
			if (mouse.button === Qt.RightButton) {
				var previewWindow = assetPreview.createObject()
				previewWindow.image = preview
				previewWindow.x = mouse.x + 2
				previewWindow.y = mouse.y + 2
				previewWindow.show()
			}
		}

	}
}