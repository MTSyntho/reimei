import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import "." 1.0

Button {
	property string name: "Project Name"
	property string time: "25:00"
	property string preview

	width: parent.width
	height: parent.height

	background: Rectangle {
		width: parent.width
		height: parent.height
		color: "#00ffffff"
	}

	onClicked: {
		editorWindow.createObject().show()
		mainWindow.close()
	}


	Column {
		spacing: 10
		width: 162
		height: childrenRect.height

		Image {
			id: thunbnailSrc
			width: mask.width - 2
			height: mask.height - 2
			source: preview
			fillMode: Image.PreserveAspectCrop
			visible: false
		}

		Rectangle {
			id: mask
			width: 162
			height: 162
			radius: 12
			color: "#000000"
			border.color: "#20ffffff"
			border.width: 1

			gradient: Gradient {
		        GradientStop { position: 0.0; color: Reimei.placeholderGradientColor1 }
		        GradientStop { position: 1.0; color: Reimei.placeholderGradientColor2 }
		    }

			OpacityMask {
				width: 162
				height: 162
				source: thunbnailSrc
				maskSource: mask
			}

		}





		Column {
			spacing: 2
			Text {
				text: name
				width: 166
				font.pixelSize: 14
				font.family: plusJakarta.name
				color: Reimei.textColor
			}

			Text {
				text: "Last edited: 25:00"
				width: 166
				font.pixelSize: 12
				color: "#21ffffff"
				font.family: plusJakarta.name
				font.weight: Font.Light
				font.italic: true
			}
		}
	}
}