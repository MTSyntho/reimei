import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.12
import "Timeline"

Rectangle {
	width: parent.width
	height: parent.height
	color: "#00000000"

	property var clipLength: 80 // Length of clip for 1 second of time
	property var zoom: zoomSlider.value

	Column {
		width: parent.width
		height: parent.height

		Rectangle {
			color: "#252525"
			width: parent.width
			height: 35

			Slider {
				id: zoomSlider
			    from: 0.5
			    value: 1
			    to: 5
			}
		}

		Rectangle { width: parent.width; height: 1; color: "#0fffffff"; y: -5 } 

		Rectangle {
			color: "#1C1C1C"
			width: parent.width
			height: parent.height - 36

			Flickable {
				width: parent.width
				height: parent.height

				// contentWidth: childrenRect.width
				contentWidth: ( 20 * clipLength ) * zoom // 10 seconds

				ListModel {
					id: clipData

			  		ListElement {
						clipName: "Clip1.mp4"
						clipPosition: 0.4
						clipDuration: 3
					}


			  		ListElement {
						clipName: "Clip the second coming.mp4"
						clipPosition: 12
						clipDuration: 7
					}
				}

			  	Column {
			  		Item {
				  		Repeater {
				  			model: clipData

				  			delegate: Clip { name: clipName; position: clipPosition; duration: clipDuration }
				  		}			  			
			  		}

			  	}
			}
	
		}

	}

}