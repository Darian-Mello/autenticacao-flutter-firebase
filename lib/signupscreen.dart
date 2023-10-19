import 'package:autenticacaoemail/loginscreen.dart';
import 'package:autenticacaoemail/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  String _email = "";
  String _senha = "";

  void _handleSignUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: _email, password: _senha);
      print("Usuário Registrado");
      Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
    } catch (e) {
      print("Houve um erro: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Por favor, informe o email";
                    }
                  },
                  onChanged: (value){
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _senhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Senha",
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Por favor, informe a senha";
                    }
                  },
                  onChanged: (value){
                    setState(() {
                      _senha = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()) {
                      _handleSignUp();
                    }
                },
                child: Text("Sign Up"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text("Já tenho cadastro"),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
