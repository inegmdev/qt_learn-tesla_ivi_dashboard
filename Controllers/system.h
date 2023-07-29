#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>

class System : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool carLockedStatus READ carLockedStatus WRITE setCarLockedStatus NOTIFY carLockedStatusChanged)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setOutdoorTemp NOTIFY outdoorTempChanged)
    Q_PROPERTY(QString driverName READ driverName WRITE setDriverName NOTIFY driverNameChanged)

public:
    explicit System(QObject *parent = nullptr);

    bool carLockedStatus() const;

    int outdoorTemp() const;

    QString driverName() const;

public slots:
    void setCarLockedStatus(bool newCarLockedStatus);
    void setOutdoorTemp(int newOutdoorTemp);
    void setDriverName(const QString &newDriverName);

signals:

    void carLockedStatusChanged();
    void outdoorTempChanged();
    void driverNameChanged();

private:
    bool m_carLockedStatus;
    int m_outdoorTemp;
    QString m_driverName;
};

#endif // SYSTEM_H
