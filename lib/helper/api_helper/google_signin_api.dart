import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi{
  static final _clinetIdWeb =
      '362667310856-q4q0811alv4co5qr9oh9rg64qsloe5tn.apps.googleusercontent.com';
  static final _googleSignIn = GoogleSignIn(clientId: _clinetIdWeb);
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future logout() => _googleSignIn.disconnect() ;
}