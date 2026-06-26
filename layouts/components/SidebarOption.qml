import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    property string iconSrc: "../assets/icons/about.svg"
    property string name: "Name"

		    		width: sidebar.width - 24
		    		height: 30
		    		background: Rectangle {
		    			color: "#00ffffff"
		    			radius: 10
		    			MouseArea {
		    				width: parent.width
		    				height: parent.height
		    				hoverEnabled: true
		    				onEntered: parent.color = "#10ffffff"
		    				onExited: parent.color = "#00ffffff"
		    			}
		    		}

		    		Image {
		    			source: "../" + parent.iconSrc
		    			width: 16
		    			height: 16
			    		anchors.verticalCenter: parent.verticalCenter
		    			x: 8
		    		}
		    		Text {
		    			text: parent.name
		    			font.pixelSize: 13
		    			font.weight: Font.Medium
		    			color: "#ffffff"
			    		anchors.verticalCenter: parent.verticalCenter
			    		x: 36
		    		}
		    	}