import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignin{
   final googleSignIn = GoogleSignIn(
    clientId: "49016362281-em5g5sbrmdng1bn1jaakrtomcupcg1gt.apps.googleusercontent.com"
  );
  bool? _isSigningIn =false;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    // notifyListeners();
  }

  Future login() async {
    isSigningIn = true;
    _isSigningIn = true;
    final user = await googleSignIn.signIn();
    print(user); 
  }
}