import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/common/widgets/radius_button.dart';
import 'package:globout/features/auth/presentation/providers/auth_form_model_provider.dart';
import 'package:globout/features/auth/presentation/providers/save_auth_provider.dart';
import 'package:globout/features/auth/presentation/providers/update_user_provider.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/auth/presentation/views/update_profile/widgets/profile_input_field_widget.dart';
import 'package:globout/features/auth/presentation/views/update_profile/widgets/profile_photo_widget.dart';
import 'package:globout/util/resource/r.dart';
import 'package:go_router/go_router.dart';

class UpdateProfileView extends ConsumerStatefulWidget {
  const UpdateProfileView({super.key});

  @override
  ConsumerState<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends ConsumerState<UpdateProfileView> {
  final _nameInputController = TextEditingController();
  final _emailInputController = TextEditingController();
  final _usernameInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final user = ref.read(userProvider.notifier).user;
    _nameInputController.text = user!.name ?? "";
    _emailInputController.text = user.email ?? "";
    _usernameInputController.text = user.username ?? "";
  }

  Future<void> _updateUser() async {
    try {
      ref
          .read(authFormModelProvider.notifier)
          .setName(_nameInputController.text);

      ref
          .read(authFormModelProvider.notifier)
          .setEmail(_emailInputController.text);
      ref
          .read(authFormModelProvider.notifier)
          .setUsername(_usernameInputController.text);

      await ref.read(updateUserProvider.future);
      await ref.read(saveAuthProvider.future);

      if (context.mounted) {
        showMessage(context, "Profile updated successfully");

        GoRouter.of(context).pop();

        ref.invalidate(authFormModelProvider);
      }
    } on String catch (message) {
      showMessage(context, message);
    } catch (e) {
      showMessage(context, "Update failed");
    }
  }

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ref.invalidate(authFormModelProvider);
        return true;
      },
      child: Scaffold(
        backgroundColor: R.colors.jetBlack_FF2E2E2E,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  24.hb,

                  /// [Back]
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).pop();
                      ref.invalidate(authFormModelProvider);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 28.r,
                          child: Icon(
                            Icons.chevron_left,
                            color: R.colors.white_FFF5F5F5,
                          ),
                        ),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: R.colors.white_FFF5F5F5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 28.r)
                      ],
                    ),
                  ),

                  24.hb,

                  /// [Body]
                  /// [Profile Photo]
                  const Center(
                    child: ProfilePhotoWidget(),
                  ),

                  24.hb,

                  /// [Name]
                  Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: R.colors.white_FFF5F5F5,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  11.hb,

                  /// [Name Text Field]
                  ProfileInputFieldWidget(
                    hintText: "Name",
                    onChanged: (v) {
                      ref.read(authFormModelProvider.notifier).setName(v);
                    },
                    controller: _nameInputController,
                  ),

                  18.hb,

                  /// [Email]
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: R.colors.white_FFF5F5F5,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  11.hb,

                  /// [Email Text Field]
                  ProfileInputFieldWidget(
                    hintText: "Your Email",
                    controller: _emailInputController,
                    textInputType: TextInputType.emailAddress,
                    onChanged: (v) {},
                  ),

                  18.hb,

                  /// [Username]
                  Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: R.colors.white_FFF5F5F5,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  11.hb,

                  /// [Email Text Field]
                  ProfileInputFieldWidget(
                    hintText: "Username",
                    controller: _usernameInputController,
                    onChanged: (v) {},
                  ),

                  24.hb,

                  /// [Update Button]
                  Center(
                    child: RadiusButton(
                      text: "Save Changes",
                      color: R.colors.orchid_FFDE6CBA,
                      width: 211.w,
                      borderRadius: 6,
                      onPressed: _updateUser,
                      loadingEnabled: true,
                    ),
                  ),

                  25.hb,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
