import 'package:globout/util/resource/r.dart';

enum EventsViewType {
  map,
  list;

  bool get isMap => this == EventsViewType.map;
  bool get isList => this == EventsViewType.list;

  String get name {
    if (isMap) {
      return "Home";
    } else if (isList) {
      return "List";
    }
    return "";
  }

  String get image {
    if (isMap) {
      return R.svgs.EVENT_LIST_ICON;
    } else if (isList) {
      return R.svgs.EVENT_LIST_ICON;
    }
    return "";
  }
}
