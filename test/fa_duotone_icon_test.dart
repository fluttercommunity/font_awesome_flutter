import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/src/fa_duotone_icon.dart';

void main() {
  testWidgets('Colors are in the correct order', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: FaDuotoneIcon(
          IconDataDuotone(
            0x01,
            secondary: IconDataDuotone(0x02),
          ),
          primaryColor: Colors.red,
          secondaryColor: Colors.amber,
        ),
      ),
    );

    final FaIcon primary = tester.widget(find.byKey(const Key("primaryGlyph")));
    final FaIcon secondary =
        tester.widget(find.byKey(const Key("secondaryGlyph")));
    expect(primary.color, Colors.red);
    expect(secondary.color, Colors.amber);
  });

  testWidgets('Icons are in the correct order', (WidgetTester tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: FaDuotoneIcon(
          IconDataDuotone(
            0x01,
            secondary: IconDataDuotone(0x02),
          ),
        ),
      ),
    );

    final FaIcon primary = tester.widget(find.byKey(const Key("primaryGlyph")));
    final FaIcon secondary =
        tester.widget(find.byKey(const Key("secondaryGlyph")));
    expect(primary.icon!.codePoint, 0x01);
    expect(secondary.icon!.codePoint, 0x02);
  });
}
