#ifndef SETTINGSINPUTVIEWFACTORY_H
#define SETTINGSINPUTVIEWFACTORY_H

#include <inputviewfactory.h>

class SettingsInputViewFactory : public InputViewFactory
{
public:
	virtual QUrl getDelegate(const QByteArray &type, const QVariantMap &properties);
};

#endif // SETTINGSINPUTVIEWFACTORY_H
