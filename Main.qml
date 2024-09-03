import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7

Window {
    width: 740
    height: 480
    minimumWidth: 550
    minimumHeight: 390
    visible: true
    color: "white"
    title: "To-Do-List Application"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "MainPage.qml"

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
