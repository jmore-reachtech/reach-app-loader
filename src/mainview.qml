import QtQuick 1.1
import "components"

Rectangle{
    id: root
    objectName: "root"
    width: 480
    height: 272
    property int totalFiles: 0
    signal message(string msg)
    color: "#ff0000"
	
    Item{
        id: upgrade
        objectName: "upgrade"
        property string run: ""

        onRunChanged: {
            if  (run == "true")
            {
                text1.font.pixelSize = 16
                text1.text = "Upgrading qml application...please wait."
                totalFiles = plugin.getTotalFileCount();
                btnUpgrade.visible = false;
                password.visible = false;
                radio.visible = false;
                progress.visible = true;
                plugin.upgrade();
            }
        }
    }

    VerticalRadioButtonList {
        id: radio
        x: 125
        y: 73
        width: 267
        height: 86
        font.strikeout: false
        font.underline: false
        font.italic: false
        spacing: 4
        font.pixelSize: 17
        textColor: "#000000"
        imageHeight: 36
        itemSpacing: 25
        imageWidth: 36
        font.family: "DejaVu Sans"
        font.bold: false
        model: ListModel {
            ListElement {
                item_value: "/media/mmcblk0p2/application"
                item_checked: true
                item_text: "Load from micro SD card"
            }

            ListElement {
                item_value: "/media/sda1/application"
                item_checked: false
                item_text: "Load from USB flash drive"
            }
        }
        imageUnChecked: "images/radiobutton.png"
        imageChecked: "images/radiobutton_click.png"

        onValueChanged: {
            plugin.upgradeSourcePath = value;
        }
    }

    Upgrade{
        id: plugin
        applicationSourcePath: "/application"
        upgradeSourcePath: "/media/sda1/application"

        onProgressChanged:{
            progress.value = (plugin.progress()/totalFiles)*100;
            if (progress.value == 100)
            {
                progress.visible = false;
                btnRestart.visible = true;
                text1.font.pixelSize = 18
				text1.text = "Load was successful.\nClick \"Restart\" to reboot the module.";
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
        x: 40
        y: 120
        width: 400
        height: 20
        imageBase: "images/tank.png"
        imageOverlay: "images/tank_overlay.png"
        increment: 4
        maxValue: 100
        minValue: 0
        value: 0
        symbol: "%"
        hintFontBold: true
        hintFontColor: "#ffffff"
        hintFontPixelSize: 14
        hintFontFamily: "DejaVu Sans"
        visible: false
    }


    ImageButton {
        id: btnRestart
        x: 195
        y: 131
        width: 90
        height: 56
        text: "Restart"
        imageUp: "images/internal_button_up.bmp"
        imageDown: "images/internal_button_dn.bmp"
        font.bold: true
        font.family: "DejaVu Sans"
        font.pixelSize: 14
        visible: false

        onButtonClick: {
            btnRestart.visible = false;
            text1.text = "Please wait...rebooting the module."
            plugin.execute("/etc/init.d/reboot", [""]);

        }
    }

    Text {
        id: text1
        x: 18
        y: 19
        width: 444
        height: 48
        text: qsTr("Initial Application Load")
        horizontalAlignment: Text.AlignHCenter
        font.family: "DejaVu Sans"
        font.pixelSize: 24
    }



    ImageButton {
        id: btnUpgrade
        x: 163
        y: 191
        width: 154
        height: 53
        text: "Go"
        imageUp: "images/internal_button_up.bmp"
        textColor: "#000000"
        font.pixelSize: 30
        imageDown: "images/internal_button_dn.bmp"
        font.family: "DejaVu Sans"
        font.bold: false

        onButtonClick: {
            text1.font.pixelSize = 18
			text1.text = "Upgrading qml application...please wait."
            totalFiles = plugin.getTotalFileCount();
            btnUpgrade.visible = false;
            radio.visible = false;
            progress.visible = true;
            plugin.upgrade();
        }
    }



    System{
        id: system
    }

    Component.onCompleted: {
        //Check if we are running from NAND
        var data = system.execute("df");

        if (data.indexOf("ubi0:rootfs0") < 0)
        {
            //show an error
            text1.font.pixelSize = 18
			text1.text = "Error:  You must boot from NAND to upgrade."
            btnUpgrade.visible = false;
            password.visible = false;
            radio.visible = false;
			text1.y = 60;
        }
    }


}
