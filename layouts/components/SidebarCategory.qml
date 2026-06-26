import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    property string name: "Name"

		    		width: parent.width
		    		height: 15
		    		color: "#01ffffff"
		    		Text {
		    			text: parent.name
		    			font.pixelSize: 13
		    			font.weight: Font.Medium
		    			color: "#ffffff"
		    			opacity: 0.5

			    		Rectangle {
			    			// 14 is the gap while 12 is the column padding, i should prolly use variable...
			    			width: sidebarScroll.width - parent.width - 14 - 12 - 12
			    			x: parent.width + 14
			    			height: 1
			    			anchors.verticalCenter: parent.verticalCenter
			    			color: "#ffffff"
			    			opacity: 0.15
			    		}
		    		}	
		    	}	