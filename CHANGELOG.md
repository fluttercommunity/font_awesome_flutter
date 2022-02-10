## 10.0.0-beta2
Update to support 6.0.0 naming conventions
Ability to pull from FontAwesome API instead of icons.json

## 10.0.0-beta
* Fix #132 FaIcon not centered when used as prefix icon
* Fix linter warnings - thanks to @gslender!

This is a change with the goal to align `FaIcon` more like the standard `Icon` class.
However, this may impose breaking changes, which is why version 10.0.0 will stay a beta for a while. 

Should you notice something not working as it did before, which does not match the behaviour of `Icon`, please
open an issue on github!

## 9.2.0
* Upgrade to Font Awesome icons 5.15.4
* Equalize windows and linux tool scripts
* Reworked updater tool into a full-fledged configurator
  * Added support for ignoring styles
  * Added optional support for dynamic icon retrieval by name (thanks to @Mythar)
  * Fonts get enabled/disabled automatically based on availability and exclude list

## 9.1.0
* Add support for fa6's 360-degrees icon
* Fix #154 FaDuotoneIcon explicitly requires IconDataDuotone
* Use `dart format` instead of deprecated `dartfmt` in the updater
* Automatically enable duotone icons in the example if possible
* Upgrade to Font Awesome icons 5.15.3

Thanks to @amkuchta for his work and input

## 9.0.0
* Add support for null-safety

## 8.12.0
* Upgrade to Font Awesome icons 5.15.2
* Add support for font awesome 6's number icons

## 8.11.0
  * Add support for font awesome 6's thin icons

## 8.10.2
  * Fix missing keys in FaDuotoneIcon
  * Fix icon tree shaking build error for duotone icons

## 8.10.1
  * Update license file with MIT header
  * Update readme links

## 8.10.0
  * Fix #119: Inverted colors for duotone icons
  * Fix #122: Build failure due to missing glyphs in web fonts
  * Upgrade to Font Awesome icons 5.15.1

## 8.9.0
  * Upgrade to Font Awesome icons 5.15

## 8.8.1
  * Fix icon_data.dart not being accessible

## 8.8.0
  * Upgrade to Font Awesome Icons 5.13

## 8.7.0

  * Add `FaIcon` widget for Font Awesome Icons
  * Update `README` with FAQ

## 8.6.0
  * Move package to FlutterCommunity
  * Upgrade to Font Awesome Icons 5.12.1
  * Directions to support pro icons if you've purchased them (thanks @michaelspiss!)

## 8.5.0
  * Upgrade to Font Awesome Icons 5.9

## 8.4.0

  * FIX BAD BUILD - 8.3.0 had a problem with the update Script, please do not use!
  * Upgrade to Font Awesome Icons 5.7 
  
## 8.3.0

  * Upgrade to Font Awesome Icons 5.7

## 8.2.0

  * Upgrade to Font Awesome Icons 5.5
  
## 8.1.0

  * Upgrade to Font Awesome Icons 5.3.1

## 8.0.1

  * Fix documentation
  
## 8.0.0

  * Upgrade environment version constraint for Dart 2
  * Upgrade to font awesome icons 5.2.0

## 7.1.0

  * Upgrade to font awesome icons 5.1.0

## 7.0.0

* Renames:
  - All icons that end with capital-O (for outline) have been renamed. E.g. `addressBookO` has been renamed `addressBook` 
  - All solid icons have been renamed to `solidIconName`. E.g. `addressBook` renamed `solidAddressBook`
* Generate Icon pack based on JSON definition from source. Much easier upgrades / maintenance / consistency going forward! Big thanks to @pplante on Github for the contribution :)
* Move fonts into the `lib` folder.
  
## 6.0.0

* Update to Font Awesome Icons 5.0.2, which includes tons of new Icons!

## 5.0.0

* semver mistake: 4.7.3 should have been a major bump as it involves breaking changes.

## 4.7.3

* Simpler Install: Remove the need to specify the font in your own pubspec.yaml

## 4.7.2

* MOAR README updates

## 4.7.1

* README fix

## 4.7.0

* Expose Font Awesome 4.7.0 `woff` font asset. This was the smallest version of the font file that worked with Flutter. 
* Created `FontAwesomeIcons` class, which provides static access to all Font Awesome 4.7.0 Icons as `IconData`, similar to Flutter's built-in `Icons` class.
* Created a Gallery App that can be used to view all provided icons
* Created README with installation instructions
* Added LICENSE.md file
