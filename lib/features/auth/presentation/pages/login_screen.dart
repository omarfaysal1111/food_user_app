import 'package:flutter/material.dart';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        children: [
TextFormField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),

TextFormField(controller: passwordController, decoration: const InputDecoration(labelText: 'Password')),
          MaterialButton(onPressed: (){},child: Text("Login"),),
          
        ],
      )
      
    );
  }

  
}
