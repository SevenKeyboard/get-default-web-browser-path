#Requires AutoHotkey v2.0.0+
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
    static _ := this._init()
    static _init()    {
        global
        GETDEFAULTWEBBROWSERPATH_VERSION := "1.0.0"
    }
}
getDefaultWebBrowserPath()    {
    try  {
        browserKeyName:=regRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\UserChoice", "ProgId")
    }  catch  {
        return
    }
    try  {
        browserFullCommand:=regRead("HKEY_CLASSES_ROOT\" browserKeyName "\shell\open\command")
    }  catch  {
    }  else  {
        return regExReplace(browserFullCommand,"sD`a)^`"(.*?)`".*$","${1}")
    }
}