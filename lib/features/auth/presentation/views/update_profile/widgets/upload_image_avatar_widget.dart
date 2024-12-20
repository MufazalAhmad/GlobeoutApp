import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:globout/features/auth/presentation/providers/auth_form_model_provider.dart';
import 'package:globout/util/resource/r.dart';

class UploadImageAvatarWidget extends StatelessWidget {
  const UploadImageAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final authFormModel = ref.watch(authFormModelProvider);

        return authFormModel.image != null && authFormModel.image!.isNotEmpty
            ? CircleAvatar(
                backgroundColor: R.colors.jetBlack_FF2E2E2E,
                radius: 32.r,
                child: CircleAvatar(
                  backgroundColor: R.colors.white_FFF5F5F5,
                  radius: 30.r,
                  backgroundImage: FileImage(
                    File(authFormModel.image!),
                  ),
                ),
              )
            : CircleAvatar(
                backgroundColor: R.colors.jetBlack_FF2E2E2E,
                radius: 32.r,
                child: CircleAvatar(
                  backgroundColor: R.colors.white_FFF5F5F5,
                  radius: 30.r,
                  child: SvgPicture.asset(R.svgs.IMAGE_ADD_PLACEHOLDER),
                ),
              );
      },
    );
  }
}
