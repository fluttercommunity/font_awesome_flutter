## 8.6.0
  * Upgrade to Font Awesome Icons 5.11.2
  * Add `values` array that lists all icons.
  * Add `final` keyword where possible.
  * Set minimal Dart SDK version to v2.2.2

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
