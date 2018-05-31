#!/usr/bin/env bash

pushd assets/

curl -O "https://github.com/FortAwesome/Font-Awesome/raw/master/web-fonts-with-css/webfonts/fa-brands-400.ttf"
curl -O "https://github.com/FortAwesome/Font-Awesome/raw/master/web-fonts-with-css/webfonts/fa-regular-400.ttf"
curl -O "https://github.com/FortAwesome/Font-Awesome/raw/master/web-fonts-with-css/webfonts/fa-solid-900.ttf"

popd

curl -o /tmp/icons.json "https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/advanced-options/metadata/icons.json"

dart ./tool/generate_font.dart /tmp/icons.json
dartfmt -w ./lib/font_awesome_flutter.dart

rm /tmp/icons.json
