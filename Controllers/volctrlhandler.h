#ifndef VOLCTRLHANDLER_H
#define VOLCTRLHANDLER_H

#include <QObject>

class VolCtrlHandler : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int volumeLevel READ volumeLevel WRITE setVolumeLevel NOTIFY volumeLevelChanged)

public:
    explicit VolCtrlHandler(QObject *parent = nullptr);

    int volumeLevel() const;

    Q_INVOKABLE void changeVolumeLevel(const int &diffVol);
    Q_INVOKABLE void toggleMute();

public slots:

    void setVolumeLevel(int newVolumeLevel);

signals:

    void volumeLevelChanged();

private:
    int m_volumeLevel;
    int m_prevVolumeLevel;
};

#endif // VOLCTRLHANDLER_H
