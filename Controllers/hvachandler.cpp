#include "hvachandler.h"

HvacHandler::HvacHandler(QObject *parent)
    : QObject{parent}
    , m_targetTemp(26)
{

}

int HvacHandler::targetTemp() const
{
    return m_targetTemp;
}

void HvacHandler::changeTargetTemp(const int &val)
{
    int newTargetTemp = m_targetTemp + val;
    setTargetTemp(newTargetTemp);
}

void HvacHandler::setTargetTemp(int newTargetTemp)
{
    if (m_targetTemp == newTargetTemp)
        return;
    m_targetTemp = newTargetTemp;
    emit targetTempChanged();
}
