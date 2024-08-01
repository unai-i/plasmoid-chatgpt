import QtQuick
import QtQuick.Controls as QQC
import QtQuick.Layouts

import org.kde.plasma.core as PlasmaCore
import org.kde.kirigami as Kirigami
import org.kde.plasma.components as PlasmaComponents3
import org.kde.kquickcontrolsaddons as KQuickAddons

Kirigami.FormLayout {
  id: page

  property alias cfg_icon: plasmoidIcon.icon.name
  property alias cfg_zoomFactor: zoomFactor.value

  property int commonIconSize: PlasmaCore.Units.iconSizes.smallMedium

  Layout.fillWidth: true

  Item {
    Kirigami.FormData.label: i18n("Behavior")
    Kirigami.FormData.isSection: true
  }

  ColumnLayout {
    RowLayout {
      QQC.Label {
        text: i18n("Zoom Factor:")
      }

      QQC.SpinBox {
        id: zoomFactor
        decimals: 2
        stepSize: 0.05

        QQC.ToolTip.visible: hovered
        QQC.ToolTip.text: i18n("Zoom factor uses to scale the plasmoid")
      }
    }
  }

  Kirigami.Separator {
    Layout.fillWidth: true
    Kirigami.FormData.isSection: true
  }

  Item {
    Kirigami.FormData.label: i18n("Appearance")
    Kirigami.FormData.isSection: true
  }

  KQuickAddons.IconDialog {
    id: plasmoidIconDialog
    iconSize: commonIconSize

    property var icon

    onIconNameChanged: icon.name = iconName
  }

  ColumnLayout {
    RowLayout {
      QQC.Label {
        text: i18n("Plasmoid Icon:")
      }

      QQC.Button {
        id: plasmoidIcon

        QQC.ToolTip.visible: hovered
        QQC.ToolTip.text: i18n("Select icon for plasmoid")

        icon.width: commonIconSize
        icon.height: commonIconSize

        onClicked: {
          plasmoidIconDialog.open()
          plasmoidIconDialog.icon = plasmoidIcon.icon
        }
      }

      QQC.Button {
        QQC.ToolTip.visible: hovered
        QQC.ToolTip.text: i18n("Set default icon for plasmoid")

        icon.name: "edit-clear"
        icon.width: commonIconSize
        icon.height: commonIconSize

        onClicked: plasmoidIcon.icon.name = "go-jump"
      }
    }
  }
}
