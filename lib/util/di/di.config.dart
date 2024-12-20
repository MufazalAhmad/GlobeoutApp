// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i14;

import '../../features/activity/data/source/local/activity_local_datasource.dart'
    as _i28;
import '../../features/activity/data/source/local/activity_local_datasource_imp.dart'
    as _i29;
import '../../features/activity/data/source/remote/activity_remote_datasource.dart'
    as _i30;
import '../../features/activity/data/source/remote/activity_remote_datasource_imp.dart'
    as _i31;
import '../../features/activity/domain/repository/activity_repository.dart'
    as _i32;
import '../../features/activity/domain/repository/activity_repository_imp.dart'
    as _i33;
import '../../features/activity/domain/usecases/cache_create_event.dart'
    as _i40;
import '../../features/activity/domain/usecases/create_activity.dart' as _i42;
import '../../features/activity/domain/usecases/fetch_location.dart' as _i5;
import '../../features/activity/domain/usecases/get_cached_events.dart' as _i52;
import '../../features/activity/domain/usecases/get_events.dart' as _i53;
import '../../features/activity/domain/usecases/update_activity.dart' as _i73;
import '../../features/activity/domain/usecases/update_activity_location.dart'
    as _i72;
import '../../features/activity/domain/usecases/update_cached_event.dart'
    as _i74;
import '../../features/activity/domain/usecases/update_event.dart' as _i75;
import '../../features/auth/data/source/assets/auth_assets_datasource.dart'
    as _i3;
import '../../features/auth/data/source/assets/auth_assets_datasource_imp.dart'
    as _i4;
import '../../features/auth/data/source/firebase/auth_firebase_datasource.dart'
    as _i34;
import '../../features/auth/data/source/firebase/auth_firebase_datasource_imp.dart'
    as _i35;
import '../../features/auth/data/source/local/auth_local_datasource.dart'
    as _i36;
import '../../features/auth/data/source/local/auth_local_datasource_imp.dart'
    as _i37;
import '../../features/auth/domain/repository/auth_repository.dart' as _i38;
import '../../features/auth/domain/repository/auth_repository_imp.dart' as _i39;
import '../../features/auth/domain/usecases/check_auth.dart' as _i41;
import '../../features/auth/domain/usecases/get_user.dart' as _i57;
import '../../features/auth/domain/usecases/get_user_socket.dart' as _i56;
import '../../features/auth/domain/usecases/load_all_coutries.dart' as _i58;
import '../../features/auth/domain/usecases/remove_auth.dart' as _i62;
import '../../features/auth/domain/usecases/save_auth.dart' as _i65;
import '../../features/auth/domain/usecases/send_otp.dart' as _i67;
import '../../features/auth/domain/usecases/switch_user_visibility.dart'
    as _i69;
import '../../features/auth/domain/usecases/update_user.dart' as _i76;
import '../../features/auth/domain/usecases/verify_otp.dart' as _i77;
import '../../features/friends/data/source/firebase/friends_firebase_datasource.dart'
    as _i6;
import '../../features/friends/data/source/firebase/friends_firebase_datasource_imp.dart'
    as _i7;
import '../../features/friends/data/source/local/friends_local_datasource.dart'
    as _i44;
import '../../features/friends/data/source/local/friends_local_datasource_imp.dart'
    as _i45;
import '../../features/friends/data/source/phone/friends_phone_datasource.dart'
    as _i8;
import '../../features/friends/data/source/phone/friends_phone_datasource_imp.dart'
    as _i9;
import '../../features/friends/domain/repository/friends_repository.dart'
    as _i46;
import '../../features/friends/domain/repository/friends_repository_imp.dart'
    as _i47;
import '../../features/friends/domain/usecases/accept_friend_request.dart'
    as _i78;
import '../../features/friends/domain/usecases/add_friend.dart' as _i80;
import '../../features/friends/domain/usecases/add_friend_to_close_friend.dart'
    as _i79;
import '../../features/friends/domain/usecases/cancel_friend_request.dart'
    as _i81;
import '../../features/friends/domain/usecases/follow_user.dart' as _i82;
import '../../features/friends/domain/usecases/get_all_friends.dart' as _i48;
import '../../features/friends/domain/usecases/get_close_friends.dart' as _i49;
import '../../features/friends/domain/usecases/get_contacts.dart' as _i50;
import '../../features/friends/domain/usecases/get_contacts_with_detail.dart'
    as _i51;
import '../../features/friends/domain/usecases/get_founders_usecase.dart'
    as _i54;
import '../../features/friends/domain/usecases/get_recieved_friend_requests.dart'
    as _i55;
import '../../features/friends/domain/usecases/load_contacts.dart' as _i59;
import '../../features/friends/domain/usecases/load_users_from_contacts.dart'
    as _i60;
import '../../features/friends/domain/usecases/phone_contacts_updated.dart'
    as _i61;
import '../../features/friends/domain/usecases/remove_contacts.dart' as _i63;
import '../../features/friends/domain/usecases/remove_friend_from_close_friends.dart'
    as _i64;
import '../../features/friends/domain/usecases/save_contacts.dart' as _i66;
import '../../features/friends/domain/usecases/send_sms.dart' as _i22;
import '../../features/friends/domain/usecases/set_initial_invites_sent_usecase.dart'
    as _i68;
import '../../features/friends/domain/usecases/un_friend.dart' as _i70;
import '../../features/friends/domain/usecases/unfollow_user.dart' as _i71;
import '../../features/home/domain/usecases/init_background_isolates.dart'
    as _i13;
import '../../features/home/domain/usecases/send_message.dart' as _i23;
import '../../features/location/domain/usecases/get_current_location.dart'
    as _i10;
import '../../features/settings/data/source/firebase/settings_firebase_datasource.dart'
    as _i24;
import '../../features/settings/data/source/firebase/settings_firebase_datasource_imp.dart'
    as _i25;
import '../../features/settings/domain/repository/settings_repository.dart'
    as _i26;
import '../../features/settings/domain/repository/settings_repository_imp.dart'
    as _i27;
import '../../features/settings/domain/usecases/create_report.dart' as _i43;
import '../../helpers/image_picker/image_picker_helper.dart' as _i11;
import '../../helpers/image_picker/image_picker_helper_impl.dart' as _i12;
import '../../helpers/image_picker/usecases/pick_camera_image_usecase.dart'
    as _i20;
import '../../helpers/image_picker/usecases/pick_gallery_image_usecase.dart'
    as _i21;
import '../../helpers/network_call_helper/http_network_call_helper_impl.dart'
    as _i17;
import '../../helpers/network_call_helper/network_call_helper.dart' as _i16;
import '../../helpers/persistence/persistence_helper.dart' as _i18;
import '../../helpers/persistence/persistence_helper_imp.dart' as _i19;
import 'di.dart' as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AuthAssetsDataSource>(
        () => _i4.AuthAssetsDataSourceImp());
    gh.lazySingleton<_i5.FetchLocationUsecase>(
        () => _i5.FetchLocationUsecase());
    gh.lazySingleton<_i6.FriendsFirebaseDataSource>(
        () => _i7.FriendsFirebaseDataSourceImp());
    gh.lazySingleton<_i8.FriendsPhoneDataSource>(
        () => _i9.FriendsPhoneDataSourceImp());
    gh.lazySingleton<_i10.GetCurrentLocationUsecase>(
        () => _i10.GetCurrentLocationUsecase());
    gh.lazySingleton<_i11.ImagePickerHelper>(
        () => _i12.ImagePickerHelperImpl());
    gh.lazySingleton<_i13.InitBackgroundIsolatesUsecase>(
        () => _i13.InitBackgroundIsolatesUsecase());
    gh.lazySingleton<_i14.Logger>(() => _i15.LoggerImp());
    gh.lazySingleton<_i16.NetworkCallHelper>(
        () => _i17.HttpNetworkCallHelperImpl(logger: gh<_i14.Logger>()));
    gh.singleton<_i18.PersistenceHelper>(_i19.PersistenceHelperImpl());
    gh.lazySingleton<_i20.PickCameraImageUsecase>(
        () => _i20.PickCameraImageUsecase(image: gh<_i11.ImagePickerHelper>()));
    gh.lazySingleton<_i21.PickGalleryImageUsecase>(() =>
        _i21.PickGalleryImageUsecase(image: gh<_i11.ImagePickerHelper>()));
    gh.lazySingleton<_i22.SendSmsUsecase>(() => _i22.SendSmsUsecase());
    gh.lazySingleton<_i23.SendWhatsAppMessageUsecase>(
        () => _i23.SendWhatsAppMessageUsecase());
    gh.lazySingleton<_i24.SettingsFirebaseDataSource>(
        () => _i25.SettingsFirebaseDataSourceImpl(logger: gh<_i14.Logger>()));
    gh.lazySingleton<_i26.SettingsRepository>(() => _i27.SettingsRepositoryImp(
        settingsFirebaseDataSource: gh<_i24.SettingsFirebaseDataSource>()));
    gh.lazySingleton<_i28.ActivityLocalDataSource>(
        () => _i29.ActivityLocalDataSourceImp(
              logger: gh<_i14.Logger>(),
              persistenceHelper: gh<_i18.PersistenceHelper>(),
            ));
    gh.lazySingleton<_i30.ActivityRemoteDataSource>(
        () => _i31.ActivityRemoteDataSourceImp(
              logger: gh<_i14.Logger>(),
              networkCallHelper: gh<_i16.NetworkCallHelper>(),
            ));
    gh.lazySingleton<_i32.ActivityRepository>(() => _i33.ActivityRepositoryImp(
          activityRemoteDataSource: gh<_i30.ActivityRemoteDataSource>(),
          activityLocalDataSource: gh<_i28.ActivityLocalDataSource>(),
        ));
    gh.lazySingleton<_i34.AuthFirebaseDataSource>(
        () => _i35.AuthFirebaseDataSourceImpl(logger: gh<_i14.Logger>()));
    gh.lazySingleton<_i36.AuthLocalDataSource>(
        () => _i37.AuthLocalDataSourceImp(
              logger: gh<_i14.Logger>(),
              persistenceHelper: gh<_i18.PersistenceHelper>(),
            ));
    gh.lazySingleton<_i38.AuthRepository>(() => _i39.AuthRepositoryImp(
          authFirebaseDataSource: gh<_i34.AuthFirebaseDataSource>(),
          authLocalDataSource: gh<_i36.AuthLocalDataSource>(),
          authAssetsDataSource: gh<_i3.AuthAssetsDataSource>(),
        ));
    gh.lazySingleton<_i40.CacheCreateEventUsecase>(() =>
        _i40.CacheCreateEventUsecase(
            activityRepository: gh<_i32.ActivityRepository>()));
    gh.lazySingleton<_i41.CheckAuthUsecase>(
        () => _i41.CheckAuthUsecase(authRepository: gh<_i38.AuthRepository>()));
    gh.lazySingleton<_i42.CreateEventUsecase>(() => _i42.CreateEventUsecase(
        activityRepository: gh<_i32.ActivityRepository>()));
    gh.lazySingleton<_i43.CreateReportUsecase>(() => _i43.CreateReportUsecase(
        settingsRepository: gh<_i26.SettingsRepository>()));
    gh.lazySingleton<_i44.FriendsLocalDataSource>(
        () => _i45.FriendsLocalDataSourceImp(
              logger: gh<_i14.Logger>(),
              persistenceHelper: gh<_i18.PersistenceHelper>(),
            ));
    gh.lazySingleton<_i46.FriendsRepository>(() => _i47.FriendsRepositoryImp(
          friendsPhoneDataSource: gh<_i8.FriendsPhoneDataSource>(),
          friendsLocalDataSource: gh<_i44.FriendsLocalDataSource>(),
          friendsFirebaseDataSource: gh<_i6.FriendsFirebaseDataSource>(),
        ));
    gh.lazySingleton<_i48.GetAllFriendsUsecase>(() => _i48.GetAllFriendsUsecase(
        friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i49.GetCloseFriendsUsecase>(() =>
        _i49.GetCloseFriendsUsecase(
            friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i50.GetContactsUsecase>(() => _i50.GetContactsUsecase(
        friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i51.GetContactsWithDetailUsecase>(() =>
        _i51.GetContactsWithDetailUsecase(
            friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i52.GetEventsCachedUsecase>(() =>
        _i52.GetEventsCachedUsecase(
            activityRepository: gh<_i32.ActivityRepository>()));
    gh.lazySingleton<_i53.GetEventsUsecase>(() => _i53.GetEventsUsecase(
        activityRepository: gh<_i32.ActivityRepository>()));
    gh.lazySingleton<_i54.GetFoundersUsecaseUsecase>(() =>
        _i54.GetFoundersUsecaseUsecase(
            friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i55.GetReceivedFriendRequestsUsecase>(() =>
        _i55.GetReceivedFriendRequestsUsecase(
            friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i56.GetUserSocketUsecase>(() =>
        _i56.GetUserSocketUsecase(authRepository: gh<_i38.AuthRepository>()));
    gh.lazySingleton<_i57.GetUserUsecase>(
        () => _i57.GetUserUsecase(authRepository: gh<_i38.AuthRepository>()));
    gh.lazySingleton<_i58.LoadAllCoutriesUsecase>(() =>
        _i58.LoadAllCoutriesUsecase(authRepository: gh<_i38.AuthRepository>()));
    gh.lazySingleton<_i59.LoadContactsUsecase>(() => _i59.LoadContactsUsecase(
        friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i60.LoadUsersFromContactsUsecase>(() =>
        _i60.LoadUsersFromContactsUsecase(
            friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i61.PhoneContactsUpdatedUsecase>(() =>
        _i61.PhoneContactsUpdatedUsecase(
            friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i62.RemoveAuthUsecase>(() =>
        _i62.RemoveAuthUsecase(authRepository: gh<_i38.AuthRepository>()));
    gh.lazySingleton<_i63.RemoveContactsUsecase>(() =>
        _i63.RemoveContactsUsecase(
            friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i64.RemoveFriendFromCloseFriendsUsecase>(() =>
        _i64.RemoveFriendFromCloseFriendsUsecase(
            friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i65.SaveAuthUsecase>(
        () => _i65.SaveAuthUsecase(authRepository: gh<_i38.AuthRepository>()));
    gh.lazySingleton<_i66.SaveContactsUsecase>(() => _i66.SaveContactsUsecase(
        friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i67.SendOtpUsecase>(
        () => _i67.SendOtpUsecase(authRepository: gh<_i38.AuthRepository>()));
    gh.lazySingleton<_i68.SetInitialInvitesSentUsecaseUsecase>(() =>
        _i68.SetInitialInvitesSentUsecaseUsecase(
            friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i69.SwitchUserVisibilityUsecase>(() =>
        _i69.SwitchUserVisibilityUsecase(
            authRepository: gh<_i38.AuthRepository>()));
    gh.lazySingleton<_i70.UnFriendUsecase>(() =>
        _i70.UnFriendUsecase(friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i71.UnfollowUserUsecase>(() => _i71.UnfollowUserUsecase(
        friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i72.UpdateActivityLocationUsecase>(() =>
        _i72.UpdateActivityLocationUsecase(
            activityRepository: gh<_i32.ActivityRepository>()));
    gh.lazySingleton<_i73.UpdateActivityUsecase>(() =>
        _i73.UpdateActivityUsecase(
            activityRepository: gh<_i32.ActivityRepository>()));
    gh.lazySingleton<_i74.UpdateCachedEventUsecase>(() =>
        _i74.UpdateCachedEventUsecase(
            activityRepository: gh<_i32.ActivityRepository>()));
    gh.lazySingleton<_i75.UpdateEventUsecase>(() => _i75.UpdateEventUsecase(
        activityRepository: gh<_i32.ActivityRepository>()));
    gh.lazySingleton<_i76.UpdateUserUsecase>(() =>
        _i76.UpdateUserUsecase(authRepository: gh<_i38.AuthRepository>()));
    gh.lazySingleton<_i77.VerifyOtpUsecase>(
        () => _i77.VerifyOtpUsecase(authRepository: gh<_i38.AuthRepository>()));
    gh.lazySingleton<_i78.AcceptFriendRequestUsecase>(() =>
        _i78.AcceptFriendRequestUsecase(
            friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i79.AddFriendToCloseFriendUsecase>(() =>
        _i79.AddFriendToCloseFriendUsecase(
            friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i80.AddFriendUsecase>(() =>
        _i80.AddFriendUsecase(friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i81.CancelFriendRequestUsecase>(() =>
        _i81.CancelFriendRequestUsecase(
            friendsRepository: gh<_i46.FriendsRepository>()));
    gh.lazySingleton<_i82.FollowUserUsecase>(() => _i82.FollowUserUsecase(
        friendsRepository: gh<_i46.FriendsRepository>()));
    return this;
  }
}
