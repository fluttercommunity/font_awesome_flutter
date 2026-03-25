import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Showcase of all duotone icon families and weight variants.
///
/// Run this page and take a screenshot for the PR.
/// Usage: navigate to this page from the example app, or set it as home.
class DuotoneShowcase extends StatelessWidget {
  const DuotoneShowcase({super.key});

  // Cat icon — codepoint 0xf6be
  static const _catSolid = FaDuotoneIconData(
    0xf6be,
    ligatureName: 'cat-space',
  );
  static const _catRegular = FaDuotoneIconData(
    0xf6be,
    ligatureName: 'cat-space',
    fontFamily: 'FontAwesomeDuotoneRegular',
  );
  static const _catLight = FaDuotoneIconData(
    0xf6be,
    ligatureName: 'cat-space',
    fontFamily: 'FontAwesomeDuotoneLight',
  );
  static const _catThin = FaDuotoneIconData(
    0xf6be,
    ligatureName: 'cat-space',
    fontFamily: 'FontAwesomeDuotoneThin',
  );
  static const _catSharpSolid = FaDuotoneIconData(
    0xf6be,
    ligatureName: 'cat-space',
    fontFamily: 'FontAwesomeSharpDuotone',
  );
  static const _catSharpRegular = FaDuotoneIconData(
    0xf6be,
    ligatureName: 'cat-space',
    fontFamily: 'FontAwesomeSharpDuotoneRegular',
  );
  static const _catSharpLight = FaDuotoneIconData(
    0xf6be,
    ligatureName: 'cat-space',
    fontFamily: 'FontAwesomeSharpDuotoneLight',
  );
  static const _catSharpThin = FaDuotoneIconData(
    0xf6be,
    ligatureName: 'cat-space',
    fontFamily: 'FontAwesomeSharpDuotoneThin',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Duotone Icon Variants'),
        backgroundColor: Colors.blueGrey.shade800,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber.shade300),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.amber.shade800, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Duotone icons require Font Awesome Pro duotone fonts. '
                      'If icons appear as blank squares, the required fonts '
                      'are not installed.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.amber.shade900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _sectionHeader('Classic Duotone'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _iconTile('Solid', _catSolid, Colors.indigo, Colors.indigo.shade200),
                _iconTile('Regular', _catRegular, Colors.indigo, Colors.indigo.shade200),
                _iconTile('Light', _catLight, Colors.indigo, Colors.indigo.shade200),
                _iconTile('Thin', _catThin, Colors.indigo, Colors.indigo.shade200),
              ],
            ),
            const SizedBox(height: 32),
            _sectionHeader('Sharp Duotone'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _iconTile('Solid', _catSharpSolid, Colors.teal, Colors.teal.shade200),
                _iconTile('Regular', _catSharpRegular, Colors.teal, Colors.teal.shade200),
                _iconTile('Light', _catSharpLight, Colors.teal, Colors.teal.shade200),
                _iconTile('Thin', _catSharpThin, Colors.teal, Colors.teal.shade200),
              ],
            ),
            const SizedBox(height: 32),
            _sectionHeader('Color & Opacity Examples'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _colorExample(
                  'Default\n(40% secondary)',
                  _catSolid,
                  Colors.blueGrey.shade800,
                  null,
                  1.0,
                  0.4,
                  false,
                ),
                _colorExample(
                  'Custom\ncolors',
                  _catSolid,
                  Colors.deepPurple,
                  Colors.amber,
                  1.0,
                  0.6,
                  false,
                ),
                _colorExample(
                  'Swapped\nopacity',
                  _catSolid,
                  Colors.red.shade700,
                  null,
                  1.0,
                  0.4,
                  true,
                ),
                _colorExample(
                  'Full\nopacity',
                  _catSolid,
                  Colors.green.shade800,
                  Colors.green.shade400,
                  1.0,
                  1.0,
                  false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }

  Widget _iconTile(
    String label,
    FaDuotoneIconData icon,
    Color primary,
    Color secondary,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: FaDuotoneIcon(
              icon,
              size: 40,
              primaryColor: primary,
              secondaryColor: secondary,
              secondaryOpacity: 0.4,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _colorExample(
    String label,
    FaDuotoneIconData icon,
    Color primary,
    Color? secondary,
    double primaryOpacity,
    double secondaryOpacity,
    bool swapOpacity,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: FaDuotoneIcon(
              icon,
              size: 40,
              primaryColor: primary,
              secondaryColor: secondary,
              primaryOpacity: primaryOpacity,
              secondaryOpacity: secondaryOpacity,
              swapOpacity: swapOpacity,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11, color: Colors.black54),
        ),
      ],
    );
  }
}
