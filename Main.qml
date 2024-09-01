import QtQuick 6.7
import QtQuick.Controls 6.7

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    StackView {
            id: stackView
            anchors.fill: parent
            initialItem: NewTask {
            }
        }
}
