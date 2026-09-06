import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Dialogs
import QtCore
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
	    // ListElement {
	    //     assetName: "pinksheep.mp4"
	    //     assetType: "video"
	    //     assetPreview: ""
	    // }
	    // ListElement {
	    //     assetName: "osu toprun20260967.mp4"
	    //     assetType: "video"
	    //     assetPreview: ""
	    // }
	    // ListElement {
	    //     assetName: "arcaea_v7.0.mp4"
	    //     assetType: "video"
	    //     assetPreview: ""
	    // }
	    // ListElement {
	    //     assetName: "learning_rust_0383918"
	    //     assetType: "image"
	    //     assetPreview: ""
	    // }
	    // ListElement {
	    //     assetName: "masquerade_legion.flac"
	    //     assetType: "audio"
	    //     assetPreview: ""
	    // }
	}

	Item {
		width: assetLibrary.width
		height: parent.height - 40

		FileDialog {
			id: assetLibraryFileDialog
			acceptLabel: "Import"
			currentFolder: StandardPaths.standardLocations(StandardPaths.MoviesLocation)[0]
			fileMode: FileDialog.OpenFiles
    		nameFilters: [ 
    			"All media files ( *.mp4 *.mkv *.webm *.avi *.mov *.3gp *.png *.jpg *.jpeg *.webp *.svg *.mp3 *.wav *.ogg *.opus *.flac *.m4a )",
    			"Video files ( *.mp4 *.mkv *.webm *.avi *.mov *.3gp )", 
    			"Image files ( *.png *.jpg *.jpeg *.webp *.svg )", 
    			"Audio files ( *.mp3 *.wav *.ogg *.opus *.flac *.m4a )"]

			onAccepted: {
			    for (const file of selectedFiles) {
					const extension = file.toString().split(".").pop().toLowerCase();
					var fileFormat = "";

				    if (["mp4", "mkv", "webm", "avi", "mov", "m4v", "3gp"].includes(extension))
				        fileFormat = "video"

				    if (["png", "jpg", "jpeg", "webp", "svg"].includes(extension))
				        fileFormat = "image"

				    if (["mp3", "wav", "ogg", "opus", "flac", "m4a"].includes(extension))
				        fileFormat = "audio"

			        testAsset.append({
			            assetName: file.toString().split("/").pop(),
			            assetType: fileFormat,
			            assetPreview: file.toString()
			        })
			    }
			}
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

		Rectangle {
			width: assetLibrary.width
			height: 100
			anchors.bottom: parent.bottom
			anchors.bottomMargin: 25
			z: 1000

		    gradient: Gradient {
		        GradientStop { position: 0.0; color: "transparent" }
		        GradientStop { position: 1.0; color: Reimei.backgroundColor }
		    }

		    Item {
		    	width: parent.width
		    	height: 50
		    	anchors.bottom: parent.bottom

		    	Button {
		    		width: 100
		    		height: 22
					anchors.verticalCenter: parent.verticalCenter

					onClicked: {
						assetLibraryFileDialog.open()
					}

					background: Rectangle {
						width: parent.width
						height: parent.height
						border.width: 1
						border.color: "#20ffffff"
						color: Reimei.backgroundColor
						radius: 6


						Text {
							text: "Import New"
							color: Reimei.textColor
							font.pixelSize: 10
							font.family: plusJakarta.name
							anchors.centerIn: parent
						}

					}		    		
		    	}


				Text {
					text: "Total assets imported: 0"
					color: Reimei.textColor
					font.pixelSize: 10
					x: parent.width - width
					anchors.verticalCenter: parent.verticalCenter

				}
			}
		}
	}
}