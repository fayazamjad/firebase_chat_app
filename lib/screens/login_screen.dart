import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_app/components/login_button.dart';
import 'package:flash_chat_app/components/text_field.dart';
import 'package:flash_chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool status = false;
  final firebaseAuth = FirebaseAuth.instance;
  late String emailid;
  late String passwordid;

  void uservarification(
    String useremail,
    String userpassword,
  ) async {
    try {
      setState(() {
        status = true;
      });
      final user = await firebaseAuth.signInWithEmailAndPassword(
          email: useremail, password: userpassword);
      if (user != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }
      setState(() {
        status = false;
      });
    } catch (e) {
      print('$e catch block Fayaz');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlurryModalProgressHUD(
        inAsyncCall: status,
        color: Colors.lightBlue,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              Text_Field_Widget(
                  check: false,
                  email_text: 'Enter Your Email.....',
                  onchanged: (value) {
                    emailid = value;
                  }),
              const SizedBox(
                height: 8.0,
              ),
              Text_Field_Widget(
                  check: true,
                  email_text: 'Enter Your Password',
                  onchanged: (value) {
                    passwordid = value;
                  }),
              const SizedBox(
                height: 24.0,
              ),
              LoginButton(Colors.lightBlueAccent, 'Log In', () {
                uservarification(emailid, passwordid);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
