#!/bin/bash

# Script para parear via ADB Wi-Fi e conceder permissões ao com.google.android

echo "[*] Digite o código de 6 dígitos mostrado no celular:"
read PAIR_CODE

echo "[*] Pareando com o dispositivo via porta 3700 ..."
adb pair localhost:3700 $PAIR_CODE

echo "[*] Conectando ao dispositivo na porta 5555 ..."
adb connect localhost:5555

echo "[*] Concedendo permissões ao pacote com.google.android ..."
adb shell pm grant com.google.android android.permission.READ_EXTERNAL_STORAGE
adb shell pm grant com.google.android android.permission.WRITE_EXTERNAL_STORAGE

echo "[*] Verificando permissões aplicadas ..."
adb shell dumpsys package com.google.android | grep permission

echo "[✓] Pareamento e permissões concluídos!"
