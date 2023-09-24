import 'package:flutter/material.dart';
import 'package:flutter_assignment_login_and_signup_ui/loginPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var cPasswordController = TextEditingController();
  bool passwordHidden = true;
  bool cPasswordHidden = true;

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
                  child: Text("Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                ),
                const Text("Create an Account, its free",
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
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: cPasswordController,
                    obscuringCharacter: "*",
                    obscureText: cPasswordHidden,
                    decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                cPasswordHidden = !cPasswordHidden;
                              });
                            },
                            icon: Icon(cPasswordHidden
                                ? Icons.visibility_off_sharp
                                : Icons.visibility)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (cPass) {
                      if ((cPass!.isEmpty) || (cPass.length < 6)) {
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
                              if (passwordController.text != cPasswordController.text) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Password Mismatch"),
                                  backgroundColor: Colors.red,
                                ));
                              } else {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
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
                          child: const Text("Sign Up"),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
                            },
                            child: const Text(
                              "Already have an account? Login",
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
