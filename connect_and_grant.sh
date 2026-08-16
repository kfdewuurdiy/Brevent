#!/bin/bash

# Script para parear via ADB Wi-Fi e conceder permissões ao com.google.android

echo "[*] Digite o código de 6 dígitos mostrado no celular:"
read PAIR_CODE

# Pareamento automático
adb pair localhost:3700 $PAIR_CODE

# Conexão na porta padrão
adb connect localhost:5555

# Conceder permissões ao pacote com.google.android
adb shell pm grant com.google.android android.permission.READ_EXTERNAL_STORAGE
adb shell pm grant com.google.android android.permission.WRITE_EXTERNAL_STORAGE

# Mostrar resultado
adb shell dumpsys package com.google.android | grep permission

echo "[✓] Pareamento e permissões concluídos!"
