import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7

Window {
    id: mainWindow
    width: 740
    height: 480
    minimumWidth: 550
    minimumHeight: 390
    visible: true
    title: "To-Do-List Application"

    StackView {
            id: stackView
            anchors.fill: parent
            initialItem: NewTask {
            }
        }

    // Loader pour charger dynamiquement des pages
    Loader {
        id: dynamicLoader
        visible: false
       onLoaded: {
        if (dynamicLoader.item !== null){
            stackView.push(dynamicLoader.item)
        }
       }
    }
}
