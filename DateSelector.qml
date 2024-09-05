import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Controls.Universal
import QtQuick.Layouts 6.7
import "."

// Date Selector
/**
 * @brief Dialog de sélection de date.
 * Cette Dialog permet à l'utilisateur de sélectionner une date à partir d'une grille de jours et de combobox pour le mois et l'année.
 * Elle est modale, ce qui signifie qu'elle bloque l'interaction avec le reste de l'application jusqu'à ce qu'elle soit fermée.
 */
Dialog {
    modal: true
    anchors.centerIn:  parent
    standardButtons: Dialog.Ok | Dialog.Cancel

    /**
     * @brief Gestionnaire pour l'acceptation de la sélection.
     * Vérifie si la date sélectionnée est antérieure à la date actuelle. Si c'est le cas, un message est affiché,
     * le champ de texte est vidé, et la boîte de dialogue est fermée sans ajouter la tâche.
     */
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
        /**
         * @brief ComboBox pour sélectionner le mois.
         * Ce ComboBox permet à l'utilisateur de choisir le mois parmi les 12 mois de l'année.
         * Le mois actuel est pré-sélectionné.
         */
        ComboBox {
            id: monthSelector
            Layout.fillWidth: true
            model: ["January", "February", "Mars", "April", "May", "Jun", "July", "August", "September", "October", "November", "December"]
            currentIndex: 1
        }

        /**
         * @brief ComboBox pour sélectionner l'année.
         * Ce ComboBox permet à l'utilisateur de choisir une année parmi les années proposées.
         * L'année actuelle est pré-sélectionnée.
         */
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

        /**
         * @brief Affiche les jours de la semaine.
         * Ce composant montre les noms des jours de la semaine selon la locale définie.
         */
        DayOfWeekRow {
            locale: grid.locale

            Layout.column: 1
            Layout.fillWidth: true
        }

        /**
         * @brief Affiche les numéros de semaine.
         * Ce composant montre les numéros de semaine en fonction du mois et de l'année sélectionnés.
         */
        WeekNumberColumn {
            month: grid.month
            year: grid.year
            locale: grid.locale
            Layout.fillHeight: true
        }

        /**
         * @brief Grille des jours du mois.
         * Ce composant affiche les jours du mois en cours, permettant à l'utilisateur de sélectionner un jour.
         */
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
