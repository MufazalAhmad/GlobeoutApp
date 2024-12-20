import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/auth/domain/models/user/user.dart';
import 'package:globout/features/auth/presentation/providers/user_provider.dart';
import 'package:globout/features/home/presentation/providers/contacts_provider.dart';

import '../../../../util/di/di.dart';
import '../../domain/usecases/load_users_from_contacts.dart';

final globoutContactFriendsProvider = FutureProvider.autoDispose<List<User>>(
  (ref) async {
    final loadContactFriends = sl<LoadUsersFromContactsUsecase>();
    final contacts = await ref.watch(contactsProvider.future);
    final currentUser = ref.watch(userProvider);

    final input = LoadUsersFromContactsUsecaseInput(
      userId: currentUser!.id,
      numbers:
          contacts.where((element) => element != currentUser.phNumber).toList(),
    );

    final output = await loadContactFriends(input);

    final users = output.users.where((user) {
      final isInFriends =
          currentUser.friends.any((element) => element == user.id);
      final isInCloseFriends =
          currentUser.closeFriends.any((element) => element == user.id);

      return !isInFriends && !isInCloseFriends;
    }).toList();

    return users;
  },
);
