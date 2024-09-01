#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "GestionTaches.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    //Créationd 'un instance de la classe GestionTaches avec SharedPonter pour éviter les problemes de mémoire et de compatibilité
    //QSharedPointer<GestionTaches> gestionTaches = QSharedPointer<GestionTaches>::create();
    //engine.rootContext()->setContextProperty("gestionTaches", gestionTaches.data());

    GestionTaches gestionTaches;
    engine.rootContext()->setContextProperty("gestionTaches", &gestionTaches);
    //engine.rootContext()->setContextProperty("listeTache", gestionTaches.getTachesAsVariantList());

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
