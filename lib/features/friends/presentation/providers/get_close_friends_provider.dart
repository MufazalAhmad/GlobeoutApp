import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/friends/domain/usecases/get_close_friends.dart';

import '../../../../util/di/di.dart';
import '../../../auth/domain/models/user/user.dart';
import '../../../auth/presentation/providers/user_provider.dart';

final getCloseFriendsProvider = StreamProvider<List<User>>((ref) {
  final user = ref.watch(userProvider);

  final getCloseFriends = sl<GetCloseFriendsUsecase>();
  final input = GetCloseFriendsUsecaseInput(userId: user!.id);

  final output = getCloseFriends(input);

  return output.friends;
});
