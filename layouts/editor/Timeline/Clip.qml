import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import "../../." 1.0

Item {
	property string name
	property real position
	property real duration

	x: (position * clipLength) * zoom
	width: (duration * clipLength) * zoom
	height: 85
	Rectangle {
		anchors.fill: parent
		color: Reimei.clipColor
		radius: 6

		Text {
			text: name
			color: Reimei.clipTextColor
			font.pixelSize: Reimei.clipFontSize
			x: 4
			y: 2


		}
	}
}