import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:vible_clone/auth/auth_provider.dart';
import 'login_page.dart';
import 'wallet_page.dart';
import 'profile_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (index == 1) {
      if (!authProvider.authModel.isLoggedIn) {
        _navigateToLogin(1);
      } else {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WalletPage()));
      }
    } else if (index == 2) {
      if (!authProvider.authModel.isLoggedIn) {
        _navigateToLogin(2);
      } else {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage()));
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _navigateToLogin(int sourceIndex) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginPage(sourceIndex: sourceIndex),
      ),
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
