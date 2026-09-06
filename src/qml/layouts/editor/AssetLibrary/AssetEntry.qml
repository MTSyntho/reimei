import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import "../../." 1.0
import "../../editor"


Item {
	property var name
	property var type
	property var preview

	property var previewWindow: null

	width: 146
	height: 82

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
			asynchronous: true
			cache: true
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
				previewWindow = assetPreviewComponent.createObject(window)
				var mousePosition = mapToItem(window.contentItem, mouse.x, mouse.y)

				previewWindow.image = preview
				previewWindow.x = mousePosition.x 
				previewWindow.y = mousePosition.y
				previewWindow.visible = true
			}
		}

	    onPositionChanged: function(mouse) {
	        if (previewWindow) {
				var mousePosition = mapToItem(window.contentItem, mouse.x, mouse.y)
	            previewWindow.x = mousePosition.x + 2
	            previewWindow.y = mousePosition.y + 2
	        }
	    }

	    // Known issue: will not trigger if you import media while previewing...
	    onReleased: function(mouse) {
	        if (mouse.button === Qt.RightButton && previewWindow) {
	            previewWindow.destroy()
	            previewWindow = null
	        }
	    }

	}
}