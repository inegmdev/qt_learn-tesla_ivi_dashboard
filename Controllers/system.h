#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>
#include <QTimer>

class System : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool carLockedStatus READ carLockedStatus WRITE setCarLockedStatus NOTIFY carLockedStatusChanged)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setOutdoorTemp NOTIFY outdoorTempChanged)
    Q_PROPERTY(QString driverName READ driverName WRITE setDriverName NOTIFY driverNameChanged)
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged)

public:
    explicit System(QObject *parent = nullptr);
    // Getters for QML
    bool carLockedStatus() const;
    int outdoorTemp() const;
    QString driverName() const;
    QString currentTime() const;

public slots:
    // Setters for QML
    void setCarLockedStatus(bool newCarLockedStatus);
    void setOutdoorTemp(int newOutdoorTemp);
    void setDriverName(const QString &newDriverName);
    void setCurrentTime(const QString &newCurrentTime);
    // Custom Functions
    //   - Update m_currentTime manually
    void updateCurrentTime();

signals:

    void carLockedStatusChanged();
    void outdoorTempChanged();
    void driverNameChanged();
    void currentTimeChanged();

private:
    bool m_carLockedStatus;
    int m_outdoorTemp;
    QString m_driverName;
    QString m_currentTime;
    // Timer used to periodically update the time
    QTimer * m_periodic500msTrigger;
};

#endif // SYSTEM_H
