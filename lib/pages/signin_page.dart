import 'package:flutter/material.dart';
import '../props/route.dart';
import '../props/widgets.dart';
import 'home_page.dart';
import 'signup_page.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key, this.data});

  final Map? data;
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    Map? _data;
    if (data != null) {
      _data = data;
      print(_data);
      print(_data?['text']);
    }

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(20),
      child: Center(
        child: ListView(shrinkWrap: true, children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              child: Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              child: Text(
                "Sign in to continue",
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFieldSignin(
            kontrol: email,
            hintText: "Email",
          ),
          const SizedBox(height: 20),
          Password(password: password),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              height: 50, //height of button
              width: double.infinity, //width of button
              child: ElevatedButton(
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                  onPressed: () {
                    if (email.text == "" && password.text == "") {
                      TheScaffold(
                          context: context, message: "Data Harus Diisi");
                    } else {
                      if (email.text == _data?['text'] &&
                          password.text == _data?['password']) {
                        Navigator.pushReplacementNamed(
                            context, HomePage.routeName,
                            arguments: LoginScreenArguments(
                              {
                                "text": email.text,
                                "password": password.text,
                                "name": name.text
                              },
                            ));
                      } else {
                        TheScaffold(
                            context: context,
                            message: "Email atau Password salah");
                      }
                    }
                  }),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(
                  onPressed: (() {
                    Navigator.pushNamed(context, SignupPage.routeName);
                  }),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.deepPurple),
                  ))
            ],
          )
        ]),
      ),
    )));
  }
}
