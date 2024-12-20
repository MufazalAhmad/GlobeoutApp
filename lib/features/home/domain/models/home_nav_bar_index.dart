import 'package:globout/util/resource/r.dart';

enum HomeNavBarIndex {
  community,
  account;

  bool get isCommunity => this == HomeNavBarIndex.community;
  bool get isAccount => this == HomeNavBarIndex.account;

  String get name {
    if (isCommunity) {
      return "Community";
    } else if (isAccount) {
      return "Account";
    }
    return "";
  }

  String get image {
    if (isCommunity) {
      return R.svgs.COMMUNITY;
    } else if (isAccount) {
      return R.svgs.ACCOUNT;
    }
    return "";
  }
}
