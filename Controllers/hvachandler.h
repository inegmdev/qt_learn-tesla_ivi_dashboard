#ifndef HVACHANDLER_H
#define HVACHANDLER_H

#include <QObject>

class HvacHandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int targetTemp READ targetTemp WRITE setTargetTemp NOTIFY targetTempChanged)
public:
    explicit HvacHandler(QObject *parent = nullptr);

    int targetTemp() const;

    Q_INVOKABLE void changeTargetTemp(const int & val);


public slots:
    void setTargetTemp(int newTargetTemp);

signals:

    void targetTempChanged();

private:
    int m_targetTemp;
};

#endif // HVACHANDLER_H
