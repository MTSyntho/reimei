pragma Singleton

import QtQml
import QtQuick

QtObject {
    readonly property color backgroundColor: "#252525"
    readonly property color titlebarColor: "#01FF0000"
    readonly property color textColor: "#ffffff"
    readonly property color borderColor: "#0fffffff"

    readonly property color timelineColor: "#1C1C1C"
    readonly property color timelineTimeRulerLineColor: "#20ffffff"
    readonly property color timelineTimeRulerTextColor: "#40ffffff"

    readonly property color clipColor: "#252525"
    readonly property color clipTextColor: "#ffffff"
    readonly property real clipFontSize: 12

    readonly property color placeholderGradientColor1: "#202020"
    readonly property color placeholderGradientColor2: "#000000"

    readonly property real clipLength: 80 // Length of clip in pixels for 1 second of time
}