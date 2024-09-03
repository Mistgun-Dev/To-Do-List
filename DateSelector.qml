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
            currentIndex: 1 // Pour l'année 2024
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

            /** type:var Propriété pour la date */
            property var selectedDate: new  Date()

            /** type:string Propriété pour contenir le mois en string */
            property string selectedMonthAsString: "01"

            /** type:string Propriété pour contenir le jour en string */
            property string selectedDayAsString: "01"

            /**
             * Fonction pour convertir un nombre entier en string
             * @param type:int number le nombre à convertir
             * @return type:string la valeur de conversion en string
             */
            function numberToString(number) {
                return number.toString().length < 2 ? "0" + number : number;
            }

                delegate: Item {
                    id: delegateItem

                    /** type:bool Propriété pour comparer des dates sans heures */
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
                    grid.selectedMonthAsString = grid.numberToString(grid.selectedDate.getMonth()+1)
                    grid.selectedDayAsString = grid.numberToString(grid.selectedDate.getDate())
                    console.log(grid.selectedDate)
                    textfieldate.text= grid.selectedDayAsString+"/"+grid.selectedMonthAsString +"/"+grid.selectedDate.getFullYear()
                }
        }
        }
    }
}
