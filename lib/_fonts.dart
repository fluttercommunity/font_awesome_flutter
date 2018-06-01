library font_awesome_flutter;

import 'package:flutter/widgets.dart';

class IconDataBrands extends IconData {
  const IconDataBrands(int codePoint)
      : super(
          codePoint,
          fontFamily: 'FontAwesomeBrands',
          fontPackage: 'font_awesome_flutter',
        );
}

class IconDataSolid extends IconData {
  const IconDataSolid(int codePoint)
      : super(
          codePoint,
          fontFamily: 'FontAwesomeSolid',
          fontPackage: 'font_awesome_flutter',
        );
}

class IconDataRegular extends IconData {
  const IconDataRegular(int codePoint)
      : super(
          codePoint,
          fontFamily: 'FontAwesomeRegular',
          fontPackage: 'font_awesome_flutter',
        );
}
