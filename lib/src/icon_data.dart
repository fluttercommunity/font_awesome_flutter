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

/// Icon data for a Font Awesome duotone icon.
///
/// Duotone icons consist of a primary and a secondary layer, rendered using
/// the FA v6/v7 ligature system. The OTF desktop font uses **name-based
/// ligatures**: typing `icon-name#` produces the primary glyph, and
/// `icon-name##` produces the secondary glyph. This is how the font's GSUB
/// table maps strings to the correct layer glyphs.
///
/// This class stores the icon's [codePoint] (for identification/equality) and
/// its [ligatureName] (the FA icon name used to trigger ligature substitution).
/// The glyph strings are computed at render time by [FaDuotoneIcon].
@immutable
final class FaDuotoneIconData {
  /// The icon's primary Unicode codepoint (e.g. `0xf52b` for door-open).
  ///
  /// Used for identification and equality. Not used directly for rendering
  /// — the name-based ligature system is used instead.
  final int codePoint;

  /// The Font Awesome icon name used to trigger OTF ligature substitution.
  ///
  /// For example, `'calendar-days'` produces:
  /// - Primary glyph: `'calendar-days#'`
  /// - Secondary glyph: `'calendar-days##'`
  final String ligatureName;

  /// The font family used to render this duotone icon.
  ///
  /// Defaults to `'FontAwesomeDuotone'` for classic duotone icons.
  /// Sharp duotone icons use `'FontAwesomeSharpDuotone'`.
  final String fontFamily;

  /// The package that provides the font asset.
  final String fontPackage;

  /// Creates a duotone icon data with the given [codePoint] and
  /// [ligatureName].
  ///
  /// [fontFamily] defaults to `'FontAwesomeDuotone'`.
  /// [fontPackage] defaults to `'font_awesome_flutter'`.
  const FaDuotoneIconData(
    this.codePoint, {
    required this.ligatureName,
    this.fontFamily = 'FontAwesomeDuotone',
    this.fontPackage = 'font_awesome_flutter',
  });

  /// The primary layer glyph string.
  ///
  /// Uses the OTF name-based ligature: `icon-name#` triggers the font's
  /// GSUB substitution to produce the primary (foreground) glyph.
  String get primaryGlyph => '$ligatureName#';

  /// The secondary layer glyph string.
  ///
  /// Uses the OTF name-based ligature: `icon-name##` triggers the font's
  /// GSUB substitution to produce the secondary (background) glyph.
  String get secondaryGlyph => '$ligatureName##';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FaDuotoneIconData &&
        other.codePoint == codePoint &&
        other.fontFamily == fontFamily;
  }

  @override
  int get hashCode => Object.hash(codePoint, fontFamily);

  @override
  String toString() =>
      'FaDuotoneIconData(codePoint: 0x${codePoint.toRadixString(16)}, '
      'ligatureName: $ligatureName, fontFamily: $fontFamily)';
}
