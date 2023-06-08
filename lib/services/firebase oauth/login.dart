import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:twenti_mobile/firebase_options.dart';

import '../../models/account/account.dart';
import '../http/constant.dart';
import '../shared preferences/sharedPreferences.dart';

class Authentication {
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // TODO: Add auto login logic

    return firebaseApp;
  }

  static Future<User?> signInWithGoogle() async {
    print("sign in.....");
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    print(googleSignInAccount);
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        print("hello");
        user = userCredential.user!;
        var subbody = {
          'email': user.email.toString(),
          'uid': user.uid.toString()
        };
        print("sending");
        //send login request
        http.Response response = await http.post(
            Uri.parse('$baseUrl/api/login'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({'user': subbody}));
        if (response.statusCode == 200) {
          var list = json.decode(response.body);

          await SharedPreferencesObject().saveLoginState(Account(
              json.decode(response.body)["IDCus"].toString(),
              json.decode(response.body)['Email'].toString(),
              json.decode(response.body)['PhoneNumber'].toString(),
              json.decode(response.body)['FirstName'].toString()));
          print("login successful");
          await SharedPreferencesObject().futureGetAccountLocal().then((value) {
            if (value.idcus != '') {
              print(value.idcus);
            }
          });
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          print("error2");
          print(e.code);
        } else if (e.code == 'invalid-credential') {
          // handle the error here
          print("error3");
        }
      } catch (e) {
        print("error 1");
        print(e);
        // handle the error here
      }
    }

    return user;
  }
}
