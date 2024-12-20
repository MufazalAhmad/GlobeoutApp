import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:globout/features/auth/data/entities/user/firebase_user/firebase_user_entity.dart';
import 'package:globout/features/auth/data/source/firebase/auth_firebase_datasource.dart';
import 'package:globout/features/auth/domain/usecases/get_user.dart';
import 'package:globout/features/auth/domain/usecases/get_user_socket.dart';
import 'package:globout/features/auth/domain/usecases/send_otp.dart';
import 'package:globout/features/auth/domain/usecases/switch_user_visibility.dart';
import 'package:globout/features/auth/domain/usecases/update_user.dart';
import 'package:globout/features/auth/domain/usecases/verify_otp.dart';
import 'package:globout/util/exceptions/exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'package:globout/features/auth/domain/models/user/user.dart'
    as user_model;

@LazySingleton(as: AuthFirebaseDataSource)
class AuthFirebaseDataSourceImpl implements AuthFirebaseDataSource {
  final Logger _logger;

  AuthFirebaseDataSourceImpl({
    required Logger logger,
  }) : _logger = logger;

  @override
  Future<GetUserUsecaseOutput> getUser(GetUserUsecaseInput input) async {
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(input.id)
        .get();

    if (!(userDoc.exists)) {
      throw UserNotFoundException();
    }

    final userData = userDoc.data()!;

    final userEntity = FirebaseUserEntity.fromJson(userData);

    return GetUserUsecaseOutput(user: user_model.User.fromEntity(userEntity));
  }

  /// [AuthCompleter]
  var _authCompleter = Completer<String>();

  @override
  Future<SendOtpUsecaseOutput> sendOtp(SendOtpUsecaseInput input) async {
    if (!input.phNumber.startsWith('+') ||
        input.phNumber.length < 8 ||
        input.phNumber.length > 16) {
      throw PhoneNumberFormatException();
    }

    _authCompleter = Completer<String>();

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: input.phNumber,
        verificationCompleted: (AuthCredential authCredential) {
          _logger.i("Verification Completed");
        },
        verificationFailed: (e) {
          throw "Verification Failed";
        },
        codeSent: (id, forceResendingToken) {
          _authCompleter.complete(id);
        },
        codeAutoRetrievalTimeout: (codeAutoRetrievalTimeout) {},
      );

      await _authCompleter.future;
    } catch (e) {
      _logger.e("$e");
      rethrow;
    }

    return SendOtpUsecaseOutput();
  }

  @override
  Future<UpdateUserUsecaseOutput> updateUser(
      UpdateUserUsecaseInput input) async {
    final ref = FirebaseFirestore.instance.collection('users').doc(input.id);
    final storage = FirebaseStorage.instance;
    late Map<String, String?> data = {};

    data = {
      'name': input.name,
      'email': input.email,
      'username': input.username,
    };

    // update image

    if (input.image != null && input.image!.isNotEmpty) {
      try {
        final storageReference = storage.ref().child(
            'images/${input.id}/${DateTime.now().millisecondsSinceEpoch}.jpg');
        final uploadTask = storageReference.putFile(File(input.image!));
        final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});

        final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        data['imgUrl'] = downloadUrl;

        _logger.i('Image uploaded successfully');
      } catch (e) {
        _logger.e('Error uploading image: $e');
      }
    }

    data['updatedAt'] = DateTime.now().toString();

    await ref.update(data);

    _logger.i('updatedUser: ${input.id}');

    final userDoc = await ref.get();

    final userEnity = FirebaseUserEntity.fromJson(userDoc.data()!);

    return UpdateUserUsecaseOutput(user: user_model.User.fromEntity(userEnity));
  }

  @override
  Future<VerifyOtpUsecaseOutput> verifyOtp(VerifyOtpUsecaseInput input) async {
    try {
      final verificationId = await _authCompleter.future;
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: input.otp,
      );

      final result = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      if (result.user == null) {
        throw OtpVerificationFailedException();
      }

      await _createUserDoc(result.user!);

      _logger.i('verifyOtp: ${result.user!.uid}');

      return VerifyOtpUsecaseOutput(id: result.user!.uid);
    } on FirebaseAuthException {
      throw IncorrectOtpException();
    }
  }

  Future<void> _createUserDoc(User user) async {
    final ref = FirebaseFirestore.instance.collection('users').doc(user.uid);
    final userDoc = await ref.get();

    if (userDoc.exists) {
      return;
    }

    final data = {
      'id': user.uid,
      'phNumber': user.phoneNumber,
      'initialInvitesSent': false,
      'createdAt': DateTime.now().toString(),
      'updatedAt': DateTime.now().toString(),
      'imgUrl': '',
      'followers': [],
      'following': [],
    };

    await ref.set(data);
  }

  @override
  Future<SwitchUserVisibilityUsecaseOutput> switchUserVisibility(
      SwitchUserVisibilityUsecaseInput input) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(input.userId)
          .update({
        "visible": input.visible,
      });
      return SwitchUserVisibilityUsecaseOutput();
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }

  @override
  GetUserSocketUsecaseOutput getUserSocket(GetUserSocketUsecaseInput input) {
    try {
      final socket = FirebaseFirestore.instance
          .collection('users')
          .doc(input.id)
          .snapshots();

      return GetUserSocketUsecaseOutput(
        data: socket.map(
          (event) => FirebaseUserEntity.fromJson(event.data()!),
        ),
      );
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }
}
