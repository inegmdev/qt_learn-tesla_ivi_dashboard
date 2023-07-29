#include "volctrlhandler.h"

#define __DEBUG__
#ifdef __DEBUG__
#include <QDebug>
#endif

VolCtrlHandler::VolCtrlHandler(QObject *parent)
    : QObject{parent}
    ,m_volumeLevel (60)
{

}

int VolCtrlHandler::volumeLevel() const
{
    return m_volumeLevel;
}

void VolCtrlHandler::changeVolumeLevel(const int &diffVol)
{
    int newVolumeLevel = m_volumeLevel + diffVol;
    if (newVolumeLevel > 100) newVolumeLevel = 100;
    if (newVolumeLevel < 0) newVolumeLevel = 0;
    setVolumeLevel(newVolumeLevel);
}

void VolCtrlHandler::setVolumeLevel(int newVolumeLevel)
{
    if (newVolumeLevel < 0 || newVolumeLevel > 100)
        return;
    if (m_volumeLevel == newVolumeLevel)
        return;
    m_volumeLevel = newVolumeLevel;
    qDebug() << "Current volume: " << m_volumeLevel;
    emit volumeLevelChanged();
}
