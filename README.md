# font_awesome_flutter

The [Font Awesome](http://fontawesome.io/icons/) Icon pack available as set of Flutter Icons.

Based on Font Awesome 5.5. Includes all free icons:

  * Regular
  * Solid
  * Brands

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
  font_awesome_flutter: <latest_version>
```

## Usage

```dart
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return new IconButton(
      // Use the FontAwesomeIcons class for the IconData
      icon: new Icon(FontAwesomeIcons.gamepad), 
      onPressed: () { print("Pressed"); }
     );
  }
}
```

## Example

View the Flutter app in the `example` directory to see all the available `FontAwesomeIcons`.

## Pro icons

If you bought Font Awesome Pro icons, you can import them here. 

:exclamation: By importing Pro icons you acknowledge that it is your obligation to keep these files private. This includes **not** uploading your package to GitHub or other public file sharing services.

- Download and add the light TTF to your project (for example, under `fonts/fa-light-300.ttf`)
- Add the follow to your `pubspec.yaml`:
    ```yaml
    flutter:
      fonts:
        - family: FontAwesomeLight
          fonts:
            - asset: fonts/fa-light-300.ttf
              weight: 300
  
    ```
    > The `family` and `weight` fields must not change. Change `asset` to where the font is located.
- Use the light icons by using `FontAwesomeIconsPro('myPackageName')`
    > It is recommended to store one global version for your app, by putting the follow somewhere:
    > ```dart
    > final lightIcons = FontAwesomeIconsPro('myPackageName');
    > ```

If you do not have the Pro fonts added, the Pro icons will not work.

## Contributors

  - Brian Egan
  - Phil Plante
  - Michael Spiss
  - Charles Crete
