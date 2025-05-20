import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:klero_app/api/api.dart';
import 'package:klero_app/api/response.dart';
import 'package:klero_app/data/models/auth_response.dart';
import 'package:klero_app/data/models/user_model.dart';
import 'package:klero_app/domain/datasources/auth_datasource.dart';

class FirebaseAuthDataSource extends AuthDataSource {
  User? _user;
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Completer<void> _completer = Completer();

  FirebaseAuthDataSource(this._auth) {
    _init();
  }

  void _init() async {
    _auth.authStateChanges().listen((User? user) {
      if (!_completer.isCompleted) {
        _completer.complete();
      }
      _user = user;
    });
  }

  Future<User?> get user async {
    await _completer.future;
    return _user;
  }

  @override
  Future<ResponseState> checkAuthStatus(String token) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return ResponseFailed(
          DioException(
            requestOptions: RequestOptions(path: 'firebaseAuth'),
            message: 'No user logged in.',
          ),
        );
      }

      final userDoc =
          await _firestore.collection('users').doc(currentUser.uid).get();

      if (!userDoc.exists) {
        return ResponseFailed(
          DioException(
            requestOptions: RequestOptions(path: 'firestore'),
            message: 'User data not found in Firestore',
          ),
        );
      }

      final userData = userDoc.data() as Map<String, dynamic>;
      final userModel = UserModel.fromJson(userData);
      return ResponseSuccess(
        AuthResponseModel(user: userModel, token: ''),
        200,
      );
    } catch (e) {
      return ResponseFailed(
        DioException(
          requestOptions: RequestOptions(path: 'firebaseAuth'),
          error: e,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<ResponseState> login(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      final userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      if (!userDoc.exists) {
        return ResponseFailed(
          DioException(
            message: 'User data not found in Firestore after login.',
            requestOptions: RequestOptions(path: 'Firestore'),
          ),
        );
      }
      final userData = userDoc.data() as Map<String, dynamic>;
      final userModel = UserModel.fromJson(userData);
      return ResponseSuccess(
        AuthResponseModel(user: userModel, token: ''),
        200,
      );
    } on FirebaseAuthException catch (e) {
      return ResponseFailed(
        DioException(
          error: e.code,
          requestOptions: RequestOptions(path: 'firebaseAuth'),
        ),
      );
    } catch (e) {
      return ResponseFailed(
        DioException(
          requestOptions: RequestOptions(path: 'firebaseAuth'),
          error: e,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<ResponseState> register(
    String email,
    String password,
    String fullName,
  ) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user!;
      final userModel =
          UserModel(id: user.uid, email: email, fullName: fullName);
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set(userModel.toJson());

      return ResponseSuccess(
          AuthResponseModel(user: userModel, token: ''), 201);
    } on FirebaseAuthException catch (e) {
      return ResponseFailed(
        DioException(
          error: e.code,
          requestOptions: RequestOptions(path: 'firebaseAuth'),
        ),
      );
    } on PlatformException catch (e) {
      return ResponseFailed(
        DioException(
          error: e.code,
          requestOptions: RequestOptions(path: "firebaseAuth"),
        ),
      );
    } catch (e) {
      return ResponseFailed(
        DioException(
          requestOptions: RequestOptions(path: "firebaseAuth"),
          error: e,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<void> logout() async {
    return await _auth.signOut();
  }
}
