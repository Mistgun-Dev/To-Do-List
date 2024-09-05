#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Tache.h"
#include "GestionTaches.h"
#include "database.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    //Instance gérant la gestion des Taches
    GestionTaches gestionTaches;
    QQmlApplicationEngine engine;

    // Créer une instance de database
    Database& dbManager = Database::instance();
    dbManager.createTable();

    engine.rootContext()->setContextProperty("dbManager", &dbManager);

    //Instace de Tache
    //QSharedPointer<Tache> tache = QSharedPointer<Tache>::create();
    Tache *tache = new Tache();
    engine.rootContext()->setContextProperty("tache", tache);

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
