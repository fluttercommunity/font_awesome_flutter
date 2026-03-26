import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

import 'package:font_awesome_flutter/src/icon_data.dart';

/// A widget that renders a Font Awesome duotone icon.
///
/// Duotone icons have two layers — primary (foreground) and secondary
/// (background) — each with independently controllable color and opacity.
///
/// This widget bypasses Flutter's [Icon] / [IconData] pipeline and instead
/// stacks two [RichText] widgets that render glyphs from the duotone OTF font.
/// The secondary layer triggers an OpenType ligature substitution by repeating
/// the icon's codepoint twice (the FA v6/v7 encoding scheme).
///
/// The duotone font must be registered as a regular [FontFamily] in
/// `pubspec.yaml` (not as an icon font) so that Flutter's icon tree-shaker
/// leaves it untouched.
///
/// {@tool snippet}
/// ```dart
/// FaDuotoneIcon(FontAwesomeDuotoneIcons.doorOpen, size: 32)
/// ```
/// {@end-tool}
///
/// {@tool snippet}
/// ```dart
/// FaDuotoneIcon(
///   FontAwesomeDuotoneIcons.cat,
///   size: 48,
///   primaryColor: Colors.deepPurple,
///   secondaryColor: Colors.amber,
///   secondaryOpacity: 0.6,
/// )
/// ```
/// {@end-tool}
class FaDuotoneIcon extends StatelessWidget {
  /// Creates a duotone icon widget.
  ///
  /// The [icon] parameter must not be null.
  const FaDuotoneIcon(
    this.icon, {
    super.key,
    this.size,
    this.primaryColor,
    this.secondaryColor,
    this.primaryOpacity = 1.0,
    this.secondaryOpacity = 0.4,
    this.swapOpacity = false,
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    this.shadows,
    this.semanticLabel,
    this.textDirection,
    this.applyTextScaling,
    this.blendMode,
    this.fontWeight,
  });

  /// The duotone icon to display.
  final FaDuotoneIconData icon;

  /// The size of the icon in logical pixels.
  ///
  /// Defaults to the current [IconTheme] size, or 24.0 if no theme is set.
  final double? size;

  /// Color for the primary (foreground) layer.
  ///
  /// Defaults to the current [IconTheme] color, or black.
  final Color? primaryColor;

  /// Color for the secondary (background) layer.
  ///
  /// Defaults to [primaryColor].
  final Color? secondaryColor;

  /// Opacity of the primary layer (`0.0`–`1.0`).
  ///
  /// Defaults to `1.0`.
  final double primaryOpacity;

  /// Opacity of the secondary layer (`0.0`–`1.0`).
  ///
  /// Defaults to `0.4` (matching Font Awesome's default secondary opacity).
  final double secondaryOpacity;

  /// When true, swaps the opacity values between layers.
  ///
  /// The primary layer gets [secondaryOpacity] and the secondary layer gets
  /// [primaryOpacity]. This mirrors Font Awesome's `fa-swap-opacity` class.
  final bool swapOpacity;

  /// The fill level for variable fonts (`FILL` axis).
  ///
  /// Defaults to the current [IconTheme] fill.
  final double? fill;

  /// The stroke weight for variable fonts (`wght` axis).
  ///
  /// Defaults to the current [IconTheme] weight.
  final double? weight;

  /// The grade (fineness of stroke) for variable fonts (`GRAD` axis).
  ///
  /// Defaults to the current [IconTheme] grade.
  final double? grade;

  /// The optical size for variable fonts (`opsz` axis).
  ///
  /// Defaults to the current [IconTheme] optical size.
  final double? opticalSize;

  /// A list of [Shadow]s to paint beneath the icon.
  ///
  /// Defaults to the current [IconTheme] shadows.
  final List<Shadow>? shadows;

  /// Semantic label for accessibility.
  ///
  /// This is announced by screen readers in place of the icon content.
  final String? semanticLabel;

  /// The text direction to use for rendering the icon.
  ///
  /// Defaults to the ambient [Directionality].
  final TextDirection? textDirection;

  /// Whether to scale the icon size using the text scaler.
  ///
  /// Defaults to the current [IconTheme] setting, or `false`.
  final bool? applyTextScaling;

  /// The blend mode applied to the icon.
  ///
  /// When set, the icon is painted using a [Paint] foreground with this
  /// blend mode instead of a plain color.
  final ui.BlendMode? blendMode;

  /// The font weight to use when rendering the icon glyphs.
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    assert(
      textDirection != null || debugCheckHasDirectionality(context),
    );
    final TextDirection resolvedTextDirection =
        textDirection ?? Directionality.of(context);

    final IconThemeData iconTheme = IconTheme.of(context);

    final bool resolvedApplyTextScaling =
        applyTextScaling ?? iconTheme.applyTextScaling ?? false;

    final double tentativeIconSize =
        size ?? iconTheme.size ?? kDefaultFontSize;

    final double iconSize = resolvedApplyTextScaling
        ? MediaQuery.textScalerOf(context).scale(tentativeIconSize)
        : tentativeIconSize;

    final double? iconFill = fill ?? iconTheme.fill;
    final double? iconWeight = weight ?? iconTheme.weight;
    final double? iconGrade = grade ?? iconTheme.grade;
    final double? iconOpticalSize = opticalSize ?? iconTheme.opticalSize;
    final List<Shadow>? iconShadows = shadows ?? iconTheme.shadows;

    final double themeOpacity = iconTheme.opacity ?? 1.0;

    final Color defaultColor =
        primaryColor ?? iconTheme.color ?? const Color(0xFF000000);
    final Color secColor = secondaryColor ?? defaultColor;

    final double primOpacity =
        swapOpacity ? secondaryOpacity : primaryOpacity;
    final double secOpacity =
        swapOpacity ? primaryOpacity : secondaryOpacity;

    Widget iconStack = SizedBox(
      width: iconSize,
      height: iconSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Secondary layer (renders behind primary)
          _buildLayer(
            glyph: icon.secondaryGlyph,
            color: secColor,
            opacity: secOpacity * themeOpacity,
            iconSize: iconSize,
            textDirection: resolvedTextDirection,
            iconFill: iconFill,
            iconWeight: iconWeight,
            iconGrade: iconGrade,
            iconOpticalSize: iconOpticalSize,
            iconShadows: iconShadows,
          ),
          // Primary layer (renders in front)
          _buildLayer(
            glyph: icon.primaryGlyph,
            color: defaultColor,
            opacity: primOpacity * themeOpacity,
            iconSize: iconSize,
            textDirection: resolvedTextDirection,
            iconFill: iconFill,
            iconWeight: iconWeight,
            iconGrade: iconGrade,
            iconOpticalSize: iconOpticalSize,
            iconShadows: iconShadows,
          ),
        ],
      ),
    );

    return Semantics(
      label: semanticLabel,
      child: ExcludeSemantics(child: iconStack),
    );
  }

  Widget _buildLayer({
    required String glyph,
    required Color color,
    required double opacity,
    required double iconSize,
    required TextDirection textDirection,
    required double? iconFill,
    required double? iconWeight,
    required double? iconGrade,
    required double? iconOpticalSize,
    required List<Shadow>? iconShadows,
  }) {
    Color? layerColor = color.withValues(alpha: color.a * opacity);
    Paint? foreground;

    if (blendMode != null) {
      foreground = Paint()
        ..blendMode = blendMode!
        ..color = layerColor;
      layerColor = null;
    }

    return RichText(
      overflow: TextOverflow.visible,
      textDirection: textDirection,
      text: TextSpan(
        text: glyph,
        style: TextStyle(
          fontVariations: <FontVariation>[
            if (iconFill != null) FontVariation('FILL', iconFill),
            if (iconWeight != null) FontVariation('wght', iconWeight),
            if (iconGrade != null) FontVariation('GRAD', iconGrade),
            if (iconOpticalSize != null)
              FontVariation('opsz', iconOpticalSize),
          ],
          inherit: false,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          fontSize: iconSize,
          color: layerColor,
          fontWeight: fontWeight,
          fontFamilyFallback: const <String>[],
          shadows: iconShadows,
          decoration: TextDecoration.none,
          height: 1.0,
          leadingDistribution: TextLeadingDistribution.even,
          foreground: foreground,
        ),
      ),
      softWrap: false,
    );
  }
}
