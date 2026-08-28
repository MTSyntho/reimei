import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.12

Item {
	property string name
	property real position
	property real duration

	x: (position * clipLength) * zoom
	width: (duration * clipLength) * zoom
	height: 85
	Rectangle {
		anchors.fill: parent
		color: "#252525"
		radius: 6

		Text {
			text: name
			color: "#ffffff"
			font.pixelSize: 12
			x: 4
			y: 2


		}
	}
}