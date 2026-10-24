use cxx_qt_build::{CxxQtBuilder, QmlFile, QmlModule};

fn main() {
	CxxQtBuilder::new_qml_module(
		QmlModule::new("Reimei").qml_files([
			QmlFile::from("src/qml/layouts/imports/Reimei/Reimei.qml")
				.singleton(true),
			QmlFile::from("src/qml/layouts/imports/Reimei/Global.qml")
				.singleton(true),
		]),
	)
	.file("src/backend.rs")
	.qrc("src/qml/layouts.qrc")
	.qrc("src/qml/assets.qrc")
	.build();
}
