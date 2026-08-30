import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import "." 1.0

Window {
	id: window
	title: "Reimei Editor"
	visible: true
	width: 960
	height: 720
	color: Reimei.backgroundColor

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
			color: Reimei.titlebarColor
			border.width: 1
			border.color: "#0fffffff"



			Text {
				text: "Reimei"
				color: Reimei.textColor
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
				color: Reimei.textColor
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
					color: Reimei.textColor
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

	ListModel {
		id: testProject

	    ListElement {
	        projectName: "osu! gaeming!1!!"
	        projectSaveDate: "17:39"
	        projectPreview: ""
	    }
		
	    ListElement {
	        projectName: "pjsk project"
	        projectSaveDate: "25:00"
	        projectPreview: ""
	    }
		
	    ListElement {
	        projectName: "Untitled"
	        projectSaveDate: "03:37"
	        projectPreview: ""
	    }
		
	    ListElement {
	        projectName: "Agarishou Cover アガリ..."
	        projectSaveDate: "Yesterday 13:58"
	        projectPreview: ""
	    }
		
	    ListElement {
	        projectName: "friends pink sheep ig"
	        projectSaveDate: "October 2024"
	        projectPreview: ""
	    }
		
	    ListElement {
	        projectName: "doroc!!1!"
	        projectSaveDate: "April 2024"
	        projectPreview: ""
	    }
		
	    ListElement {
	        projectName: "i literally have no idea a..."
	        projectSaveDate: "200 B.C"
	        projectPreview: ""
	    }
	}

		GridView {
			model: testProject
			x: 22 + 32
			y: 162 + 20
			width: parent.width - ( x * 2 )
			height: parent.height - y
			clip: true

			cellWidth: 221.75
			cellHeight: 240.67

			delegate: ProjectEntry { name: projectName ; time: projectSaveDate ; preview: projectPreview }

			ScrollBar.vertical: ScrollBar {
				policy: ScrollBar.AsNeeded
			}
		}
		// ProjectEntry { name: "hi" }
	}


}