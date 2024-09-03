import QtQuick 6.7
import QtQuick.Controls 6.7
//import QtQuick.Controls.Basic
//import QtQuick.Controls.Imagine
//import QtQuick.Controls.Universal
import QtQuick.Layouts 6.7
import "."

// Time selector
Dialog {
    modal: true
    anchors.centerIn:  parent
    standardButtons: Dialog.Ok | Dialog.Cancel
    onAccepted: {
        console.log("Popup Confirmée");
    }
    onRejected: {
        console.log("Popup Annulée");
    }

    contentItem: Rectangle {
        id: rect
        color: "transparent"
        border.color: "transparent"
           anchors.centerIn: parent

        function formatText(count, modelData) {
            var data = count === 12 ? modelData + 1 : modelData;
            return data.toString().length < 2 ? "0" + data : data;
        }

        property int selectedHour: 12
        property int selectedMinute: 30

        FontMetrics {
            id: fontMetrics
        }

        Component {
            id: delegateComponent

            Label {
                text: rect.formatText(Tumbler.tumbler.count, modelData)
                opacity: 0.85 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: fontMetrics.font.pixelSize * 1.25
            }
        }
            Row {
                id: row

                Tumbler {
                    id: hoursTumbler
                    model: 12
                    delegate: delegateComponent
                    onCurrentItemChanged: {
                        rect.selectedHour = currentIndex+1
                        console.log(rect.selectedHour /*hoursTumbler.currentItem.text*/)
                        textfieltime.text = page.isEditMode ? qsTr("") : rect.selectedHour  /*hoursTumbler.currentItem.text*/ + ":" + rect.selectedMinute + " " + amPmTumbler.currentItem.text}
                }

                Tumbler {
                    id: minutesTumbler
                    model: 60
                    delegate: delegateComponent
                    background: Item {
                        Rectangle{
                            border.color: "#000000"

                        }
                    }
                    onCurrentItemChanged: {
                        rect.selectedMinute = minutesTumbler.currentItem.text
                        console.log(rect.selectedMinute)
                        textfieltime.text = page.isEditMode ? qsTr("") : rect.selectedHour  /*hoursTumbler.currentItem.text*/ + ":" + rect.selectedMinute + " " + amPmTumbler.currentItem.text
                    }
                }

                Tumbler {
                    id: amPmTumbler
                    model: ["AM", "PM"]
                    delegate: delegateComponent
                    onCurrentItemChanged: {
                        console.log(amPmTumbler.currentItem.text)
                      textfieltime.text = page.isEditMode ? qsTr("") : rect.selectedHour  /*hoursTumbler.currentItem.text*/ + ":" + rect.selectedMinute + " " + amPmTumbler.currentItem.text
                    }
                }
            }
    }
}
