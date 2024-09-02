import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Controls.Fusion
import QtQuick.Layouts 6.7

Page {
    id: page
    visible: true
    width: 740
    height: 480
    title: "New Task"

    property color headerColor: "#4CAF50"
    property color textColor: "#4CAF50"
    property color buttonColor: "#4CAF50"
    property color inputFieldColor: "#E8F5E9"
    property color backgroundColor: "#F7F7F7"

    header: ToolBar {
        id: toolbar
        background: Rectangle {
            color: headerColor
            width: page.width
        }

        RowLayout {
            width: parent.width

            Button {
                icon.source: "path/to/back-icon.png" // Assurez-vous d'avoir une icône de retour
                background: Rectangle { color: "transparent" }
                onClicked: console.log("Go back")
            }

            Label {
                text: "Home"
                color: "white"
                font.pixelSize: 20
                Layout.alignment: Qt.AlignLeft
            }

            Item {
                Layout.fillWidth: true
            }

            Label {
                text: "New task"
                color: "white"
                font.pixelSize: 20
                Layout.alignment: Qt.AlignCenter
            }

            Item {
                Layout.fillWidth: true
            }

            Button {
                icon.source: "path/to/check-icon.png" // Assurez-vous d'avoir une icône de validation
                background: Rectangle { color: "transparent" }
                onClicked: console.log("Task saved")
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 10

        Label {
            text: "Title"
            color: textColor
            font.pixelSize: 18
        }

        TextField {
            Layout.fillWidth: true
            implicitHeight: page.height* 0.08 /*40*/
            placeholderText: "Task name"
            background: Rectangle {
                color: backgroundColor
                border.color: "lightgray"
                radius: 5
            }
        }

        Label {
            text: "Due date"
            color: textColor
            font.pixelSize: 18
        }

        RowLayout {
            TextField {
                Layout.fillWidth: true
                implicitHeight: page.height* 0.08
                placeholderText: "dd/MM/yyyy"
                background: Rectangle {
                    color: backgroundColor
                    border.color: "lightgray"
                    radius: 5
                }
            }

            // Button {
            //     icon.source: "file:///C:/Users/HP/OneDrive/Documents/ProjetFinal/To-Do-List/images/calendar.jpg"
            //     background: Rectangle { color: "transparent" }
            //     onClicked: console.log("Date picker opened")
            // }
            Button {
                icon.source: "file:///C:/Users/HP/OneDrive/Documents/ProjetFinal/To-Do-List/images/Calendar_Icon"
                icon.width: 27  // Ajustez la taille de l'icône
                icon.height: 27
                background: Rectangle {
                    color: "#F7F7F7"
                    border.color: "lightgreen"
                    radius: 10
                }
                padding: 4  // Ajoutez du padding pour un meilleur affichage
                onClicked: dateSelectorDialog.open()
            }
        }

        Label {
            text: "Due time"
            color: textColor
            font.pixelSize: 18
        }

        RowLayout {
            TextField {
                Layout.fillWidth: true
                implicitHeight: page.height* 0.08
                placeholderText: "hh:mm AP"
                background: Rectangle {
                    color: backgroundColor
                    border.color: "lightgray"
                    radius: 5
                }
            }

            Button {
                icon.source: "file:///C:/Users/HP/OneDrive/Documents/ProjetFinal/To-Do-List/images/Clock_Icon"
                icon.width: 27  // Ajustez la taille de l'icône
                icon.height: 27
                background: Rectangle {
                    color: "#F7F7F7"
                    border.color: "lightgreen"
                    radius: 10
                }
                padding: 4  // Ajoutez du padding pour un meilleur affichage
                onClicked: timeSelectorDialog.open()
                }
        }

        Label {
            text: "Notes"
            color: textColor
            font.pixelSize: 18
        }

        TextArea {
            Layout.fillWidth: true
            Layout.fillHeight: true
            implicitHeight: page.height* 0.2
            background: Rectangle {
                color: backgroundColor
                border.color: "lightgray"
                radius: 5
            }
        }

        Button {
            text: "Add task"
            background: Rectangle {
                color: buttonColor
                radius: 20
            }
            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true
            onClicked: console.log("Task added")
        }
    }

    background: Rectangle {
        color: "white"
    }

    // Date Selector
    Dialog {
        id: dateSelectorDialog
        //title: "Choix du date"
        modal: true
        anchors.centerIn:  parent
        standardButtons: Dialog.Ok | Dialog.Cancel

        //property var selectedDate: new Date()

        onAccepted: {
            console.log("Date Selection confirmed");
        }
        onRejected: {
            console.log("Date Selection ignored");
        }

        contentItem: GridLayout {
            columns: 2

            ComboBox {
                id: monthSelector

                Layout.fillWidth: true
                model: ["January", "February", "Mars", "April", "May", "Jun", "July", "August", "September", "October", "November", "December"]
                currentIndex: 1
            //     onCurrentIndexChanged: {
            //         calendar.month = currentMonth
            //     }

            //     yearSelector.onCurrentIndexChanged: {
            //         calendarYear = years[currentYear]
            //     }
            }

            ComboBox {
                id: yearSelector

                Layout.fillWidth: true
                model: ListModel {
                    ListElement { year: 2023 }
                    ListElement { year: 2024 }
                    ListElement { year: 2025 }
                    ListElement { year: 2026 }
                    ListElement { year: 2027 }
                    ListElement { year: 2028 }
                    ListElement { year: 2029 }
                }
                textRole: "year"
                currentIndex: 6 // Pour l'année 2029

            }
            GridLayout {
                columns: 2

            DayOfWeekRow {
                locale: grid.locale

                Layout.column: 1
                Layout.fillWidth: true
            }

            WeekNumberColumn {
                month: grid.month
                year: grid.year
                locale: grid.locale
                Layout.fillHeight: true
            }

            MonthGrid {
                id: grid
                month: monthSelector.currentIndex
                year: yearSelector.currentText
                locale: Qt.locale("en_US")

                Layout.fillWidth: true
                Layout.fillHeight: true

                property var selectedDate: new Date()

                    delegate: Item {
                        id: delegateItem

                        // compare dates without time
                        property bool isSelectedDay: (
                                            model.year  === grid.selectedDate.getFullYear()
                                         && model.month === grid.selectedDate.getMonth()
                                         && model.day   === grid.selectedDate.getDate()
                                )
                        Text {
                            color: delegateItem.isSelectedDay ? "green" : "black"
                            text: model.day
                            font.bold: delegateItem.isSelectedDay ? true : false
                            font.pixelSize: delegateItem.isSelectedDay ? 14 : 12
                            font.underline: delegateItem.isSelectedDay ? true : false
                        }

                    }
                    onPressed: function (date) {
                        selectedDate = date
                        console.log(grid.selectedDate)
                        console.log(grid.selectedDate.getDate())
                    }
    }
            }
        }
    }

    // Time selector
    Dialog {
        id: timeSelectorDialog
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
                    console.log(rect.selectedHour)}
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
                        rect.selectedMinute = currentIndex
                    console.log(rect.selectedMinute)}
                }

                Tumbler {
                    id: amPmTumbler
                    model: ["AM", "PM"]
                    delegate: delegateComponent
                }
            }
        }
    }
}
