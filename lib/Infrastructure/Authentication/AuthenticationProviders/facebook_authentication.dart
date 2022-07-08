// ignore_for_file: unused_element, unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';
import 'dart:developer' as dev;

class FacebookAuthentication {
  final IAuthenticationService _service =
      ServicesProvider().authenticationService;

  /*Future<void> singIn() async {
    try {
      final FacebookAuth _facebookAuth = FacebookAuth.instance;
      LoginResult loginResult = await _facebookAuth.login();
      if (loginResult.accessToken != null) {
        OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        _service.signInWithFacebook(credential: facebookAuthCredential);
      }
    } catch (e) {
      dev.log(e.toString());
    }
  }

  Future<void> unlinkFacebook() async {
    try {
      _service.unlinkProvider(providerId: "facebook.com");
    } catch (e) {
      dev.log(e.toString());
    }
  }

  Future<void> linkFacebook() async {
    try {
      final FacebookAuth _facebookAuth = FacebookAuth.instance;
      LoginResult loginResult = await _facebookAuth.login();
      if (loginResult.accessToken != null) {
        OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        _service.linkAuthProviderWithProfile(
            authProvider: facebookAuthCredential);
      }
    } catch (e) {
      dev.log(e.toString());
    }
  }*/

  Future<void> singIn() async {
    try {
      final FacebookLogin _facebookAuth = FacebookLogin();
      FacebookLoginResult loginResult = await _facebookAuth.logIn();
      if (loginResult.accessToken != null) {
        OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        _service.signInWithFacebook(credential: facebookAuthCredential);
      }
    } catch (e) {
      dev.log(e.toString());
    }
  }

  Future<void> unlinkFacebook() async {
    try {
      _service.unlinkProvider(providerId: "facebook.com");
    } catch (e) {
      dev.log(e.toString());
    }
  }

  Future<void> linkFacebook() async {
    try {
      final FacebookLogin _facebookAuth = FacebookLogin();
      FacebookLoginResult loginResult = await _facebookAuth.logIn();
      if (loginResult.accessToken != null) {
        OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);

        _service.linkAuthProviderWithProfile(
            authProvider: facebookAuthCredential);
      }
    } catch (e) {
      dev.log(e.toString());
    }
  }
}
