#include "settingsinputviewfactory.h"

QUrl SettingsInputViewFactory::getDelegate(const QByteArray &type, const QVariantMap &)
{
	if(type == "bool")
		return QStringLiteral("qrc:/de/skycoder42/qtmvvm/settings/quick/BoolDelegate.qml");
	else
		return QStringLiteral("qrc:/de/skycoder42/qtmvvm/settings/quick/MsgDelegate.qml");
}
