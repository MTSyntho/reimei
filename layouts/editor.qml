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
	width: 1280
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

	    Row {
	    	width: 85 - 16
	    	height: parent.height
	    	spacing: 12
	    	x: 16

	    	Text {
	    		text: "Reimei"
	    		color: "#ffffff"
	    		font.pixelSize: 12
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
					anchors.verticalCenter: parent.verticalCenter
					anchors.horizontalCenter: parent.horizontalCenter
	    		}
	    	}
	    }

		Text {
			text: "Project Name"
			color: "#ffffff"
			font.pixelSize: 12
			font.family: InstrumentSans.name
			anchors.verticalCenter: parent.verticalCenter
			anchors.horizontalCenter: parent.horizontalCenter
		}

		Text {
			text: "Last save was at 25:00"
			color: "#2Dffffff"
			font.pixelSize: 10
			font.weight: Font.ExtraLight
			font.italic: true
			horizontalAlignment: Text.AlignRight
			width: 170
			x: parent.width - width - 120
			anchors.verticalCenter: parent.verticalCenter
		}
	}
}