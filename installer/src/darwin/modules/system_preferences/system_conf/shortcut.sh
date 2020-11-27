#!/bin/bash
###############################################################################
# Shortcut                                                                    #
###############################################################################


# キーボードとマウスのショートカット #
# Mission Control ( array{ Unicode, KeyCode, Modifiers } )
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 32 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>126</integer>
            <integer>10747904</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>
"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 34 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>126</integer>
            <integer>10878976</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>
"

# アプリケーションウインドウ
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 33 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>125</integer>
            <integer>10747904</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>
"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 35 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>65535</integer>
            <integer>125</integer>
            <integer>10878976</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>
"

# デスクトップを表示
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 36 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>92</integer>
            <integer>42</integer>
            <integer>1048576</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>
"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 37 "
<dict>
    <key>enabled</key>
    <true/>
    <key>value</key>
    <dict>
        <key>parameters</key>
        <array>
            <integer>92</integer>
            <integer>42</integer>
            <integer>1179648</integer>
        </array>
        <key>type</key>
        <string>standard</string>
    </dict>
</dict>
"
