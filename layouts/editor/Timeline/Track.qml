import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.12


Item {
	// property var trackModel
	width: parent.width
	height: childrenRect.height

	ListModel {
		id: trackModel
	}

	Repeater {
		model: trackModel

		delegate: Clip { name: clipName; position: clipPosition; duration: clipDuration }
	}	

	function load(data) {
		trackModel.clear()

		for (var i = 0; i < data.length; i++) {
			trackModel.append(data[i])
			console.log(data[i])
		}
	}		  			
}

