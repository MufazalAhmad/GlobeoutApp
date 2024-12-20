import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import 'image_picker_helper.dart';

@LazySingleton(as: ImagePickerHelper)
class ImagePickerHelperImpl implements ImagePickerHelper {
  final ImagePicker imagePicker = ImagePicker();
  @override
  Future<String> cameraImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) {
      throw ImageNotSelectedException();
    }
    return image.path;
  }

  @override
  Future<String> galleryImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      throw ImageNotSelectedException();
    }
    return image.path;
  }
}

class ImageNotSelectedException implements Exception {}
