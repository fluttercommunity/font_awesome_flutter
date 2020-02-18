# font_awesome_flutter 

[![Flutter Community: font_awesome_flutter](https://fluttercommunity.dev/_github/header/font_awesome_flutter)](https://github.com/fluttercommunity/community)

The [Font Awesome](http://fontawesome.io/icons/) Icon pack available as set of Flutter Icons.

Based on Font Awesome 5.12.1. Includes all free icons:

  * Regular
  * Solid
  * Brands

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
  font_awesome_flutter: <latest_version>
```
When icons do not render try [this](https://github.com/brianegan/font_awesome_flutter/issues/28#issuecomment-460109786).

## Usage

```dart
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return IconButton(
      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
      icon: FaIcon(FontAwesomeIcons.gamepad), 
      onPressed: () { print("Pressed"); }
     );
  }
}
```

## Example

View the Flutter app in the `example` directory to see all the available `FontAwesomeIcons`.

## Include pro icons

If you bought font awesome pro icons, you can import them here. 

:exclamation: By importing pro icons you acknowledge that it is your obligation to keep these files private. This includes **not** uploading your package to github or other public file sharing services.

- Download this package's newest release, extract the folder and move it to a location of your choice
- Remove `#`s from `pubspec.yaml` at the indicated position
- run `flutter packages get`
- Download your font awesome pro icons (web version)
- Move all `.ttf` files from the `webfonts` directory to this package's lib/fonts (replace existing fonts)
- Move `icons.json` from `metadata` to this directory
- Run `./tool/update.sh`
- In your project's dependencies, replace the version tag for `font_awesome_flutter` with the path to your custom installation.
```yaml
dependencies:
  font_awesome_flutter:
    path: /path/to/font_awesome_flutter
    ...
```
- Uncomment `IconDataLight` in `lib/icon_data.dart`

## Contributors

  - Brian Egan
  - Phil Plante
  - Michael Spiss
