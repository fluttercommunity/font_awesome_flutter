# font_awesome_flutter

The [Font Awesome](https://fontawesome.com) Icon pack available as set of Flutter Icons.

## Installation

This requires two steps:

### Install the dependency

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
  font_awesome_flutter: 4.7.0    
```

### Install the font asset

In the `flutter:` section of your `pubspec.yaml`, add the following section:

```yaml
  fonts:
    - family: FontAwesome # Do not change!
      fonts:
        - asset: packages/font_awesome_flutter/fonts/fontawesome-webfont.woff
```

## Usage

```dart
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ... later in the build method

new IconButton(
  icon: new Icon(FontAwesomeIcons.gamepad), 
  onPressed: () { print("Pressed"); }
)
```

## Example

View the Flutter app in the `example` directory to see all the available `FontAwesomeIcons`.