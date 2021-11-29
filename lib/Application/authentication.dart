import 'package:online_order_client/Infrastructure/Authentication/AuthenticationProviders/facebook_authentication.dart';
import 'package:online_order_client/Infrastructure/Authentication/iauthentication_service.dart';
import 'package:online_order_client/Infrastructure/service_provider.dart';

class Authentication {
  final IAuthenticationService _authService =
      ServicesProvider().authenticationService;
  final FacebookAuthentication _fbAuthentication = FacebookAuthentication();

  Authentication();

  void signInWithEmailAndPassword(String email, String password) {
    _authService.signInWithEmailAndPassword(email: email, password: password);
  }

  void signUpWithEmailAndPassword(String email, String password) {
    _authService.signUpWithEmailAndPassword(email: email, password: password);
  }

  void signUpWithFacebook() {
    _fbAuthentication.signUp();
  }

  void signInWithFacebook() {
    _fbAuthentication.singIn();
  }

  void requestPhoneValidation(String phone) {
    _authService.requestPhoneVerification(
        phone: phone,
        onVerificationCompleted: () {},
        onSmsCodeSent: () {
          _authService.confirmPhoneVerification(smsCode: "913203");
        });
  }

  void resetPassword(String email) {
    _authService.requestNewPassword(email: email);
  }

  void sendConfirmationEmail(String email) {
    _authService.requestEmailVerification(email: email);
  }

  void signOut() {
    _authService.signOut();
  }
}
