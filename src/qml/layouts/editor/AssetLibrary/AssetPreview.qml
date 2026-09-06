import QtQuick
import "../../." 1.0

Rectangle {
	property var image: 0
	width: previewImage.width + 10
	height: previewImage.height + 10

	color: Reimei.backgroundColor
	border.color: "#20ffffff"

	Image {
		id: previewImage
		source: image
		anchors.centerIn: parent
		width: sourceSize.width / 2
		height: sourceSize.height / 2
	}
}
