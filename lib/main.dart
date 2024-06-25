import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vible_clone/pages/animated_splash_screen.dart';
import 'package:vible_clone/auth/auth_provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){

    return MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(_)=>AuthProvider()),
    ],
    child: Builder(
      builder: (BuildContext context){
        return const MaterialApp(
      home: AnimatedSplashScreen(),
    );
      }
      ),
    );
  }
}