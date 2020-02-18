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
dependencies:
  font_awesome_flutter: <latest_version>
```

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

## FAQ

### Why aren't the icons aligned properly or why are the icons being cut off?

Please use the `FaIcon` widget provided by the library instead of the `Icon` 
widget provided by Flutter. The `Icon` widget assumes all icons are square, but
many Font Awesome Icons are not.

### Why aren't the icons showing up on Mobile devices?

If you're not seeing any icons at all, sometimes it means that Flutter has a cached version of the app on device and hasn't pushed the new fonts. I've run into that as well a few times...

Please try:

  1. Stopping the app
  2. Running `flutter clean` in your app directory
  3. Deleting the app from your simulator / emulator / device
  4. Rebuild & Deploy the app.

### Why aren't the icons showing up on Web?

Most likely, the fonts were not correctly added to the `FontManifest.json`.
Note: older versions of Flutter did not properly package non-Material fonts 
in the `FontManifest.json` during the build step, but that issue has been 
resolved and this shouldn't be much of a problem these days.

Please ensure you are using `Flutter 1.14.6 beta` or newer! 

### How can I use pro icons?

This library only packages the free Font Awesome icon fonts. If you own the pro
icon fonts and want to use them with Flutter, please follow these instructions.

:exclamation: By importing pro icons you acknowledge that it is your obligation
to keep these files private. This includes **not** uploading your package to
a public github repository or other public file sharing services.

  * Download this package's newest release, extract the folder and move it to a location of your choice
  * Remove `#`s from `pubspec.yaml` at the indicated position
  * run `flutter packages get`
  * Download your font awesome pro icons (web version)
  * Move all `.ttf` files from the `webfonts` directory to this package's lib/fonts (replace existing fonts)
  * Move `icons.json` from `metadata` to this directory
  * Run `./tool/update.sh`
  * Uncomment `IconDataLight` in `lib/icon_data.dart`
  * In your project's dependencies, replace the version tag for `font_awesome_flutter` with the path to your custom installation.
  
```yaml
dependencies:
  font_awesome_flutter:
    path: /path/to/font_awesome_flutter
    ...
```

## Contributors

  - Brian Egan
  - Phil Plante
  - Michael Spiss
