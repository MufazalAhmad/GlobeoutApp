import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:globout/common/extensions/num.dart';
import 'package:globout/features/friends/presentation/views/add_friends_view/widgets/add_friends_view_heading_widget.dart';
import 'package:globout/features/friends/presentation/views/contacts/widgets/contact_tile_widget.dart';
import 'package:globout/util/resource/r.dart';
import 'package:go_router/go_router.dart';
import '../../providers/get_contacts_with_detail_provider.dart';
import '../add_friends_view/widgets/add_friends_view_bg.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          children: [
            /// [BG]
            const AddFriendsViewBg(),

            /// [Body]
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              width: 1.sw,
              height: 1.sh,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// [Back]
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: Icon(
                            Icons.chevron_left,
                            color: R.colors.white_FFF5F5F5,
                            size: 32.sp,
                          ),
                        ),
                        Text(
                          "Back",
                          style: TextStyle(
                            color: R.colors.white_FFF5F5F5,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    8.hb,

                    /// [Already Globout ...]
                    const AddFriendsViewHeadingWidget(
                      title: "Contacts",
                    ),

                    8.hb,

                    Consumer(builder: (context, ref, child) {
                      final contactsAsync =
                          ref.watch(contactsWithDetailProvider);

                      if (contactsAsync.isLoading) {
                        return Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: R.colors.white_FFFFFFFF,
                            ),
                          ),
                        );
                      } else if (!contactsAsync.hasValue) {
                        return const SizedBox();
                      } else if (contactsAsync.value?.isEmpty ?? false) {
                        return const Text("No contacts found");
                      }
                      final contacts = contactsAsync.value ?? [];

                      return Expanded(
                        child: ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            final contact = contacts[index];
                            return ContactTileWidget(user: contact);
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
