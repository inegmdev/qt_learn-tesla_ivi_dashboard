#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>
#include "Controllers/system.h"
#include "Controllers/hvachandler.h"
#include "Controllers/volctrlhandler.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    System m_systemHandler;
    HvacHandler m_driverHvacHandler;
    HvacHandler m_passengerHvacHandler;
    VolCtrlHandler m_volCtrlHandler;

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);

    QQmlContext * context(engine.rootContext());

    context->setContextProperty("systemHandler", &m_systemHandler);
    context->setContextProperty("driverHvacHandler", &m_driverHvacHandler);
    context->setContextProperty("passengerHvacHandler", &m_passengerHvacHandler);
    context->setContextProperty("volCtrlHandler", &m_volCtrlHandler);

    // Load the QML inside the engine
    engine.load(url);
    return app.exec();
}
