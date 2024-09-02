import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Controls.Universal
import QtQuick.Layouts 6.7
import "."

// Date Selector
Dialog {
    modal: true
    anchors.centerIn:  parent
    standardButtons: Dialog.Ok | Dialog.Cancel

    onAccepted: {
        let currentDate = new Date(); // Date actuelle
        let selectedDate = grid.selectedDate; // Date sélectionnée

        // Vérifier si la date sélectionnée est avant la date actuelle
        if (selectedDate < currentDate) {
            console.log("Date sélectionnée invalide : Date antérieure à aujourd'hui");
            textfieldate.clear()
            dateSelectorDialog.close(); // Fermer le dialogue sans ajouter la tâche
        }
        // console.log("Date Selection confirmed");
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

            property var selectedDate: new  Date()

                delegate: Item {
                    id: delegateItem

                    // compare dates without time
                    property bool isSelectedDay: (
                                    model.year  === grid.selectedDate.getFullYear()
                                    && model.month+1 === grid.selectedDate.getMonth()+1
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
                    textfieldate.text= grid.selectedDate.getDate()+"/"+(grid.selectedDate.getMonth()+1) +"/"+grid.selectedDate.getFullYear()
                }
        }
        }
    }
}
