import QtQuick 2.0
import "components"
import com.reachtech.systemplugin 1.0

Rectangle{
    id: root
    objectName: "root"
    width: screen.getScreenWidth()
    height: screen.getScreenHeight()
    property int totalFiles: 0
    color: "#AAAAAA"

    Text{
        id: txtTitle
        text: "Application Upgrade"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: parent.height > 480 ? 32 : 28
        width: parent.width
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.1
        font.family: "DejaVu Sans"
    }


    Text {
        id: txtMessage
        width: parent.width
        text: ""
        font.family: "DejaVu Sans"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 20
        anchors.top: txtTitle.bottom
        anchors.topMargin: parent.height * 0.1
    }


    VerticalRadioButtonList {
        id: radio
        anchors.top: txtMessage.bottom
        anchors.topMargin: parent.height * 0.1
		anchors.horizontalCenter: parent.horizontalCenter
        spacing: 4
        font.pixelSize: 18
        textColor: "#000000"
        imageHeight: 28
        itemSpacing: 7
        imageWidth: 28
        font.family: "DejaVu Sans"
        font.bold: false
        model: ListModel {
        }
        imageUnChecked: "images/radiobutton.png"
        imageChecked: "images/radiobutton_click.png"

        onValueChanged: {
            plugin.upgradeSourcePath = value;
            text1.text = "Note: If you decide to upgrade,\nall files in the " + plugin.applicationSourcePath + " folder will be deleted.\n"
                  + "The upgrade path is " + plugin.upgradeSourcePath;

        }
    }

    Upgrade{
        id: plugin
        applicationSourcePath: "/application/src"
        upgradeSourcePath: "/media/sda/application/src"

        onProgressChanged:{
            progress.value = (plugin.progress()/totalFiles)*100;
            if (progress.value == 100)
            {
                progress.visible = false;
                btnRestart.visible = true;
                text1.text = "The upgrade was successful.\nClick the \"Restart\" button to reboot your module.";
            }

            if (progress.value == 50)
                progress.hintFontColor = "#000000"
        }

        onErrorMsgChanged:{
            text1.text = plugin.errorMsg();
            btnRestart.visible = false;
            progress.visible = false;
			text1.y = 60;
        }
    }

    HorizontalLevelIndicator {
        id: progress
        anchors.top: radio.bottom
        anchors.topMargin: 40
        width: parent.width/2
        height: parent.height > 480 ? 40 : 26
        anchors.horizontalCenter: parent.horizontalCenter
        imageBase: "images/tank.png"
        imageOverlay: "images/tank_overlay.png"
        increment: 4
        maxValue: 100
        minValue: 0
        value: 0
        symbol: "%"
        hintFontBold: true
        hintFontColor: "#ffffff"
        hintFontPixelSize: 16
        hintFontFamily: "DejaVu Sans"
        visible: false
    }

    ImageButton {
        id: btnRestart
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: progress.bottom
        anchors.topMargin: parent.height > 480 ? 100 : 40
        width: 90
        height: parent.height > 480 ? 56 : 42
        text: "Restart"
        imageUp: "images/internal_button_up.bmp"
        imageDown: "images/internal_button_dn.bmp"
        font.bold: false
        font.family: "DejaVu Sans"
        font.pixelSize: 16
        visible: false

        onButtonClick: {
            btnRestart.visible = false;
            txtMessage.text = "Please wait...rebooting the module."
            system.execute("/etc/init.d/reboot");

        }
    }

    ImageButton {
        id: btnUpgrade
        width: 90
        height: parent.height > 480 ? 56 : 42
        text: "Upgrade"
        anchors.top: btnRestart.bottom
        anchors.topMargin: parent.height > 480 ? 20 : 40
        imageUp: "images/internal_button_up.bmp"
        imageDown: "images/internal_button_dn.bmp"
        font.bold: false
        font.family: "DejaVu Sans"
        font.pixelSize: 16
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter

        onButtonClick: {
		    if (radio.value.length > 0)
			{
                totalFiles = plugin.getTotalFileCount();
                btnUpgrade.visible = false;
                radio.visible = false;
                progress.visible = true;
                plugin.upgrade();
			}
			else
                txtMessage.text = "Please choose a radio button selection.";
        }
    }

    System{
        id: system
    }

    Timer{
        id: timer
        interval: 100; running: true; repeat: true
        onTriggered: checkForUSBDevices();
    }


    function checkForUSBDevices()
    {
        var usb = system.execute("sh /application/src/usb.sh");
        var values = usb.split("\n");
        
        if (values.length > 0 && values[0].length > 0)
		{
		    btnUpgrade.visible = true;
            txtMessage.text = "USB stick found.";
			timer.stop();
		}
        else {
            btnUpgrade.visible = false;
            txtMessage.text = "No USB stick found.  Plug in a USB stick."
        }

        for (var i=1; i < values.length-1; i++)
        {
            radio.model.append({item_value: values[i] + "/application/src", item_checked: false, item_text: "Upgrade from USB Stick: " + values[i]});
        }
    }
    Component.onCompleted: {
    }


}

