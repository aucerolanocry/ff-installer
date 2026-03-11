#!/data/data/com.termux/files/usr/bin/bash

DESTINO="/storage/emulated/0/MIUI/sound_recorder/fm_rec"
ARQUIVO="main.2019116013.com.dts.freefireth.obb"

LINK="https://github.com/keIIerzz/ff-installer/releases/download/v1/main.2019116013.com.dts.freefireth.obb"

mkdir -p $DESTINO

pkg install wget -y

echo "Baixando arquivo..."

wget --show-progress $LINK -O $DESTINO/$ARQUIVO

echo "Download concluído!"
