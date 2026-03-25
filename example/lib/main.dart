import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter_example/icons.dart';

void main() {
  runApp(const FontAwesomeGalleryApp());
}

class FontAwesomeGalleryApp extends StatelessWidget {
  const FontAwesomeGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Font Awesome Flutter Gallery',
      theme: ThemeData.light().copyWith(
        iconTheme: const IconThemeData(size: 36.0, color: Colors.black87),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
      ),
      home: const FontAwesomeGalleryHome(),
    );
  }
}

class FontAwesomeGalleryHome extends StatefulWidget {
  const FontAwesomeGalleryHome({super.key});

  @override
  State<StatefulWidget> createState() => FontAwesomeGalleryHomeState();
}

class FontAwesomeGalleryHomeState extends State<FontAwesomeGalleryHome> {
  var _searchTerm = "";
  var _isSearching = false;

  @override
  Widget build(BuildContext context) {
    final filteredIcons = icons
        .where((icon) =>
            _searchTerm.isEmpty ||
            icon.title.toLowerCase().contains(_searchTerm.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: _isSearching ? _searchBar(context) : _titleBar(),
      body: Scrollbar(
        thumbVisibility: kIsWeb,
        child: GridView.builder(
          itemCount: filteredIcons.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
          ),
          itemBuilder: (context, index) {
            final icon = filteredIcons[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Hero(
                            tag: icon,
                            child: FaIcon(
                              icon.iconData,
                              size: 100,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(tag: icon, child: FaIcon(icon.iconData)),
                  Container(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(icon.title),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar _titleBar() {
    return AppBar(
      title: const Text("Font Awesome Flutter Gallery"),
      actions: [
        IconButton(
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
            onPressed: () {
              ModalRoute.of(context)?.addLocalHistoryEntry(
                LocalHistoryEntry(
                  onRemove: () {
                    setState(() {
                      _searchTerm = "";
                      _isSearching = false;
                    });
                  },
                ),
              );

              setState(() {
                _isSearching = true;
              });
            })
      ],
    );
  }

  AppBar _searchBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.arrowLeft),
        onPressed: () {
          setState(
            () {
              Navigator.pop(context);
              _isSearching = false;
              _searchTerm = "";
            },
          );
        },
      ),
      title: TextField(
        onChanged: (text) => setState(() => _searchTerm = text),
        autofocus: true,
        style: const TextStyle(fontSize: 18.0),
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}

/// Showcase page demonstrating duotone icon rendering.
///
/// Duotone icons require the Font Awesome Pro duotone OTF font to be
/// registered in pubspec.yaml. The icons below use hardcoded codepoints
/// for demonstration purposes — in real usage, use the generated
/// [FontAwesomeDuotoneIcons] constants.
class DuotoneShowcasePage extends StatelessWidget {
  const DuotoneShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example duotone icons (FA Pro required)
    const doorOpen = FaDuotoneIconData(0xf52b, ligatureName: 'door-open');
    const cat = FaDuotoneIconData(0xf6be, ligatureName: 'cat');
    const userDoctor = FaDuotoneIconData(0xf0f0, ligatureName: 'user-doctor');

    return Scaffold(
      appBar: AppBar(title: const Text('Duotone Icons Showcase')),
      body: Center(
        child: Wrap(
          spacing: 32,
          runSpacing: 32,
          alignment: WrapAlignment.center,
          children: [
            // Simple usage — inherits theme color
            const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaDuotoneIcon(doorOpen, size: 48),
                SizedBox(height: 8),
                Text('Default'),
              ],
            ),
            // Custom two-tone colors
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaDuotoneIcon(
                  cat,
                  size: 48,
                  primaryColor: Colors.deepPurple,
                  secondaryColor: Colors.amber,
                  secondaryOpacity: 0.6,
                ),
                const SizedBox(height: 8),
                const Text('Custom colors'),
              ],
            ),
            // Swap opacity
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaDuotoneIcon(
                  userDoctor,
                  size: 48,
                  swapOpacity: true,
                  primaryColor: Colors.teal,
                ),
                const SizedBox(height: 8),
                const Text('Swapped opacity'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
