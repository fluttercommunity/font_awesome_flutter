class CustomIconTransferObject {
  final List<String> changes;
  final List<String> ligatures;
  final SearchObject search;
  final List<String> styles;
  final String unicode;
  final String label;
  final Map<String, SvgTransferObject> svg;
  final List<String> free;

  CustomIconTransferObject(
      {this.changes = const ['6.4.0'],
      this.ligatures = const [],
      this.search = const SearchObject(),
      this.styles = const ['custom'],
      required this.unicode,
      required this.label,
      required this.svg,
      this.free = const []});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> svgEntry = {};
    svg.forEach((key, value) {
      svgEntry[key] = value.toJson();
    });
    return {
      'changes': changes,
      'ligatures': ligatures,
      'search': search.toJson(),
      'styles': styles,
      'unicode': unicode,
      'label': label,
      'svg': svgEntry,
      'free': free,
    };
  }
}

class SearchObject {
  final List<String> terms;
  const SearchObject({this.terms = const []});
  factory SearchObject.fromJson(Map<String, dynamic> json) =>
      SearchObject(terms: (json['terms'] as List<dynamic>?)?.map((e) => e as String).toList() ?? []);
  Map<String, dynamic> toJson() => {'terms': terms};
}

class SvgTransferObject {
  SvgTransferObject(
      {required this.lastModified, required this.raw, required this.viewBox, required this.width, required this.height, required this.path});
  final int? lastModified;
  final String raw;
  final List<int> viewBox;
  final int width;
  final int height;
  final String path;

  factory SvgTransferObject.fromJson(Map<String, dynamic> json) => SvgTransferObject(
      lastModified: json['last_modified'],
      raw: json['raw'],
      viewBox: json['viewBox'],
      width: json['width'],
      height: json['height'],
      path: json['path']);

  Map<String, dynamic> toJson() => {
        'last_modified': lastModified,
        'raw': raw,
        'viewBox': viewBox,
        'width': width,
        'height': height,
        'path': path,
      };
}
