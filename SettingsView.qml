import QtQuick 2.8
import QtQuick.Controls 2.1
import de.skycoder42.quickextras 1.0
import de.skycoder42.qtmvvm.quick 1.0
import de.skycoder42.qtmvvm.settings.quick 1.0

Page {
	id: settingsView
	property SettingsControl control: null

	function closeAction() {
		return settingsStack.closeAction();
	}

	header: ActionBar {
		title: qsTr("Settings")
		showMenuAsBack: true
		onMenuButtonClicked: control.close()

		TextField {
			id: searchField
			visible: false

			Component.onDestruction: visible = true
		}

		AppBarButton {
			id: searchButton
			visible: false
			imageSource: searchField.visible ?
							 "image://svg/de/skycoder42/qtmvvm/settings/quick/icons/ic_close" :
							 "image://svg/de/skycoder42/qtmvvm/settings/quick/icons/ic_search"
			text: qsTr("Search in settings")
			onClicked: {
				searchField.visible = !searchField.visible;
				if(searchField.visible)
					searchField.forceActiveFocus();
				else
					searchField.text = "";
			}

			Component.onDestruction: visible = true
		}

		AppBarButton {
			id: restoreButton
			visible: false
			imageSource: "image://svg/de/skycoder42/qtmvvm/settings/quick/icons/ic_settings_backup_restore"
			text: qsTr("Restore settings")
			onClicked: builder.restoreDefaults()

			Component.onDestruction: visible = true
		}
	}

	PresenterProgress {
		z: 10
	}

	StackView {
		id: settingsStack
		anchors.fill: parent

		function closeAction() {
			if(settingsStack.depth <= 1)
				return true;
			else {
				var item = settingsStack.pop();
				return false;
			}
		}
	}

	SettingsUiBuilder {
		id: builder
		buildView: settingsView
		control: settingsView.control
		filterText: searchField.text

		onInitActions: {
			searchButton.visible = allowSearch;
			restoreButton.visible = allowSearch;
		}

		onCreateView: {
			if(isOverview) {
				settingsStack.push("qrc:/de/skycoder42/qtmvvm/settings/quick/OverviewListView.qml", {
									   "model": model,
									   "showSections": showSections
								   });
			} else {
				settingsStack.push("qrc:/de/skycoder42/qtmvvm/settings/quick/SectionListView.qml", {
									   "model": model
								   });
			}
		}
	}
}
