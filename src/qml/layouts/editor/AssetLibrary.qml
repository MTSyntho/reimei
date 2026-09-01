import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Dialogs
import "AssetLibrary"
import "../." 1.0

Column {
	x: 25
	y: 15
	spacing: 8
	width: parent.width - ( x * 2 )
	height: parent.height
	clip: true

	Item {
		width: parent.width
		height: 31
		Row {
			spacing: 10
			height: 15
			x: 10
			anchors.verticalCenter: parent.verticalCenter


			Image {
				source: "../../assets/icons/pkg.svg"
				width: 15
				height: 15
			}

			Text {
				text: "Master > gameplay clips > day1"
				font.family: plusJakarta.name
				color: Reimei.textColor
				font.pixelSize: 12
			}
		}
	}

	Rectangle { width: parent.width; height: 1; color: "#33D9D9D9"; y: 0 } 

	ListModel {
		id: testAsset
	    ListElement {
	        assetName: "pinksheep.mp4"
	        assetType: "video"
	        assetPreview: ""
	    }
	    ListElement {
	        assetName: "osu toprun20260967.mp4"
	        assetType: "video"
	        assetPreview: ""
	    }
	    ListElement {
	        assetName: "arcaea_v7.0.mp4"
	        assetType: "video"
	        assetPreview: ""
	    }
	    ListElement {
	        assetName: "learning_rust_0383918"
	        assetType: "image"
	        assetPreview: ""
	    }
	    ListElement {
	        assetName: "masquerade_legion.flac"
	        assetType: "audio"
	        assetPreview: ""
	    }
	}

	Item {
		width: assetLibrary.width
		height: parent.height - 40

		FileDialog {
			id: assetLibraryFileDialog
		}

		GridView {
			model: testAsset
			x: 10
			y: 10
			width: parent.width - ( x * 2 )
			height: parent.height - 40
			clip: true


			cellWidth: 170
			cellHeight: 127

			delegate: AssetEntry { name: assetName ; type: assetType ; preview: assetPreview }

			ScrollBar.horizontal: ScrollBar {
				policy: ScrollBar.AsNeeded
			}

			ScrollBar.vertical: ScrollBar {
				policy: ScrollBar.AsNeeded
			}
		}
	}
}