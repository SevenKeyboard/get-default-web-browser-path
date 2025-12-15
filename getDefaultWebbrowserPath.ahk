#Requires AutoHotkey v1.1.0+
;==============================================================
; getDefaultWebBrowserPath — Retrieve the default web browser executable path
;
; GitHub: https://github.com/SevenKeyboard/get-default-web-browser-path
; Author: SevenKeyboard Ltd. (2025)
; License: The Unlicense
;==============================================================

;  '"C:\Program Files\Google\Chrome\Application\chrome.exe" --single-argument %1'
;  'C:\Program Files\Google\Chrome\Application\chrome.exe'

class VersionManager_getDefaultWebBrowserPath
{
    static _ := VersionManager_getDefaultWebBrowserPath._init()
    _init()    {
        global
        GETDEFAULTWEBBROWSERPATH_VERSION := "1.0.0"
    }
}
getDefaultWebBrowserPath()    {
    regRead browserKeyName, % "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice", % "ProgId"
    if (errorLevel || browserKeyName=="")
        return
    regRead browserFullCommand, % "HKEY_CLASSES_ROOT\" browserKeyName "\shell\open\command"
    return (!errorLevel
        ?regExReplace(browserFullCommand,"sD`a)^""(.*?)"".*$","${1}")
        :"")
}