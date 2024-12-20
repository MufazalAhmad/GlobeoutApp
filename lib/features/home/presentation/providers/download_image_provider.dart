import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final downloadImageProvider =
    FutureProvider.family<Uint8List, String>((ref, args) async {
  try {
    final imageUrl = args;
    final File imageFile = await DefaultCacheManager().getSingleFile(imageUrl
            .isNotEmpty
        ? imageUrl
        : "https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes.png");
    final imageUint8List = await imageFile.readAsBytes();

    return imageUint8List;
  } catch (e) {
    throw "image not downloaded";
  }
});
