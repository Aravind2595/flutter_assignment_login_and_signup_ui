import 'package:flutter/material.dart';
import 'package:flutter_assignment_login_and_signup_ui/initialPage.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Home Page"),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>InitialPage()));
                },
                child: const Row(
                  children: [
                    Text(
                      "Log Out",
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(Icons.logout,color: Colors.white,size: 15,),
                  ],
                ))
          ],
        ),
        automaticallyImplyLeading: false,
      ),
    );
  }
}