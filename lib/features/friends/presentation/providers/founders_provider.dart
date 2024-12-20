import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:globout/features/friends/domain/models/founder/founder.dart';
import 'package:globout/features/friends/domain/usecases/follow_user.dart';
import 'package:globout/features/friends/domain/usecases/unfollow_user.dart';
import 'package:globout/features/friends/presentation/providers/get_founders_provider.dart';
import 'package:globout/util/di/di.dart';

class FoundersNotifier extends StateNotifier<List<Founder>> {
  FoundersNotifier() : super([]);

  final followFounder = sl<FollowUserUsecase>();
  final unfollowFounder = sl<UnfollowUserUsecase>();

  void setFounders(List<Founder> founders) {
    state = founders;
  }

  void switchFollow({required final String from, required final String to}) {
    final founder = state.where((founder) => founder.id == to).first;

    if (founder.isFollowed(from)) {
      _unfollow(fromUserId: from, toUserId: to);
    } else {
      _follow(fromUserId: from, toUserId: to);
    }
  }

  Future<void> _follow({
    required final String fromUserId,
    required final String toUserId,
  }) async {
    state = state
        .map(
          (founder) => founder.id == toUserId
              ? founder.copyWith(followers: [fromUserId, ...founder.followers])
              : founder,
        )
        .toList();

    await followFounder(FollowUserUsecaseInput(
      fromUserId: fromUserId,
      toUserId: toUserId,
    ));
  }

  Future<void> _unfollow({
    required final String fromUserId,
    required final String toUserId,
  }) async {
    state = state
        .map(
          (founder) => founder.id == toUserId
              ? founder.copyWith(
                  followers: founder.followers
                      .where((element) => element != fromUserId)
                      .toList(),
                )
              : founder,
        )
        .toList();

    await unfollowFounder(UnfollowUserUsecaseInput(
      fromUserId: fromUserId,
      toUserId: toUserId,
    ));
  }
}

final foundersProvider = StateNotifierProvider<FoundersNotifier, List<Founder>>(
  (ref) {
    final getFounders = ref.watch(getFoundersProvider);

    if (getFounders.hasValue) {
      final founders = getFounders.asData!.value;
      return FoundersNotifier()..setFounders(founders);
    }

    return FoundersNotifier();
  },
);
