import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globout/common/widgets/user_avatar_widget.dart';
import 'package:globout/features/auth/presentation/providers/auth_form_model_provider.dart';
import 'package:globout/features/auth/presentation/views/update_profile/widgets/image_picker_widget.dart';
import 'package:globout/util/resource/r.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({
    super.key,
  });

  void _showImagePickerSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      backgroundColor: R.colors.white_FFF5F5F5,
      builder: (context) {
        return const ImagePickerWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Consumer(
          builder: (context, ref, _) {
            final authFormModel = ref.watch(authFormModelProvider);

            return CircleAvatar(
              radius: 72.r,
              backgroundColor: R.colors.white_FFF5F5F5,
              child: CircleAvatar(
                radius: 70.r,
                backgroundColor: R.colors.jetBlack_FF2E2E2E,
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: UserAvatarWidget(
                    radius: 56,
                    hasBorder: false,
                    fileImage: authFormModel.image,
                  ),
                ),
              ),
            );
          },
        ),
        GestureDetector(
          onTap: () => _showImagePickerSheet(context),
          child: SizedBox(
            height: 32.r,
            width: 32.r,
            child: SvgPicture.asset(R.svgs.CAMERA_ICON),
          ),
        )
      ],
    );
  }
}
