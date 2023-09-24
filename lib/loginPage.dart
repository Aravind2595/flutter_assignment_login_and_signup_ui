import 'package:flutter/material.dart';
import 'package:flutter_assignment_login_and_signup_ui/homePage.dart';
import 'package:flutter_assignment_login_and_signup_ui/signupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  bool passwordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Form(
          key: formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text("Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
            const Text("Welcome back! Login with your credentials",
                style: TextStyle(fontSize: 10, color: Colors.grey)),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: userNameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Email ID",
                    labelText: "Email ID",
                    prefixIcon: const Icon(Icons.account_box),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (email) {
                  if (email!.isEmpty ||
                      !email!.contains("@") ||
                      !email!.contains(".com")) {
                    return "username must not be empty or invalid";
                  } else
                    return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: passwordController,
                obscuringCharacter: "*",
                obscureText: passwordHidden,
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordHidden = !passwordHidden;
                          });
                        },
                        icon: Icon(passwordHidden
                            ? Icons.visibility_off_sharp
                            : Icons.visibility)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (pass) {
                  if ((pass!.isEmpty) || (pass.length < 6)) {
                    return "password must not be empty/ password length must be > 6";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final valid = formKey.currentState!.validate();
                        if (valid) {
                          if ((userNameController.text != "abc@gmail.com") ||
                              (passwordController.text != "abc1234")) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Invalid User Name Or Password"),
                              backgroundColor: Colors.red,
                            ));
                          } else {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Invalid Data"),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        fixedSize: Size(100, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                      child: const Text("Login"),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignUpPage()));
                        },
                        child: const Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(color: Colors.grey),
                        ))
                  ],
                )),
          ]),
        ),
      ),
    ));
  }
}
