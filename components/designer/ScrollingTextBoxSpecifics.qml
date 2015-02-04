import HelperWidgets 1.0
import QtQuick 1.0
import Bauhaus 1.0


QWidget {
    layout: QVBoxLayout {
        topMargin: 0
        bottomMargin: 0
        leftMargin: 0
        rightMargin: 0
        spacing: 0

        GroupBox {
            caption: "Scrolling Text Box"
            layout: VerticalLayout {
                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: qsTr("Text")
                        }
                        LineEdit {
                            backendValue: backendValues.initialText
                            baseStateFlag: isBaseState;
                            translation: true
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: qsTr("Max Chars")
                            toolTip: qsTr("Max Chars")
                        }

                        SpinBox {
                            backendValue: backendValues.maxChars
                            singleStep: 1
                            minimum: 0
                            maximum: 100000
                            baseStateFlag: isBaseState
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        ColorGroupBox {
                            caption: "Background Color"
                            finished: finishedNotify
                            backendColor: backendValues.textEditBackGroundColor
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: qsTr("Border Width")
                            toolTip: qsTr("Border Width")
                        }

                        SpinBox {
                            backendValue: backendValues.borderWidth
                            singleStep: 1
                            minimum: 0
                            maximum: 100
                            baseStateFlag: isBaseState
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        ColorGroupBox {
                            caption: "Border Color"
                            finished: finishedNotify
                            backendColor: backendValues.borderColor
                        }
                    }
                }

                //Header Details
                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: qsTr("Header Height")
                            toolTip: qsTr("Header Height")
                        }

                        SpinBox {
                            backendValue: backendValues.headerHeight
                            singleStep: 1
                            minimum: 0
                            maximum: 100
                            baseStateFlag: isBaseState
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        ColorGroupBox {
                            caption: "Header Light Color"
                            finished: finishedNotify
                            backendColor: backendValues.gradientLightColor
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        ColorGroupBox {
                            caption: "Header Dark Color"
                            finished: finishedNotify
                            backendColor: backendValues.gradientDarkColor
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: qsTr("Header Text")
                        }
                        LineEdit {
                            backendValue: backendValues.headerText
                            baseStateFlag: isBaseState;
                            translation: true
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: qsTr("Header Font Family")
                            toolTip: qsTr("Header Font Family")
                        }
                        FontComboBox{
                            backendValue: backendValues.headerTextFontFamily
                            baseStateFlag: isBaseState
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        ColorGroupBox {
                            caption: "Header Font Color"
                            finished: finishedNotify
                            backendColor: backendValues.headerTextColor
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: qsTr("Header Font Size")
                            toolTip: qsTr("Header Font Size")
                        }

                        SpinBox {
                            backendValue: backendValues.headerTextFontSize
                            singleStep: 1
                            minimum: 1
                            maximum: 100
                            baseStateFlag: isBaseState
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: ""
                            toolTip: qsTr("")
                        }
                        CheckBox {
                            text: qsTr("Header Bold")
                            toolTip: qsTr("Header Bold")
                            backendValue: backendValues.headerTextFontBold
                            baseStateFlag: isBaseState
                            checkable: true
                        }
                    }
                }

                //TextEdit details
                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: qsTr("Text Margins")
                            toolTip: qsTr("Text Margins")
                        }

                        SpinBox {
                            backendValue: backendValues.textMargins
                            singleStep: 1
                            minimum: 1
                            maximum: 100
                            baseStateFlag: isBaseState
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: qsTr("Text Font Family")
                            toolTip: qsTr("Text Font Family")
                        }
                        FontComboBox{
                            backendValue: backendValues.textEditFontFamily
                            baseStateFlag: isBaseState
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        ColorGroupBox {
                            caption: "Text Font Color"
                            finished: finishedNotify
                            backendColor: backendValues.textEditColor
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: qsTr("Text Font Size")
                            toolTip: qsTr("Text Font Size")
                        }

                        SpinBox {
                            backendValue: backendValues.textEditFontSize
                            singleStep: 1
                            minimum: 1
                            maximum: 100
                            baseStateFlag: isBaseState
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: ""
                            toolTip: qsTr("")
                        }
                        CheckBox {
                            text: qsTr("Text Bold")
                            toolTip: qsTr("Text Bold")
                            backendValue: backendValues.textEditFontBold
                            baseStateFlag: isBaseState
                            checkable: true
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: qsTr("Scrollbar Width")
                            toolTip: qsTr("Scrollbar Width")
                        }

                        SpinBox {
                            backendValue: backendValues.scrollBarWidth
                            singleStep: 1
                            minimum: 0
                            maximum: 100
                            baseStateFlag: isBaseState
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        ColorGroupBox {
                            caption: "Scrollbar Background Color"
                            finished: finishedNotify
                            backendColor: backendValues.scrollBarBackGroundColor
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        ColorGroupBox {
                            caption: "Scrollbar Color"
                            finished: finishedNotify
                            backendColor: backendValues.scrollBarColor
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        ColorGroupBox {
                            caption: "Scrollbar Border Color"
                            finished: finishedNotify
                            backendColor: backendValues.scrollBarBorderColor
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: qsTr("Scrollbar Border Width")
                            toolTip: qsTr("Scrollbar Border Width")
                        }

                        SpinBox {
                            backendValue: backendValues.scrollBarBorderWidth
                            singleStep: 1
                            minimum: 0
                            maximum: 100000
                            baseStateFlag: isBaseState
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        ColorGroupBox {
                            caption: "Scrollbar Highlight Color"
                            finished: finishedNotify
                            backendColor: backendValues.scrollBarHighLight
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        Label {
                            text: qsTr("Show Scrollbar Up Down Arrow")
                            toolTip: qsTr("Show Scrollbar Up Down Arrow")
                        }

                        CheckBox {
                            id: showUpDownCheckBox
                            backendValue: backendValues.showScrollBarUpDownArrow
                            baseStateFlag: isBaseState
                            checkable: true
                            text: qsTr("True")
                        }

                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        ColorGroupBox {
                            enabled: showUpDownCheckBox.checked
                            caption: "Scrollbar Up Down Arrow Color"
                            finished: finishedNotify
                            backendColor: backendValues.scrollBarUpDownArrowColor
                        }
                    }
                }

                QWidget {
                    layout: HorizontalLayout {
                        ColorGroupBox {
                            enabled: showUpDownCheckBox.checked
                            caption: "Scrollbar Up Down Arrow Highlight Color"
                            finished: finishedNotify
                            backendColor: backendValues.scrollBarUpDownArrowHighLight
                        }
                    }
                }


                QScrollArea {
                }

            }
        }
    }
}
