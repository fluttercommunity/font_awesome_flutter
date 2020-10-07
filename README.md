# font_awesome_flutter 

[![Flutter Community: font_awesome_flutter](https://fluttercommunity.dev/_github/header/font_awesome_flutter)](https://github.com/fluttercommunity/community)

The [Font Awesome](http://fontawesome.io/icons/) Icon pack available as set of Flutter Icons.

Based on Font Awesome 5.15.1. Includes all free icons:

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

### Icon names

Icon names equal those on the [official website](http://fontawesome.io/icons/), but are written in lower camel case. If more than one icon style is available for an icon, the style name is used as prefix, except for "regular".

#### Examples:
Icon name | Code | Style
--- | --- | ---
[angle-double-up](https://fontawesome.com/icons/angle-double-up?style=solid) | FontAwesomeIcons.angleDoubleUp | solid _(this icon does not have other free styles)_
[arrow-alt-circle-up](https://fontawesome.com/icons/arrow-alt-circle-up?style=regular) | FontAwesomeIcons.arrowAltCircleUp | regular
[arrow-alt-circle-up](https://fontawesome.com/icons/arrow-alt-circle-up?style=solid) |  FontAwesomeIcons.solidArrowAltCircleUp | solid


## Example App

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

  * Download this package's [newest release](https://github.com/fluttercommunity/font_awesome_flutter/archive/master.zip), extract the folder, move it to a location of your choice and go to that directory
  * Remove `#`s from `pubspec.yaml` at the indicated position
  * run `flutter packages get`
  * Download your font awesome pro icons (web version)
  * Move all `.ttf` files from the `webfonts` directory to `/path/to/your/font_awesome_flutter/lib/fonts` (replace existing fonts)
  * Move `icons.json` from `metadata` to `/path/to/your/font_awesome_flutter`
  * From there run `./tool/update.sh` on linux or `.\tool\update.bat` on windows
    * _Note for windows users:_ Please run the script only in cmd or powershell. Flutter is known to have problems with third-party shells.
  * Add version `>= 4.7.0` to your project's dependencies, Override it with the path to your local installation:

```yaml
dependencies:
  font_awesome_flutter: '>= 4.7.0'
  ...
  
dependency_overrides:
  font_awesome_flutter:
    path: /path/to/your/font_awesome_flutter
  ...
```

### Duotone icons

Duotone icons require special treatment. Instead of `FaIcon` a special class
`FaDuotoneIcon` needs to be used. It allows to set the primary and secondary colors
for the icon. If primary and / or secondary color are not defined, they will default
 to the standard `IconTheme` color. Please be aware that only duotone style icons
 can be passed to this class.
 

```dart
FaDuotoneIcon(
  FontAwesomeIcons.duotoneAbacus,
  primaryColor: Colors.black.withOpacity(.4),
  secondaryColor: Colors.black,
);
```

## Contributors

  - Brian Egan
  - Phil Plante
  - Michael Spiss
