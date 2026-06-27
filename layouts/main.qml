import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.12
import "."

Window {
	id: window
	title: "Reimei Editor"
	visible: true
	width: 960
	height: 720
	color: "#252525"

	// LoadFonts {}

    FontLoader { 
        id: instrumentSans
        source: "../assets/fonts/InstrumentSans/InstrumentSans-VariableFont_wdth,wght.ttf" 
    }

    FontLoader { 
        id: plusJakarta
        source: "../assets/fonts/PlusJakartaSans/PlusJakartaSans-VariableFont_wght.ttf" 
    }  

    Rectangle {
    	width: parent.width
    	height: parent.height
	    gradient: Gradient {
	        GradientStop { position: 0.0; color: "#00000000" }
	        GradientStop { position: 1.0; color: "#33000000" }
	    }

		Rectangle {
			id: "titlebar"
			width: parent.width
			height: 35
			color: "#01FF0000"
			border.width: 1
			border.color: "#0fffffff"



			Text {
				text: "Reimei"
				color: "#ffffff"
				font.pixelSize: 12
				font.family: instrumentSans.name
				anchors.verticalCenter: parent.verticalCenter
				anchors.horizontalCenter: parent.horizontalCenter
			}
		}

		Row {
			x: 42
			y: 72
			width: parent.width - 84

			Text {
				text: "My Projects"
				color: "#ffffff"
				font.pixelSize: 32
				font.weight: Font.Bold
				font.family: plusJakarta.name
			}

			Rectangle {
				width: 100
				height: 22
				border.width: 1
				border.color: "#20ffffff"
				color: "transparent"
				radius: 6
				x: parent.width - width

				anchors.verticalCenter: parent.verticalCenter


				Text {
					text: "Create New"
					color: "#ffffff"
					font.pixelSize: 10
					font.family: plusJakarta.name
					anchors.verticalCenter: parent.verticalCenter
					anchors.horizontalCenter: parent.horizontalCenter

				}
			}
		}

		Rectangle {
			width: parent.width - 40
			height: 2
			anchors.horizontalCenter: parent.horizontalCenter
			y: 136
			color: "#20ffffff"
		}

		Column {
			x: 22
			y: 162
			spacing: 10
			Layout.alignment: Qt.AlignHCenter 
			width: 221.75
			height: 240.67

			Image {
				id: thunbnailSrc
				width: mask.width - 2
				height: mask.height - 2
				source: "../assets/gradient.png"
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
					text: "Project Name"
					width: 166
					font.pixelSize: 14
					font.family: plusJakarta.name
					color: "#ffffff"
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


	// GridView {
	// 	anchors.fill: parent
	// 	cellWidth: 95 + 20
	// 	cellHeight: 95 + 20
	// 	model: apps
	// 	// model: launcher.launch_item("vlc", "")

	// 	delegate: ProjectIcon {
	// 		// launcher: launcher
	// 		launcher: window.launcherClass // weird workaround i think, to get launcher function in the element 
	// 		name: apps[index].name
	// 		src: apps[index].icon.toString() // src is the app icon
	// 		path: apps[index].path
	// 	}
	// }

}