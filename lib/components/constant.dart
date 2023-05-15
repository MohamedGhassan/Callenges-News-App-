import '../helper/api_helper/google_signin_api.dart';

class User{
  static var user;
  static var user2 = GoogleSignInApi.login();
}