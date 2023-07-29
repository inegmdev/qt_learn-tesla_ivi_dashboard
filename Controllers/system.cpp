#include "system.h"

#include <QDateTime>
#ifdef __DEBUG__
#include <QDebug>
#endif

System::System(QObject *parent)
    : QObject{parent}
    , m_carLockedStatus(true)
    , m_outdoorTemp(32)
    , m_driverName("NEGM")
{
    m_periodic500msTrigger = new QTimer(this);
    m_periodic500msTrigger->setInterval(500); // Invoke the timer every 500ms
    m_periodic500msTrigger->setSingleShot(true); // Will only run once, and in the invokable callable we will reset that manually
    connect(m_periodic500msTrigger, &QTimer::timeout, this, &System::updateCurrentTime); // Every timeout event, the currentTimeTimerTimeout will be invoked
    // Manually update the time first time
    updateCurrentTime();
}

bool System::carLockedStatus() const
{
    return m_carLockedStatus;
}

void System::setCarLockedStatus(bool newCarLockedStatus)
{
    if (m_carLockedStatus == newCarLockedStatus)
        return;
    m_carLockedStatus = newCarLockedStatus;
    emit carLockedStatusChanged();
}

int System::outdoorTemp() const
{
    return m_outdoorTemp;
}

void System::setOutdoorTemp(int newOutdoorTemp)
{
    if (m_outdoorTemp == newOutdoorTemp)
        return;
    m_outdoorTemp = newOutdoorTemp;
    emit outdoorTempChanged();
}

QString System::driverName() const
{
    return m_driverName;
}

void System::setDriverName(const QString &newDriverName)
{
    if (m_driverName == newDriverName)
        return;
    m_driverName = newDriverName;
    emit driverNameChanged();
}

QString System::currentTime() const
{
    return m_currentTime;
}

void System::setCurrentTime(const QString &newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;
    emit currentTimeChanged();
}

void System::updateCurrentTime()
{
    QDateTime dateTime = QDateTime::currentDateTime();
    QString currentTime = dateTime.toString("hh:mmAP");

#ifdef __DEBUG__
    qDebug() << "Current time" << currentTime;
#endif

    // Update the m_currentTime with the string
    setCurrentTime(currentTime);
    // Refresh the timer for the next trigger
    m_periodic500msTrigger->start();
}
