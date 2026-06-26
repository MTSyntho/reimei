import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.12
import "components"


Window {
	id: window
	title: "Reimei Editor"
	visible: true
	width: 960
	height: 720
	x: ( screen.width / 2 ) - ( width / 2 )
	y: ( screen.height / 2 ) - ( height / 2 )
	color: "#252525"

    // FontLoader { 
    //     id: InstrumentSans 
    //     source: "../assets/fonts/InstrumentSans/InstrumentSans-VariableFont_wdth,wght.ttf" 
    // }
    // FontLoader { 
    //     id: PlusJakarta 
    //     source: "../assets/fonts/PlusJakartaSans/PlusJakartaSans-VariableFont_wght.ttf" 
    // }

	Rectangle {
		id: "titlebar"
		width: parent.width
		height: 35
		color: "#01FF0000"
		border.width: 1
		border.color: "#0fffffff"

	    FontLoader { 
	        name: InstrumentSans 
	        source: "../assets/fonts/InstrumentSans/static/InstrumentSans-Regular.ttf" 
	    }

		Text {
			text: "Reimei"
			color: "#ffffff"
			font.pixelSize: 12
			font.family: InstrumentSans.name
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
			// font.family: InstrumentSans.font
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
				color: "#ffffff"
			}

			Text {
				text: "Last edited: 25:00"
				width: 166
				font.pixelSize: 12
				color: "#21ffffff"
				font.weight: Font.Light
				font.italic: true
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