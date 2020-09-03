import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_music_app/src/utils/dialogs.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter_app_music_app/src/pages/custom_page.dart';

class Auth {
  Auth._internal();
  static Auth get instance => Auth._internal();

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User get user {
    return (_firebaseAuth).currentUser;
  }

  // Redes sociales
  Future<User> google(BuildContext context) async {
    try {
      final progress = ProgressDialog(context);
      progress.show();

      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication authentication =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );

      final result = await _firebaseAuth.signInWithCredential(credential);
      progress.dismiss();
      return (result.user);
    } catch (e) {}
    return null;
  }

  // Email y Password
  Future<User> signUp(
    BuildContext context, {
    @required String email,
    @required String password,
    @required String username,
  }) async {
    final progress = ProgressDialog(context);
    try {
      progress.show();
      final UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (user != null) {
        await result.user.updateProfile(displayName: username);
        progress.dismiss();
        return result.user;
      }
    } catch (e) {
      print(e);
    }
    progress.dismiss();
    return null;
  }

  Future<bool> sendResetEmailLink(
    BuildContext context, {
    @required String email,
  }) async {
    final progress = ProgressDialog(context);
    try {
      progress.show();
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      progress.dismiss();
      return true;
    } catch (e) {
      print(e);
    }
    progress.dismiss();
    return false;
  }

  // Logout
  Future<void> logoutOut(BuildContext context) async {
    try {
      final List<UserInfo> providerData = (user).providerData;
      final String providerId = providerData[0].providerId;
      await _providerService(providerId);
      await _firebaseAuth.signOut();

      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginPage.routeName,
        (route) => false,
      );
    } catch (e) {
      print(e);
    }
  }

  _providerService(String providerId) async {
    //todo: agregar los demas tipos de logeo
    switch (providerId) {
      case 'google.com':
        await _googleSignIn.signOut();
        break;
    }
  }
}
