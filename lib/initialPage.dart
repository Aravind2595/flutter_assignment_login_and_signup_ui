import 'package:flutter/material.dart';
import 'package:flutter_assignment_login_and_signup_ui/loginPage.dart';
import 'package:flutter_assignment_login_and_signup_ui/signupPage.dart';

void main() {
  runApp(MaterialApp(
    home: const InitialPage(),
    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
  ));
}

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text("Hello There!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
            const Text(
                "Automatic identify verfication which enable you to verify your identity",
                style: TextStyle(fontSize: 10, color: Colors.grey)),
            const Image(
              image: AssetImage("assets/images/customer.jpg"),
              height: 300,
              width: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: const Size(300, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                child: const Text("Login"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignUpPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                fixedSize: const Size(300, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
              child: const Text("Sign Up"),
            ),
          ],
        ),
      )),
    );
  }

}
