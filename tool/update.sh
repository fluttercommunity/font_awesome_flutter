#!/usr/bin/env bash

pushd lib/fonts/

curl -O -L "https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/webfonts/fa-brands-400.ttf"
curl -O -L "https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/webfonts/fa-regular-400.ttf"
curl -O -L "https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/webfonts/fa-solid-900.ttf"

popd

curl -o /tmp/icons.json "https://raw.githubusercontent.com/FortAwesome/Font-Awesome/master/metadata/icons.json"

dart ./tool/generate_font.dart /tmp/icons.json
dart ./tool/generate_example.dart /tmp/icons.json
dartfmt -w ./lib/font_awesome_flutter.dart
dartfmt -w ./example/lib/icons.dart

rm /tmp/icons.json
