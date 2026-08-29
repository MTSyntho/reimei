import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.12


Window {
	id: window
	title: "Reimei Editor"
	visible: true
	width: 1280
	height: 700
	minimumWidth: 800
	color: "#252525"

	readonly property var dummyData: '
		{
			"name": "Dummy Project",  
			"lastSave": "25:00",
			"tracks": [
				[
					{
						"clipName": "Clip1.mp4",
						"clipPosition": 0.4,
						"clipDuration": 3
				  	},
					{
						"clipName": "Clip the second coming.mp4",
						"clipPosition": 12,
						"clipDuration": 7
				  	}
				],
				[
					{
						"clipName": "osu.mp4",
						"clipPosition": 3.5,
						"clipDuration": 13
					}
				]
			]
		}'

    FontLoader { 
        id: instrumentSans
        source: "../../assets/fonts/InstrumentSans/InstrumentSans-VariableFont_wdth,wght.ttf" 
    }

    FontLoader { 
        id: plusJakarta
        source: "../../assets/fonts/PlusJakartaSans/PlusJakartaSans-VariableFont_wght.ttf" 
    }  

	Rectangle {
		id: "titlebar"
		width: parent.width
		height: 35
		color: "#01FF0000"
		border.width: 1
		border.color: "#0fffffff"

	    Row {
	    	width: 85 - 16
	    	height: parent.height
	    	spacing: 12
	    	x: 16

	    	Text {
	    		text: "Reimei"
	    		color: "#ffffff"
	    		font.pixelSize: 12
	    		font.family: instrumentSans.name
				anchors.verticalCenter: parent.verticalCenter
	    	}
	    }

	    Rectangle {
	    	width: 1
	    	height: 12
	    	color: "#20ffffff"
	    	x: 93
			anchors.verticalCenter: parent.verticalCenter
	    }

	    Row {
	    	width: 123
	    	height: parent.height
	    	x: 98

	    	Rectangle {
	    		width: 37
	    		height: parent.height
	    		color: "#00ffffff"
	    		// color: "#0Cffffff"

	    		Text {
	    			text: "File"
	    			color: "#ffffff"
	    			font.pixelSize: 12
	    			font.family: plusJakarta.name
					anchors.verticalCenter: parent.verticalCenter
					anchors.horizontalCenter: parent.horizontalCenter
	    		}
	    	}

	    	Rectangle {
	    		width: 37
	    		height: parent.height
	    		color: "#00ffffff"

	    		Text {
	    			text: "Edit"
	    			color: "#ffffff"
	    			font.pixelSize: 12
	    			font.family: plusJakarta.name
					anchors.verticalCenter: parent.verticalCenter
					anchors.horizontalCenter: parent.horizontalCenter
	    		}
	    	}

	    	Rectangle {
	    		width: 37
	    		height: parent.height
	    		color: "#00ffffff"

	    		Text {
	    			text: "View"
	    			color: "#ffffff"
	    			font.pixelSize: 12
	    			font.family: plusJakarta.name
					anchors.verticalCenter: parent.verticalCenter
					anchors.horizontalCenter: parent.horizontalCenter
	    		}
	    	}
	    }

		Text {
			text: "Project Name"
			color: "#ffffff"
			font.pixelSize: 12
			font.family: instrumentSans.name
			anchors.verticalCenter: parent.verticalCenter
			anchors.horizontalCenter: parent.horizontalCenter

			Component.onCompleted: {
				var projectData = JSON.parse(dummyData);
				text = projectData.name;
			}	
		}

		Text {
			text: "Last save was @ 25:00"
			color: "#2Dffffff"
			font.pixelSize: 10
			font.family: plusJakarta.name
			font.weight: Font.ExtraLight
			font.italic: true
			horizontalAlignment: Text.AlignRight
			width: 170
			x: parent.width - width - 120
			anchors.verticalCenter: parent.verticalCenter

			Component.onCompleted: {
				var projectData = JSON.parse(dummyData);
				text = "Last save was @ " + projectData.lastSave ;
			}	
		}

		Rectangle {
			width: 90
			height: parent.height
	    	color: "#0Cffffff"
	    	x: parent.width - width

	    	Row {
	    		spacing: 4
					anchors.verticalCenter: parent.verticalCenter
					anchors.horizontalCenter: parent.horizontalCenter

		    	Text {
		    		text: "Export"
		    		color: "#ffffff"
		    		font.pixelSize: 12
		    		font.family: plusJakarta.name
		    	}

		    	Image {
		    		width: 16
		    		height: 16
		    		source: "../../assets/icons/export.svg"
		    	}
		    }
		}
	}

	// RowLayout {
	SplitView {
		width: parent.width
		height: parent.height - 35
		y: 35
		spacing: 0
		orientation: Qt.Vertical

		handle: Rectangle {
			implicitHeight: 5
			width: parent.width
			color: "#00000000"
		}

		SplitView {
			id: panelParent
			width: parent.width
				SplitView.fillHeight: true

			height: parent.height / 2 - 20
			// y: 35
			spacing: 0
			orientation: Qt.Horizontal

			handle: Rectangle {
				implicitWidth: 10
				height: parent.height
				color: "#00000000"
			}

			Rectangle {
				// SplitView.fillWidth: true
				SplitView.fillHeight: true
				SplitView.minimumWidth: 300
				color: "#00000000"

				Rectangle { width: 1; height: parent.height; color: "#0fffffff"; x: parent.width + 10 } 

			}


			Rectangle {
				SplitView.fillWidth: true
				SplitView.fillHeight: true
				SplitView.preferredWidth: 2
				color: "#00000000"
				border.width: 1
				border.color: "#01ffffff"

			    gradient: Gradient {
			        GradientStop { position: 0.0; color: "#00000000" }
			        GradientStop { position: 1.0; color: "#26000000" }
			    }

			}

			Rectangle {
				// SplitView.fillWidth: true
				SplitView.fillHeight: true
				SplitView.minimumWidth: 300
				color: "#00000000"

				Rectangle { width: 1; height: parent.height; color: "#0fffffff"; x: -10 } 

			}
		}

		Rectangle {
			SplitView.fillWidth: true
			SplitView.minimumHeight: 20

			color: "#00000000"

			Rectangle { width: parent.width; height: 1; color: "#0fffffff"; y: -5 } 

			Timeline {}

		}
	}


}