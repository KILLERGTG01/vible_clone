import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vible_clone/auth/auth_provider.dart';
import 'wallet_page.dart';
import 'profile_page.dart';

class LoginPage extends StatelessWidget {
  final int sourceIndex;
  LoginPage({super.key, required this.sourceIndex});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
      
  @override
  Widget build(BuildContext context) {    
    void exitscreentowalletPage(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WalletPage()),
      );}
    void exitscreentoprofilePage(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
    void showMessage(){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
    return Scaffold(
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'V',
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  ),
                ),
                obscureText: true,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final username = _usernameController.text;
                  final password = _passwordController.text;
                  await Provider.of<AuthProvider>(context, listen: false).login(username, password);
                  if(!context.mounted) return;
                  final isLoggedIn = Provider.of<AuthProvider>(context, listen: false).authModel.isLoggedIn;
                  if (isLoggedIn) {
                    if (sourceIndex == 1) {
                      exitscreentowalletPage();
                    } else if (sourceIndex == 2) {
                      exitscreentoprofilePage();
                    }
                  } else {
                    showMessage();
                  }
                },
                
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
