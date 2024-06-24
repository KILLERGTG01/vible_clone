//import 'package:dio/dio.dart';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex= 0;
    void onItemTapped(int index){
      setState(() {
        selectedIndex= index;
      });
    }
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/home.jpg',
            fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
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
          items:   const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ''
            
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
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          onTap: onItemTapped,
      )
    )
    );
  }
}