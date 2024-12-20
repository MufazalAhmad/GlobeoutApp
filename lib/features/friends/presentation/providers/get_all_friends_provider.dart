import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/friends/domain/usecases/get_all_friends.dart';
import '../../../../util/di/di.dart';
import '../../../auth/domain/models/user/user.dart';
import '../../../auth/presentation/providers/user_provider.dart';

final getAllFriendsProvider = StreamProvider<List<User>>((ref) {
  final user = ref.watch(userProvider);

  final getAllFriends = sl<GetAllFriendsUsecase>();
  final input = GetAllFriendsUsecaseInput(userId: user!.id);

  final output = getAllFriends(input);

  return output.friends;
});
