/*
* This file is part of KeePit
*
* Copyright (C) 2016 Dan Beavon
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation; either version 2
* of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

import QtQuick 2.4 /* 2.0 */
import Ubuntu.Components 1.3 /* 1.2 */
import Ubuntu.Components.Popups 1.3 /* 1.2 */
import KeePass3 1.0

Page {

    property alias txtEntityPass: password
    title: i18n.tr(database.selectedEntry.title)
    head {
            actions: [
                Action {
                    text: i18n.tr("Copy")
                    iconName: "edit-copy"
                    onTriggered: Clipboard.push(password.text);
                },

                Action {
                    text: i18n.tr("Settings")
                    iconName: "settings"
                    onTriggered: PopupUtils.open(settingsDisabledComponent)                    
                }
            ]
    }

    Flow {
        spacing: units.gu(1)
        anchors {
            margins: units.gu(2)
            fill: parent
            }

            Label {
             text:  database.selectedEntry.uuid
             visible: false;
            }           

            Label {
             text: "Username"
             width: parent.width
             color: UbuntuColors.darkAubergine
            }

            TextField {
                id: userName
                text: database.selectedEntry.username
                readOnly: true
                color: UbuntuColors.darkAubergine
            }

            Label {
             text: "Password"
             width: parent.width
             color: UbuntuColors.darkAubergine
            }

            TextField {
                id: password
                text: database.selectedEntry.password
                echoMode : TextInput.Password
                readOnly: true
                width: parent.width
                color: UbuntuColors.darkAubergine
            }

            Button {
                text: "Reveal / Hide" /* "..." */
                width: parent.width
                font.pointSize: 25  /* Size 12 */
                onClicked: {
                    if(password.echoMode == TextInput.Normal) {
                        password.echoMode = TextInput.Password;
                    } else {
                        password.echoMode = TextInput.Normal;
                    }
                }
            }           

            Label {
             text: "Url"
             width: parent.width
             color: UbuntuColors.darkAubergine
            }

            TextField {
                id: url
                text: database.selectedEntry.url
                readOnly: true
                width: parent.width
                color: UbuntuColors.darkAubergine
            }

            Label {
             text: "Notes"
             width: parent.width
             color: UbuntuColors.darkAubergine
            }

            TextArea {
                id: notes
                text: database.selectedEntry.notes
                readOnly: true
                width: parent.width
                color: UbuntuColors.darkAubergine
            }
    }
}
