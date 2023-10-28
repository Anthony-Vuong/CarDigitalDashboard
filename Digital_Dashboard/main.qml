import QtQuick 2.15
import QtQuick.Window 2.15

import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Window {
    width: 400
    height: 440
    visible: true
    title: qsTr("Digital Gauge")


    Rectangle {
        width: 400
        height: 400

        CircularGauge {


            id: gauge
            anchors.fill: parent
            style: CircularGaugeStyle {
                labelInset: outerRadius * 0.2

                tickmarkLabel: null

                tickmark: Text {
                    text: styleData.value

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.bottom
                        text: styleData.index
                        color: "blue"
                    }
                }

                minorTickmark: Text {
                    text: styleData.value
                    font.pixelSize: 8

                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.bottom
                        text: styleData.index
                        font.pixelSize: 8
                        color: "blue"
                    }
                }
            }

            Text {
                id: indexText
                text: "Major and minor indices"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: valueText.top
                color: "blue"
            }
            Text {
                id: valueText
                text: "Major and minor values"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }


            value: accelerating ? maximumValue : 0
                anchors.centerIn: parent

                property bool accelerating: false

                Keys.onSpacePressed: accelerating = true
                Keys.onReleased: {
                    if (event.key === Qt.Key_Space) {
                        accelerating = false;
                        event.accepted = true;
                    }
                }

                Component.onCompleted: forceActiveFocus()

                Behavior on value {
                    NumberAnimation {
                        duration: 1000
                    }
                }
        }
    }
}
