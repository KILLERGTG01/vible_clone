import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vible_clone/auth/auth_provider.dart';
import 'pages/login_page.dart';
import 'pages/wallet_page.dart';
import 'pages/profile_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (index == 1) {
      if (!authProvider.authModel.isLoggedIn) {
        _showLoginPopup();
      } else {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WalletPage()));
      }
    } else if (index == 2) {
      if (!authProvider.authModel.isLoggedIn) {
        _showLoginPopup();
      } else {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage()));
      }
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen()));
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  void _showLoginPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Login Required',
            ),
          content: const Text(
            'You need to be logged in to access this page.'
            ),
          backgroundColor: Colors.black,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: const Text('Login'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/home.jpg',
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),
          const Center(
            child: Text(
              'Get Empowered.',
              style: TextStyle(
                fontSize: 40,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}