library;

import 'package:flutter/widgets.dart';

/// [IconData] for a font awesome brand icon from a code point
///
/// Code points can be obtained from fontawesome.com
class IconDataBrands extends IconData {
  const IconDataBrands(super.codePoint)
      : super(
          fontFamily: 'FontAwesomeBrands',
          fontPackage: 'font_awesome_flutter',
        );
}

/// [IconData] for a font awesome solid icon from a code point
///
/// Code points can be obtained from fontawesome.com
class IconDataSolid extends IconData {
  const IconDataSolid(super.codePoint)
      : super(
          fontFamily: 'FontAwesomeSolid',
          fontPackage: 'font_awesome_flutter',
        );
}

/// [IconData] for a font awesome regular icon from a code point
///
/// Code points can be obtained from fontawesome.com
class IconDataRegular extends IconData {
  const IconDataRegular(super.codePoint)
      : super(
          fontFamily: 'FontAwesomeRegular',
          fontPackage: 'font_awesome_flutter',
        );
}

/// [IconData] for a font awesome light icon from a code point. Only works if
/// light icons (font awesome pro) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataLight extends IconData {
  const IconDataLight(super.codePoint)
      : super(
          fontFamily: 'FontAwesomeLight',
          fontPackage: 'font_awesome_flutter',
        );
}

/// [IconData] for a font awesome duotone icon from a code point. Only works if
/// duotone icons (font awesome pro) have been installed.
///
/// Code points can be obtained from fontawesome.com. Each duotone icon consists
/// of a primary [codePoint] and a [secondary].
class IconDataDuotone extends IconData {
  /// Secondary glyph of the duotone icon
  ///
  /// Due to tree-shaking restraints [secondary] cannot be the codepoint itself,
  /// but has to be an [IconData] object.
  final IconData? secondary;

  const IconDataDuotone(super.codePoint, {this.secondary})
      : super(
          fontFamily: 'FontAwesomeDuotone',
          fontPackage: 'font_awesome_flutter',
        );
}

/// [IconData] for a font awesome thin icon from a code point. Only works if
/// thin icons (font awesome pro, v6+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataThin extends IconData {
  const IconDataThin(super.codePoint)
      : super(
          fontFamily: 'FontAwesomeThin',
          fontPackage: 'font_awesome_flutter',
        );
}

/// [IconData] for a font awesome sharp thin icon from a code point. Only works if
/// thin icons (font awesome pro, v6+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataSharpThin extends IconData {
  const IconDataSharpThin(super.codePoint)
      : super(
          fontFamily: 'FontAwesomeSharpThin',
          fontPackage: 'font_awesome_flutter',
        );
}

/// [IconData] for a font awesome sharp light icon from a code point. Only works if
/// thin icons (font awesome pro, v6+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataSharpLight extends IconData {
  const IconDataSharpLight(super.codePoint)
      : super(
          fontFamily: 'FontAwesomeSharpLight',
          fontPackage: 'font_awesome_flutter',
        );
}

/// [IconData] for a font awesome sharp regular icon from a code point. Only works if
/// thin icons (font awesome pro, v6+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataSharpRegular extends IconData {
  const IconDataSharpRegular(super.codePoint)
      : super(
          fontFamily: 'FontAwesomeSharpRegular',
          fontPackage: 'font_awesome_flutter',
        );
}

/// [IconData] for a font awesome sharp solid icon from a code point. Only works if
/// thin icons (font awesome pro, v6+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataSharpSolid extends IconData {
  const IconDataSharpSolid(super.codePoint)
      : super(
          fontFamily: 'FontAwesomeSharpSolid',
          fontPackage: 'font_awesome_flutter',
        );
}
