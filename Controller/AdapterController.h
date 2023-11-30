#ifndef ADAPTERCONTROLLER_H
#define ADAPTERCONTROLLER_H

#include <QObject>
#include <Common/Enums.h>
#include <unordered_map>
#include <Contact/ContactController.h>
#include <Favourite/FavouriteController.h>
#include <Keypad/KeypadController.h>
#include <Recent/RecentController.h>
#include <Common/AbstractController.h>
#include <PhoneBook/PhoneBookAdapter.h>
#include <SIM/SIMAdapter.h>

class AdapterController : public QObject
{
    Q_OBJECT

public:
    AdapterController();
    ~AdapterController();

    template<typename T>
    T* getController(Enums::PhoneType type)
    {
        static T* ins = nullptr;
        if (ins == nullptr)
        {
            ins = new T();
            mControllers.emplace(std::pair<Enums::PhoneType, AbstractController*>(type, ins));
        }
        return ins;
    }

private:
    std::unordered_map<Enums::PhoneType, AbstractController*> mControllers;
    Enums::PhoneType mCurrentType {Enums::ContactType};
};

#endif // ADAPTERCONTROLLER_H
