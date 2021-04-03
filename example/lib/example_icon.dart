import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExampleIcon implements Comparable {
  final IconData? iconData;
  final IconDataDuotone? duotoneIconData;
  final String title;

  ExampleIcon(this.iconData, this.duotoneIconData, this.title);

  @override
  String toString() => 'IconDefinition{iconData: $iconData, title: $title}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExampleIcon &&
          runtimeType == other.runtimeType &&
          iconData == other.iconData &&
          duotoneIconData == other.duotoneIconData &&
          title == other.title;

  @override
  int get hashCode => iconData.hashCode ^ title.hashCode;

  @override
  int compareTo(other) => title.compareTo(other.title);
}
