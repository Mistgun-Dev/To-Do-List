import QtQuick 2.15
import QtQuick.Controls 2.15
import "."

Rectangle {
    id: introAnimation
    width: 740
    height: 480
    color: "white"

    // Image 1 avec animation de translation et fondu
    Image {
        id: image1
        source: "images/enedis.jpg"
        width: parent.width * 0.8
        height: parent.height * 0.8
        anchors.centerIn: parent
        opacity: 0.0
        visible: true
        x: -width
    }

    Image {
        id: image2
        source: "images/infogene.png"
        width: parent.width * 0.8
        height: parent.height * 0.8
        anchors.centerIn: parent
        opacity: 0.0
        visible: true
        x: width
    }

    Image {
        id: image3
        source: "images/datascientest.png"
        width: parent.width * 0.8
        height: parent.height * 0.8
        anchors.centerIn: parent
        opacity: 0.0
        visible: true
        scale: 0.5
    }

    SequentialAnimation
    {
        id: introSequence
        running: true

        PauseAnimation { duration: 500 }

        // Transition pour la première image
        ParallelAnimation {
            PropertyAnimation {
                target: image1
                property: "opacity"
                from: 0.0
                to: 1.0
                duration: 1500
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: image1
                property: "scale"
                from: 0.5
                to: 1.0
                duration: 2000
                easing.type: Easing.InOutQuad
            }
            PauseAnimation { duration: 2000 }
            PropertyAnimation {
                target: image1
                property: "opacity"
                from: 1.0
                to: 0.0
                duration: 1500
                easing.type: Easing.InOutQuad
            }
        }

        // Transition pour la deuxième image
        ParallelAnimation {
            PropertyAnimation {
                target: image2
                property: "opacity"
                from: 0.0
                to: 1.0
                duration: 1500
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: image2
                property: "scale"
                from: 0.5
                to: 1.0
                duration: 2000
                easing.type: Easing.InOutQuad
            }
            PauseAnimation { duration: 1500 }
            PropertyAnimation {
                target: image2
                property: "opacity"
                from: 1.0
                to: 0.0
                duration: 1500
                easing.type: Easing.InOutQuad
            }
        }

        // Transition pour la troisième image avec effet de zoom et translation
        ParallelAnimation {
            PropertyAnimation {
                target: image3
                property: "opacity"
                from: 0.0
                to: 1.0
                duration: 1500
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: image3
                property: "scale"
                from: 0.5
                to: 1.0
                duration: 1500
                easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: image3
                property: "x"
                from: parent.width
                to: parent.width / 2 - image3.width / 2
                duration: 1500
                easing.type: Easing.OutBounce
            }
            PauseAnimation { duration: 1500 }
        }

        // Transition vers MainPage.qml
        PropertyAnimation {
            target: introAnimation
            property: "opacity"
            from: 1.0
            to: 0.0
            duration: 1000
        }

        onFinished: dynamicLoader.source = "MainPage.qml";
    }
}
