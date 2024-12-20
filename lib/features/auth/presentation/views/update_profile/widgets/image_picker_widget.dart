import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/features/auth/presentation/providers/auth_form_model_provider.dart';
import 'package:globout/helpers/image_picker/usecases/pick_camera_image_usecase.dart';
import 'package:globout/helpers/image_picker/usecases/pick_gallery_image_usecase.dart';
import 'package:globout/infrastructure/usecase_input.dart';
import 'package:globout/util/di/di.dart';
import 'package:globout/util/resource/r.dart';
import 'package:go_router/go_router.dart';

class ImagePickerWidget extends ConsumerStatefulWidget {
  const ImagePickerWidget({
    super.key,
  });

  @override
  ConsumerState<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends ConsumerState<ImagePickerWidget> {
  Future<void> _pickCameraImage(BuildContext context) async {
    final pickCameraImageUsecase = sl<PickCameraImageUsecase>();
    final image = await pickCameraImageUsecase(NoInput());

    ref.read(authFormModelProvider.notifier).setProfileImage(image);

    if (context.mounted) GoRouter.of(context).pop();
  }

  Future<void> _pickGalleryImage(BuildContext context) async {
    final pickGalleryImageUsecase = sl<PickGalleryImageUsecase>();
    final image = await pickGalleryImageUsecase(NoInput());

    ref.read(authFormModelProvider.notifier).setProfileImage(image);

    if (context.mounted) GoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(22.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// [Pick Image from Camera]
          ListTile(
            onTap: () => _pickCameraImage(context),
            leading: Icon(
              Icons.photo_camera,
              size: 24.r,
            ),
            title: Text(
              "Camera",
              style: TextStyle(
                color: R.colors.grey_FF868685,
                fontSize: 16.sp,
              ),
            ),
            trailing: Icon(
              Icons.chevron_right,
              size: 24.sp,
            ),
          ),

          /// [Pick Image from Gallery]
          ListTile(
            onTap: () => _pickGalleryImage(context),
            leading: Icon(
              Icons.photo,
              size: 24.r,
            ),
            title: Text(
              "Gallery",
              style: TextStyle(color: R.colors.grey_FF868685, fontSize: 16.sp),
            ),
            trailing: Icon(
              Icons.chevron_right,
              size: 24.sp,
            ),
          )
        ],
      ),
    );
  }
}
