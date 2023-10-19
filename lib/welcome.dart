import 'package:autenticacaoemail/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String? _email = _auth.currentUser!.email;

    return Scaffold(
      appBar: AppBar(
        title: Text("dashboard"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Logado com: $_email"),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text("Sair")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
