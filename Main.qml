import QtQuick 6.7
import QtQuick.Controls 6.7
import QtQuick.Layouts 6.7

ApplicationWindow {

    property bool   isDarkMode: false
    property int    nbmaxtaches: 55
    property bool   rtch: false

    //property color  parametrage: "#DDBB3C"
    property color  parametrage: "#4CAF50"
    property color  parametrageReset: "#4CAF50"

    property color  sparametrage: "#668CCD"

    property int    parametragefSize: 19
    property int    parametragefSizeReset: 19
    property int    sousMenufSize: 15
    property int    sousMenufSizeReset: 15

    //pour les taches
    property int    tchfSize: 14
    property int    tchfSizeReset: 14
    property int    tchfSizeDate: 12
    property int    tchfSizeDateReset: 12
    property color  tchColor: "#eeeeee"


    property int    rslide: 0
    property color  sMenuRevenir:"#4B6292"
    property color  menuRevenir:"#B89C36"
    property color  menuRevenirh: "#897015"
    property color  sMenuRevenirh: "#2C477C"

    //property color  boutonp: "#B89C36"
    property color  boutonp: "green"
    property color  boutonpReset: "green"

    property color  sboutonp: "#4B6292"

    //property color  boutonh: "#897015"
    property color  boutonh: "#5CAF50"
    property color  boutonhReset: "#5CAF50"

    property color  sboutonh: "#2C477C"
    property color  theme: "white"
    property color  sousMenu: "transparent"
    property color  sousMenuColor: "black"

    property color  txtField: "#cccccc"
    property color  stxtField: "#eeeeee"
    id: mainWindow
    width: 740
    height: 480
    minimumWidth: 550
    minimumHeight: 390
    visible: true
    color:theme
    title: "To-Do-List Application"

    /**
    * @brief StackView permettant la naviguation entre les pages
    */
    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "MainPage.qml" //"introductionAnim.qml"

        pushEnter: Transition {
            NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 300 }
            NumberAnimation { property: "x"; from: width; to: 0; duration: 300 }
        }
        popExit: Transition {
            NumberAnimation { property: "opacity"; from: 1; to: 0; duration: 300 }
            NumberAnimation { property: "x"; from: 0; to: -width; duration: 300 }
        }
    }

    /**
    * @brief Loader permettant la naviguation dynamique entre les pages
    */
    Loader {
        id: dynamicLoader
        anchors.fill: parent
        visible: false
       onLoaded: {
        if (dynamicLoader.item !== null){
            stackView.push(dynamicLoader.item)
        }
       }
    }
}
