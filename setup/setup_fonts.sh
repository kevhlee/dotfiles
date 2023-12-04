#!/bin/sh

FONTS_DIR=$HOME/downloaded_fonts

mkdir -p $FONTS_DIR

echo "Downloading 'Iosevka'"
curl -L -o $FONTS_DIR/ttf-iosevka-26.2.2.zip https://github.com/be5invis/Iosevka/releases/download/v26.2.2/ttf-iosevka-26.2.2.zip

echo "Downloading 'scientifica'"
curl -L -o $FONTS_DIR/scientifica.tar https://github.com/nerdypepper/scientifica/releases/download/v2.3/scientifica.tar

echo "Downloaded fonts. Check the '$FONTS_DIR' folder."
