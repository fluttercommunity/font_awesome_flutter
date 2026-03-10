import 'package:flutter/widgets.dart';

/// A wrapper for [IconData] to ensure type safety and correct rendering
/// with [FaIcon].
///
/// This class prevents usage of Font Awesome icons in the standard [Icon] widget,
/// which would result in incorrect rendering (clipping/misalignment) for
/// non-square icons.
@immutable
final class FaIconData {
  /// The underlying [IconData] for this font awesome icon.
  final IconData data;

  /// Creates a wrapper for the given [data].
  const FaIconData(this.data);

  /// The code point of the icon.
  int get codePoint => data.codePoint;

  /// The font family of the icon.
  String? get fontFamily => data.fontFamily;

  /// The font package of the icon.
  String? get fontPackage => data.fontPackage;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FaIconData && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() => 'FaIconData(data: $data)';
}

/// [FaIconData] for a font awesome duotone icon.
///
/// Duotone icons consist of a primary and a secondary layer.
@immutable
final class FaDuotoneIconData {
  /// The primary layer of the icon.
  final IconData primary;

  /// The secondary layer of the icon.
  final IconData secondary;

  /// Creates a duotone icon data.
  const FaDuotoneIconData({required this.primary, required this.secondary});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FaDuotoneIconData &&
        other.primary == primary &&
        other.secondary == secondary;
  }

  @override
  int get hashCode => Object.hash(primary, secondary);

  @override
  String toString() =>
      'FaDuotoneIconData(primary: $primary, secondary: $secondary)';
}

/// [IconData] for a font awesome chisel thin icon from a code point. Only works if
/// chisel icons (font awesome pro+, v7+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataChiselRegular extends IconData {
  const IconDataChiselRegular(super.codePoint)
    : super(
        fontFamily: 'FontAwesomeChiselRegular',
        fontPackage: 'font_awesome_flutter',
      );
}

/// [IconData] for a font awesome chisel solid icon from a code point. Only works if
/// chisel icons (font awesome pro+, v7+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataEtchSolid extends IconData {
  const IconDataEtchSolid(super.codePoint)
    : super(
        fontFamily: 'FontAwesomeEtchSolid',
        fontPackage: 'font_awesome_flutter',
      );
}

/// [IconData] for a font awesome notdog solid icon from a code point. Only works if
/// Notdog icons (font awesome pro+, v7+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataNotdogSolid extends IconData {
  const IconDataNotdogSolid(super.codePoint)
    : super(
        fontFamily: 'FontAwesomeNotdogSolid',
        fontPackage: 'font_awesome_flutter',
      );
}

/// [IconData] for a font awesome graphite solid icon from a code point. Only works if
/// graphite icons (font awesome pro+, v7+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataJellyRegular extends IconData {
  const IconDataJellyRegular(super.codePoint)
    : super(
        fontFamily: 'FontAwesomeJellyRegular',
        fontPackage: 'font_awesome_flutter',
      );
}

/// [IconData] for a font awesome graphite solid icon from a code point. Only works if
/// graphite icons (font awesome pro+, v7+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataJellyFillRegular extends IconData {
  const IconDataJellyFillRegular(super.codePoint)
    : super(
        fontFamily: 'FontAwesomeJellyFillRegular',
        fontPackage: 'font_awesome_flutter',
       );
}

/// [IconData] for a font awesome graphite solid icon from a code point. Only works if
/// graphite icons (font awesome pro+, v7+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataSlabRegular extends IconData {
  const IconDataSlabRegular(super.codePoint)
    : super(
        fontFamily: 'FontAwesomeSlabRegular',
        fontPackage: 'font_awesome_flutter',
      );
}

/// [IconData] for a font awesome graphite solid icon from a code point. Only works if
/// graphite icons (font awesome pro+, v7+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataSlabPressRegular extends IconData {
  const IconDataSlabPressRegular(super.codePoint)
    : super(
        fontFamily: 'FontAwesomeSlabPressRegular',
        fontPackage: 'font_awesome_flutter',
      );
}

/// [IconData] for a font awesome graphite solid icon from a code point. Only works if
/// graphite icons (font awesome pro+, v7+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataThumbprintLight extends IconData {
  const IconDataThumbprintLight(super.codePoint)
    : super(
        fontFamily: 'FontAwesomeThumbprintLight',
        fontPackage: 'font_awesome_flutter',
      );
}

/// [IconData] for a font awesome whiteboard semibold icon from a code point. Only works if
/// whiteboard icons (font awesome pro+, v7+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataWhiteboardSemibold extends IconData {
  const IconDataWhiteboardSemibold(super.codePoint)
    : super(
        fontFamily: 'FontAwesomeWhiteboardSemibold',
        fontPackage: 'font_awesome_flutter',
      );
}

/// [IconData] for a font awesome utility semibold icon from a code point. Only works if
/// utility icons (font awesome pro+, v7.1.0+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataUtilitySemibold extends IconData {
  const IconDataUtilitySemibold(super.codePoint)
    : super(
        fontFamily: 'FontAwesomeUtilitySemibold',
        fontPackage: 'font_awesome_flutter',
      );
}

/// [IconData] for a font awesome utility fill semibold icon from a code point. Only works if
/// utility fill icons (font awesome pro+, v7.1.0+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataUtilityFillSemibold extends IconData {
  const IconDataUtilityFillSemibold(super.codePoint)
    : super(
        fontFamily: 'FontAwesomeUtilityFillSemibold',
        fontPackage: 'font_awesome_flutter',
      );
}

/// [IconData] for a font awesome graphite thin icon from a code point. Only works if
/// graphite icons (font awesome pro+, v7.2.0+) have been installed.
///
/// Code points can be obtained from fontawesome.com
class IconDataGraphiteThin extends IconData {
  const IconDataGraphiteThin(super.codePoint)
    : super(
        fontFamily: 'FontAwesomeGraphiteThin',
        fontPackage: 'font_awesome_flutter',
      );
}
