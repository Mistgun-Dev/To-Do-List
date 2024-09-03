import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7

ApplicationWindow {

    property color  parametrage: "#DDBB3C"
    property color  sparametrage: "#668CCD"
    property int    parametragefSize: 25
    property int    parametragefSizeReset: 25
    property int    sousMenufSize: 18
    property int    sousMenufSizeReset: 18
    property int    rslide: 0
    property color  sMenuRevenir:"#4B6292"
    property color  menuRevenir:"#B89C36"
    property color  menuRevenirh: "#897015"
    property color  sMenuRevenirh: "#2C477C"
    property color  boutonp: "#B89C36"
    property color  sboutonp: "#4B6292"
    property color  boutonh: "#897015"
    property color  sboutonh: "#2C477C"
    property color  theme: "white"
    property color  sousMenu: "transparent"
    property color  sousMenuColor: "black"

    id: mainWindow
    width: 740
    height: 480
    minimumWidth: 550
    minimumHeight: 390
    visible: true
    color:theme
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
