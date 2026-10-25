import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Window
import QtQuick.Layouts
import Reimei
import "Timeline"

Rectangle {

	width: parent.width
	height: parent.height
	color: "#00000000"

	readonly property var clipLength: Reimei.clipLength
	readonly property real zoom: zoomSlider.value
	// property real projectLength: Global.projectLength
	// property real currentTime: Global.currentTime

	Component { id: trackDataPlaceholder ; ListModel {} }
	Component { id: trackPlaceholder ; Track {} }

	Timer {
		id: playerHeadTimer
		interval: ( 1 / Global.frameRate ) * 1000
		repeat: true
		running: isPlaying ? true : false

		onTriggered: {
			Global.currentTime += interval / 1000

			if (Global.currentTime >= Global.projectLength) {
				Global.currentTime = 0
				isPlaying = false
			}
		}
	}

	// Item {
	// 	id: videoTime
	// 	function

	// }

	Column {
		width: parent.width
		height: parent.height

		Rectangle {
			color: Reimei.backgroundColor
			width: parent.width
			height: 35

			Slider {
				id: zoomSlider
				width: 250
				from: 0.5
				value: 1
				to: 5

				onPressedChanged: {
					if (!pressed) { timeRuler.requestPaint() }
				}
			}

			Text {
				id: displayVideoTime
				text: playbackState.getFormattedTime(Global.currentTime) + " / " + playbackState.getFormattedTime(Global.projectLength)
				// text: "jikan" // im trying to fix the strange crashes from playback. apparently this text element is the cause? ( update: check HomeWindow )
				anchors.centerIn: parent
				color: Reimei.textColor
			}
		
		}

		Rectangle { width: parent.width; height: 1; color: Reimei.borderColor; y: -5 } 

		Rectangle {
			color: Reimei.timelineColor 
			width: parent.width
			height: parent.height - 36

			Flickable {
				id: timelineViewport
				width: parent.width
				height: parent.height
				flickableDirection: Flickable.HorizontalFlick
				// boundsBehavior: Flickable.DragOverBounds
				clip: true

				// contentWidth: 4096
				contentWidth: ( ( Global.projectLength + 2 ) * clipLength ) * zoom
				contentHeight: timelineColumn.height

				TimeRuler { id: timeRuler }

				Connections {
				    target: timelineViewport

				    function onContentXChanged() {
				        timeRuler.requestPaint()
				    }
				}

				Column {
					y: 4 + 20
					id: timelineColumn
					width: parent.width
					spacing: 4
					height: childrenRect.height + 85
				}

				PlayerHead { id: playerHead }

				Rectangle {
					id: selectionBox
					visible: false

					color: "#20ffffff"
					border.color: "#40ffffff"
					border.width: 1
					radius: 6

				}

				PinchHandler {
				    target: null

				    onScaleChanged: function(delta) {
				    	zoomSlider.value = Math.max( zoomSlider.from, Math.min( zoomSlider.to, zoomSlider.value * delta ) )
				    }
				}

				MouseArea {
					acceptedButtons: Qt.RightButton
			        anchors.fill: parent
			        // preventStealing: true

			        property point dragStart: Qt.point(0, 0)

				    onWheel: function(event) {
				        if (!(event.modifiers & Qt.ControlModifier)) {
				            event.accepted = false
				            return
				        }

				    	// var factor = event.angleDelta.y / 120
				    	var factor = Math.pow( 1.1, event.angleDelta.y / 512 )

				    	zoomSlider.value = Math.max( zoomSlider.from, Math.min( zoomSlider.to, zoomSlider.value * factor ) )

				    	 console.log("New slider value:", zoomSlider.value)
				    	event.accepted = true
				    }

			        onPressed: function(mouse) {
			        	dragStart = Qt.point(mouse.x, mouse.y)

			        	selectionBox.visible = true
			        	selectionBox.x = mouse.x
			        	selectionBox.y = mouse.y
			        	selectionBox.width = 0
			        	selectionBox.height = 0
			        }

			        onPositionChanged: function(mouse) {
			        	// selectionBox.width = selectionBox.x + mouse.x
			        	// selectionBox.height = selectionBox.y + mouse.y

				        selectionBox.x = Math.min(dragStart.x, mouse.x)
				        selectionBox.y = Math.min(dragStart.y, mouse.y)

				        selectionBox.width = Math.abs(mouse.x - dragStart.x) // why didnt they teach me this in class yet... ( abs func )
				        selectionBox.height = Math.abs(mouse.y - dragStart.y)


						if ( selectionBox.x + selectionBox.width > ( timelineViewport.contentX + timelineViewport.width ))  {
							timelineViewport.contentX += 10
						} else if ( selectionBox.x < timelineViewport.contentX ) {
							timelineViewport.contentX -= 10
						} 

						function intersects(clip) {
						    let topLeft = clip.mapToItem(
						        timelineViewport.contentItem, 0, 0
						    )

						    let bottomRight = clip.mapToItem(
						        timelineViewport.contentItem,
						        clip.width, clip.height
						    )

						    let boxLeft = selectionBox.x
						    let boxTop = selectionBox.y
						    let boxRight = boxLeft + selectionBox.width
						    let boxBottom = boxTop + selectionBox.height

						    return topLeft.x < boxRight &&
						           bottomRight.x > boxLeft &&
						           topLeft.y < boxBottom &&
						           bottomRight.y > boxTop
						}

						// for (i)
			        }


				    onReleased: function() {
			        	selectionBox.visible = false
			        	selectionBox.x = 0
			        	selectionBox.y = 0
			        	selectionBox.width = 0
			        	selectionBox.height = 0
				    }			        
				}

				ScrollBar.horizontal: ScrollBar {
					policy: ScrollBar.AlwaysOn
				}

				// ScrollBar.vertical: ScrollBar {
				// 	policy: ScrollBar.AlwaysOn
				// }
			}
	
		}

	}


	DropArea {
		id: timelineDropArea
		width: parent.width
		height: parent.height

		keys: ["application/x-reimei-asset"]
	}

// Component.onCompleted: {
//     var testParent = Qt.createQmlObject(
//         'import QtQuick; Item { width: 14592; height: 200 }',
//         timelineViewport.parent
//     );

//     var track = trackPlaceholder.createObject(testParent);

//     if (track)
//         console.log("Track created outside Flickable:", track.width);
// }
	Component.onCompleted: {
		var projectData = JSON.parse(dummyData);
		var longestEndTime = 0;
		// dummyData.forEach(function(index) {

		// })

		for (var i = 0; i < projectData.tracks.length; i++)  {
			var track = trackPlaceholder.createObject(timelineColumn);
			var trackData = projectData.tracks[i];


		    for (var l = 0; l < trackData.length; l++) {
		        var clip = trackData[l]
		        var endTime = clip.clipPosition + clip.clipDuration

		        if (endTime > longestEndTime)
		            longestEndTime = endTime
		    }

			track.load(trackData);
		}

	    Global.projectLength = longestEndTime;
	    // Global.projectLength = 100;

	    console.log("projectLength:", Global.projectLength)
	    console.log("clipLength:", clipLength)
	    console.log("zoom:", zoom)
	    console.log("contentWidth:", timelineViewport.contentWidth)
	    console.log("timelineColumn.width:", timelineColumn.width)

	}	

}