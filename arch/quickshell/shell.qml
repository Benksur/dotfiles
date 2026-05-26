import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root

    // Stone — monochrome greys only
    property color colBg: "#0a0a0a"
    property color colFg: "#f0f0f0"
    property color colMuted: "#484848"
    property color colDim: "#909090"
    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 14

    function focusWorkspace(id) {
        if (Hyprland.usingLua) {
            Hyprland.dispatch("hl.dsp.focus({ workspace = " + id + " })")
            return
        }
        const ws = Hyprland.workspaces.values.find(w => w.id === id)
        if (ws)
            ws.activate()
        else
            Hyprland.dispatch("workspace " + id)
    }

    // System data
    property int cpuUsage: 0
    property int memUsage: 0
    property var lastCpuIdle: 0
    property var lastCpuTotal: 0

    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 34
    color: root.colBg

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 8

        Repeater {
            model: 9
            delegate: Rectangle {
                required property int index
                Layout.preferredWidth: 24
                Layout.preferredHeight: 24
                color: "transparent"

                property int wsId: index + 1
                property var ws: Hyprland.workspaces.values.find(w => w.id === wsId)
                property bool isActive: Hyprland.focusedWorkspace?.id === wsId

                Text {
                    anchors.centerIn: parent
                    text: parent.wsId
                    color: parent.isActive ? root.colFg : (parent.ws ? root.colDim : root.colMuted)
                    font {
                        family: root.fontFamily
                        pixelSize: root.fontSize
                        bold: parent.isActive
                    }
                }

                TapHandler {
                    onTapped: root.focusWorkspace(parent.wsId)
                }
            }
        }

        Item { Layout.fillWidth: true }

        Text {
            text: "CPU: " + cpuUsage + "%"
            color: root.colFg
            font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
        }

        Rectangle { width: 1; height: 16; color: root.colMuted }

        Text {
            text: "Mem: " + memUsage + "%"
            color: root.colFg
            font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
        }

        Rectangle { width: 1; height: 16; color: root.colMuted }

        Text {
            id: clock
            color: root.colFg
            font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
            text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
            }
        }
    }
}
