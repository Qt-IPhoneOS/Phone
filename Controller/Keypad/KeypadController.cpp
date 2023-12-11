#include "KeypadController.h"

KeypadController::KeypadController()
{

}

QString KeypadController::numberSelected() const
{
    return mNumberSelected;
}

void KeypadController::setNumberSelected(const QString &newNumberSelected)
{
    if (mNumberSelected == newNumberSelected)
        return;
    mNumberSelected = newNumberSelected;
    emit numberSelectedChanged();
}
