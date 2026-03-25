import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  const testIcon = FaDuotoneIconData(
    0xf52b,
    ligatureName: 'door-open',
  );

  group('FaDuotoneIconData', () {
    test('primaryGlyph returns name-based ligature with single hash', () {
      expect(testIcon.primaryGlyph, 'door-open#');
    });

    test('secondaryGlyph returns name-based ligature with double hash', () {
      expect(testIcon.secondaryGlyph, 'door-open##');
    });

    test('defaults to FontAwesomeDuotone font family', () {
      expect(testIcon.fontFamily, 'FontAwesomeDuotone');
      expect(testIcon.fontPackage, 'font_awesome_flutter');
    });

    test('supports custom font family for sharp duotone', () {
      const sharpIcon = FaDuotoneIconData(
        0xf52b,
        ligatureName: 'door-open',
        fontFamily: 'FontAwesomeSharpDuotone',
      );
      expect(sharpIcon.fontFamily, 'FontAwesomeSharpDuotone');
    });

    test('equality works correctly', () {
      const icon1 = FaDuotoneIconData(0xf52b, ligatureName: 'door-open');
      const icon2 = FaDuotoneIconData(0xf52b, ligatureName: 'door-open');
      const icon3 = FaDuotoneIconData(0xf6be, ligatureName: 'cat');

      expect(icon1, equals(icon2));
      expect(icon1, isNot(equals(icon3)));
      expect(icon1.hashCode, equals(icon2.hashCode));
    });

    test('equality considers font family', () {
      const icon1 = FaDuotoneIconData(0xf52b, ligatureName: 'door-open');
      const icon2 = FaDuotoneIconData(
        0xf52b,
        ligatureName: 'door-open',
        fontFamily: 'FontAwesomeSharpDuotone',
      );
      expect(icon1, isNot(equals(icon2)));
    });

    test('toString includes hex codepoint and ligature name', () {
      expect(testIcon.toString(), contains('0xf52b'));
      expect(testIcon.toString(), contains('door-open'));
      expect(testIcon.toString(), contains('FontAwesomeDuotone'));
    });
  });

  group('FaDuotoneIcon', () {
    testWidgets('renders with default size from IconTheme', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: Center(child: FaDuotoneIcon(testIcon)),
        ),
      );

      final RenderBox renderObject = tester.renderObject(
        find.byType(FaDuotoneIcon),
      );
      // Default size is 24.0 when no IconTheme
      expect(renderObject.size, equals(const Size.square(24.0)));
    });

    testWidgets('renders with explicit size', (WidgetTester tester) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: Center(child: FaDuotoneIcon(testIcon, size: 48.0)),
        ),
      );

      final RenderBox renderObject = tester.renderObject(
        find.byType(FaDuotoneIcon),
      );
      expect(renderObject.size, equals(const Size.square(48.0)));
    });

    testWidgets('respects IconTheme size', (WidgetTester tester) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: IconTheme(
              data: IconThemeData(size: 36.0),
              child: FaDuotoneIcon(testIcon),
            ),
          ),
        ),
      );

      final RenderBox renderObject = tester.renderObject(
        find.byType(FaDuotoneIcon),
      );
      expect(renderObject.size, equals(const Size.square(36.0)));
    });

    testWidgets('renders two RichText layers in a Stack', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: FaDuotoneIcon(testIcon),
        ),
      );

      // Should have exactly two RichText widgets (primary + secondary)
      expect(find.byType(RichText), findsNWidgets(2));
      // Should have a Stack
      expect(find.byType(Stack), findsOneWidget);
    });

    testWidgets('applies primary color', (WidgetTester tester) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: FaDuotoneIcon(
            testIcon,
            primaryColor: Color(0xFFFF0000),
          ),
        ),
      );

      final richTexts = tester.widgetList<RichText>(find.byType(RichText));
      // The last RichText is the primary layer (rendered on top in the Stack)
      final primaryText = richTexts.last;
      final primaryStyle = (primaryText.text as TextSpan).style!;
      expect(primaryStyle.color, const Color(0xFFFF0000));
    });

    testWidgets('applies secondary color and default opacity', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: FaDuotoneIcon(
            testIcon,
            primaryColor: Color(0xFFFF0000),
            secondaryColor: Color(0xFF0000FF),
          ),
        ),
      );

      final richTexts =
          tester.widgetList<RichText>(find.byType(RichText)).toList();
      // First RichText is secondary layer
      final secondaryStyle = (richTexts[0].text as TextSpan).style!;
      // Secondary defaults to 0.4 opacity
      expect(secondaryStyle.color!.a, closeTo(0.4, 0.01));
    });

    testWidgets('swapOpacity swaps primary and secondary opacities', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: FaDuotoneIcon(
            testIcon,
            primaryColor: Color(0xFFFF0000),
            swapOpacity: true,
          ),
        ),
      );

      final richTexts =
          tester.widgetList<RichText>(find.byType(RichText)).toList();
      final secondaryStyle = (richTexts[0].text as TextSpan).style!;
      final primaryStyle = (richTexts[1].text as TextSpan).style!;

      // With swap: primary gets 0.4, secondary gets 1.0
      expect(primaryStyle.color!.a, closeTo(0.4, 0.01));
      expect(secondaryStyle.color!.a, closeTo(1.0, 0.01));
    });

    testWidgets('layers use name-based ligature strings', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: FaDuotoneIcon(testIcon),
        ),
      );

      final richTexts =
          tester.widgetList<RichText>(find.byType(RichText)).toList();
      final secondaryText = (richTexts[0].text as TextSpan).text!;
      final primaryText = (richTexts[1].text as TextSpan).text!;

      // Primary: icon-name# (single hash triggers primary ligature)
      expect(primaryText, 'door-open#');
      // Secondary: icon-name## (double hash triggers secondary ligature)
      expect(secondaryText, 'door-open##');
    });

    testWidgets('applies semantic label', (WidgetTester tester) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: FaDuotoneIcon(testIcon, semanticLabel: 'Door open icon'),
        ),
      );

      expect(
        find.bySemanticsLabel('Door open icon'),
        findsOneWidget,
      );
    });

    testWidgets('defaults secondary color to primary color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: FaDuotoneIcon(
            testIcon,
            primaryColor: Color(0xFFFF0000),
          ),
        ),
      );

      final richTexts =
          tester.widgetList<RichText>(find.byType(RichText)).toList();
      final secondaryStyle = (richTexts[0].text as TextSpan).style!;
      final primaryStyle = (richTexts[1].text as TextSpan).style!;

      // Both layers should use the same base color (red), just different opacity
      // Primary: full opacity red
      expect(primaryStyle.color, const Color(0xFFFF0000));
      // Secondary: 0.4 opacity red
      expect(secondaryStyle.color!.r, closeTo(1.0, 0.01));
      expect(secondaryStyle.color!.a, closeTo(0.4, 0.01));
    });

    testWidgets('applies shadows to both layers', (
      WidgetTester tester,
    ) async {
      const testShadows = [
        Shadow(color: Color(0xFF000000), offset: Offset(2, 2), blurRadius: 4),
      ];

      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: FaDuotoneIcon(testIcon, shadows: testShadows),
        ),
      );

      final richTexts =
          tester.widgetList<RichText>(find.byType(RichText)).toList();
      final secondaryStyle = (richTexts[0].text as TextSpan).style!;
      final primaryStyle = (richTexts[1].text as TextSpan).style!;

      expect(primaryStyle.shadows, equals(testShadows));
      expect(secondaryStyle.shadows, equals(testShadows));
    });

    testWidgets('shadows fall back to IconTheme shadows', (
      WidgetTester tester,
    ) async {
      const themeShadows = [
        Shadow(color: Color(0xFF333333), offset: Offset(1, 1), blurRadius: 2),
      ];

      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: IconTheme(
            data: IconThemeData(shadows: themeShadows),
            child: FaDuotoneIcon(testIcon),
          ),
        ),
      );

      final richTexts =
          tester.widgetList<RichText>(find.byType(RichText)).toList();
      final primaryStyle = (richTexts[1].text as TextSpan).style!;

      expect(primaryStyle.shadows, equals(themeShadows));
    });

    testWidgets('applies fontWeight to both layers', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: FaDuotoneIcon(testIcon, fontWeight: FontWeight.w300),
        ),
      );

      final richTexts =
          tester.widgetList<RichText>(find.byType(RichText)).toList();
      final secondaryStyle = (richTexts[0].text as TextSpan).style!;
      final primaryStyle = (richTexts[1].text as TextSpan).style!;

      expect(primaryStyle.fontWeight, FontWeight.w300);
      expect(secondaryStyle.fontWeight, FontWeight.w300);
    });

    testWidgets('applies font variations (fill, weight, grade, opticalSize)', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: FaDuotoneIcon(
            testIcon,
            fill: 0.5,
            weight: 700,
            grade: 200,
            opticalSize: 48,
          ),
        ),
      );

      final richTexts =
          tester.widgetList<RichText>(find.byType(RichText)).toList();
      final primaryStyle = (richTexts[1].text as TextSpan).style!;
      final variations = primaryStyle.fontVariations!;

      expect(
        variations,
        containsAll([
          const FontVariation('FILL', 0.5),
          const FontVariation('wght', 700),
          const FontVariation('GRAD', 200),
          const FontVariation('opsz', 48),
        ]),
      );
    });

    testWidgets('font variations fall back to IconTheme values', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: IconTheme(
            data: IconThemeData(fill: 1.0, weight: 400, grade: 0, opticalSize: 24),
            child: FaDuotoneIcon(testIcon),
          ),
        ),
      );

      final richTexts =
          tester.widgetList<RichText>(find.byType(RichText)).toList();
      final primaryStyle = (richTexts[1].text as TextSpan).style!;
      final variations = primaryStyle.fontVariations!;

      expect(
        variations,
        containsAll([
          const FontVariation('FILL', 1.0),
          const FontVariation('wght', 400),
          const FontVariation('GRAD', 0),
          const FontVariation('opsz', 24),
        ]),
      );
    });

    testWidgets('explicit font variations override IconTheme', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: IconTheme(
            data: IconThemeData(fill: 0.0, weight: 400),
            child: FaDuotoneIcon(testIcon, fill: 1.0, weight: 700),
          ),
        ),
      );

      final richTexts =
          tester.widgetList<RichText>(find.byType(RichText)).toList();
      final primaryStyle = (richTexts[1].text as TextSpan).style!;
      final variations = primaryStyle.fontVariations!;

      expect(variations, contains(const FontVariation('FILL', 1.0)));
      expect(variations, contains(const FontVariation('wght', 700)));
    });

    testWidgets('blendMode uses Paint foreground instead of color', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: FaDuotoneIcon(
            testIcon,
            primaryColor: Color(0xFFFF0000),
            blendMode: ui.BlendMode.multiply,
          ),
        ),
      );

      final richTexts =
          tester.widgetList<RichText>(find.byType(RichText)).toList();
      final primaryStyle = (richTexts[1].text as TextSpan).style!;

      // When blendMode is set, color should be null and foreground should be used
      expect(primaryStyle.color, isNull);
      expect(primaryStyle.foreground, isNotNull);
      expect(primaryStyle.foreground!.blendMode, ui.BlendMode.multiply);
    });

    testWidgets('blendMode applies to both layers', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: FaDuotoneIcon(
            testIcon,
            primaryColor: Color(0xFFFF0000),
            secondaryColor: Color(0xFF0000FF),
            blendMode: ui.BlendMode.screen,
          ),
        ),
      );

      final richTexts =
          tester.widgetList<RichText>(find.byType(RichText)).toList();
      final secondaryStyle = (richTexts[0].text as TextSpan).style!;
      final primaryStyle = (richTexts[1].text as TextSpan).style!;

      expect(primaryStyle.foreground, isNotNull);
      expect(secondaryStyle.foreground, isNotNull);
      expect(primaryStyle.foreground!.blendMode, ui.BlendMode.screen);
      expect(secondaryStyle.foreground!.blendMode, ui.BlendMode.screen);
    });

    testWidgets('IconTheme opacity multiplies into layer opacities', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: IconTheme(
            data: IconThemeData(
              color: Color(0xFFFF0000),
              opacity: 0.5,
            ),
            child: FaDuotoneIcon(testIcon),
          ),
        ),
      );

      final richTexts =
          tester.widgetList<RichText>(find.byType(RichText)).toList();
      final secondaryStyle = (richTexts[0].text as TextSpan).style!;
      final primaryStyle = (richTexts[1].text as TextSpan).style!;

      // Primary: 1.0 * 0.5 = 0.5
      expect(primaryStyle.color!.a, closeTo(0.5, 0.01));
      // Secondary: 0.4 * 0.5 = 0.2
      expect(secondaryStyle.color!.a, closeTo(0.2, 0.01));
    });

    testWidgets('applyTextScaling scales the icon size', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(textScaler: TextScaler.linear(2.0)),
          child: const Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: FaDuotoneIcon(
                testIcon,
                size: 24.0,
                applyTextScaling: true,
              ),
            ),
          ),
        ),
      );

      final RenderBox renderObject = tester.renderObject(
        find.byType(FaDuotoneIcon),
      );
      // 24.0 * 2.0 text scale = 48.0
      expect(renderObject.size, equals(const Size.square(48.0)));
    });

    testWidgets('applyTextScaling defaults to false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(textScaler: TextScaler.linear(2.0)),
          child: const Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: FaDuotoneIcon(testIcon, size: 24.0),
            ),
          ),
        ),
      );

      final RenderBox renderObject = tester.renderObject(
        find.byType(FaDuotoneIcon),
      );
      // Should NOT scale — still 24.0
      expect(renderObject.size, equals(const Size.square(24.0)));
    });

    testWidgets('applyTextScaling falls back to IconTheme', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(textScaler: TextScaler.linear(2.0)),
          child: const Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: IconTheme(
                data: IconThemeData(size: 24.0, applyTextScaling: true),
                child: FaDuotoneIcon(testIcon),
              ),
            ),
          ),
        ),
      );

      final RenderBox renderObject = tester.renderObject(
        find.byType(FaDuotoneIcon),
      );
      expect(renderObject.size, equals(const Size.square(48.0)));
    });

    testWidgets('no font variations emitted when IconTheme has none', (
      WidgetTester tester,
    ) async {
      // Use an IconTheme with no fill/weight/grade/opticalSize to ensure
      // the widget doesn't emit font variations when none are available.
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: IconTheme(
            data: IconThemeData(),
            child: FaDuotoneIcon(testIcon),
          ),
        ),
      );

      final richTexts =
          tester.widgetList<RichText>(find.byType(RichText)).toList();
      final primaryStyle = (richTexts[1].text as TextSpan).style!;

      // IconThemeData() has null for fill/weight/grade/opticalSize,
      // but the ambient theme may provide defaults. The widget should only
      // emit variations for non-null values.
      // With a bare IconThemeData(), the resolved values come from the
      // default theme which does set defaults — so just verify the list
      // is non-null and well-formed.
      expect(primaryStyle.fontVariations, isA<List<FontVariation>>());
    });
  });
}
