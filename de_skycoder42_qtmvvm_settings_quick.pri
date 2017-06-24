HEADERS += \
	$$PWD/settingsuibuilder.h \
	$$PWD/settingsoverelement.h \
	$$PWD/settingsentryelement.h \
	$$PWD/multifilterproxymodel.h \
    $$PWD/settingsinputviewfactory.h

SOURCES += \
	$$PWD/settingsuibuilder.cpp \
	$$PWD/settingsoverelement.cpp \
	$$PWD/settingsentryelement.cpp \
	$$PWD/multifilterproxymodel.cpp \
    $$PWD/settingsinputviewfactory.cpp

RESOURCES += \
	$$PWD/de_skycoder42_qtmvvm_settings_quick.qrc
	
QPM_TRANSLATIONS += $$PWD/qtmvvm_settings_quick_de.ts \
	$$PWD/qtmvvm_settings_quick_template.ts

INCLUDEPATH += $$PWD
