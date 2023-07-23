#include "system.h"

System::System(QObject *parent)
    : QObject{parent}
    , m_carLockedStatus(true)
    , m_outdoorTemp(32)
    , m_driverName("NEGM")
{

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
