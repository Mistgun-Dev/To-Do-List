#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "GestionTaches.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    GestionTaches gestionTaches;

    engine.rootContext()->setContextProperty("gestionTaches", &gestionTaches);

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
