import 'package:firebase_auth/firebase_auth.dart';
import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';

class FacebookAuthentication {
  final IAuthenticationService _service =
      ServicesProvider().authenticationService;
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

  Future<void> singIn() async {
    LoginResult loginResult = await _facebookAuth.login();
    if (loginResult.accessToken != null) {
      OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      try {
        _service.linkAuthProviderWithProfile(
            authProvider: facebookAuthCredential);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<Map<String, dynamic>> signUp() async {
    Map<String, dynamic> profile =
        await _facebookAuth.getUserData(fields: "name,email");

    return profile;
  }

  Future<void> _getUserData() async {
    Map<String, dynamic> profile =
        await _facebookAuth.getUserData(fields: "name,email");
    print(profile["name"]);
    print(profile["email"]);
  }
}
