import sys
import os
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine

# os.environ["QT_QPA_PLATFORM"] = "windows:darkmode=1"

app = QGuiApplication(sys.argv)

engine = QQmlApplicationEngine()
engine.quit.connect(app.quit)

engine.load('layouts/main.qml')

root = engine.rootObjects()[0]

sys.exit(app.exec())