#include "volctrlhandler.h"

#define __DEBUG__
#ifdef __DEBUG__
#include <QDebug>
#endif

VolCtrlHandler::VolCtrlHandler(QObject *parent)
    : QObject{parent}
    ,m_volumeLevel (60)
{
    m_prevVolumeLevel = m_volumeLevel;
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

void VolCtrlHandler::toggleMute()
{
    if (m_volumeLevel != 0) {
        // Mute
        m_prevVolumeLevel = m_volumeLevel;
        setVolumeLevel(0);
    } else {
        if (m_prevVolumeLevel == 0) {
            m_prevVolumeLevel = 60; // Default
        }
        // Unmute
        setVolumeLevel(m_prevVolumeLevel);
    }
#ifdef __DEBUG__
    qDebug() << "Toggled mute :: m_volumeLevel = " << m_volumeLevel << ", m_prevVolumeLevel = " << m_prevVolumeLevel;
#endif
}

void VolCtrlHandler::setVolumeLevel(int newVolumeLevel)
{
    if (newVolumeLevel < 0 || newVolumeLevel > 100)
        return;
    if (m_volumeLevel == newVolumeLevel)
        return;
    m_prevVolumeLevel = m_volumeLevel;
    m_volumeLevel = newVolumeLevel;
    qDebug() << "Current volume: " << m_volumeLevel;
    emit volumeLevelChanged();
}
