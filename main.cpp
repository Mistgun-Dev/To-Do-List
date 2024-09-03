#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Tache.h"
#include "GestionTaches.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    //Instace de Tache
    Tache tache;
    engine.rootContext()->setContextProperty("tache", &tache);

    //Instance gérant la gestion des Taches
    GestionTaches gestionTaches;
    engine.rootContext()->setContextProperty("gestionTaches", &gestionTaches);

    //Affectation du Main.qml
    const QUrl url(QStringLiteral("qrc:/To-Do-List/Main.qml"));

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
