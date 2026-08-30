use cxx_qt_lib::{QGuiApplication, QQmlApplicationEngine, QUrl};

mod cxxqt_object;

fn main() {
    let mut app = QGuiApplication::new();
    let mut engine = QQmlApplicationEngine::new();

    if let Some(engine) = engine.as_mut() {
        engine.load(&QUrl::from("qrc:/layouts/HomeWindow.qml"));
    }

    if let Some(app) = app.as_mut() {
        app.exec();
    }
}