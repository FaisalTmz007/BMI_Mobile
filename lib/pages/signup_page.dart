import 'package:flutter/material.dart';
import 'package:praktikum_m6/props/route.dart';
import 'package:praktikum_m6/props/widgets.dart';
import 'package:praktikum_m6/pages/signin_page.dart';

final name = TextEditingController();
final email = TextEditingController();
final password = TextEditingController();

class SignupPage extends StatelessWidget {
  static const routeName = '/signup';

  @override
  Widget build(BuildContext context) {
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
                  "Hi!",
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
                  "Create a new account",
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFieldSignin(
              kontrol: name,
              hintText: "Name",
            ),
            const SizedBox(height: 20),
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
                    style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                    child: Text("Sign Up"),
                    onPressed: () {
                      if (email.text == "" &&
                          name.text == "" &&
                          password.text == "") {
                        TheScaffold(
                            context: context, message: "Data Harus Diisi");
                      } else {
                        Navigator.pushReplacementNamed(
                          context,
                          SigninPage.routeName,
                          arguments: LoginScreenArguments(
                            {
                              "text": email.text,
                              "name": name.text,
                              "password": password.text,
                            },
                          ),
                        );
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
                const Text('Already have account? '),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    ));
  }
}
