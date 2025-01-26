#!/bin/sh

FONTS_DIR=$HOME/downloaded_fonts

mkdir -p $FONTS_DIR

echo "Downloading 'Iosevka Nerd Font'"
curl -L -o $FONTS_DIR/Iosevka.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Iosevka.zip

echo "Downloading 'IosevkaTerm Nerd Font'"
curl -L -o $FONTS_DIR/IosevkaTerm.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/IosevkaTerm.zip

echo "Downloading 'IosevkaTermSlab Nerd Font'"
curl -L -o $FONTS_DIR/IosevkaTermSlab.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/IosevkaTermSlab.zip

echo "Downloaded fonts. Check the '$FONTS_DIR' folder."
