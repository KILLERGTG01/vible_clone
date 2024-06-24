import 'package:flutter/material.dart';
import 'home_screen.dart';
class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});
  @override
  State<AnimatedSplashScreen> createState() {
    return _AnimatedSplashScreenState();
  }
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late AnimationController _vController;
  late Animation<double> _imageAnimation;
  late Animation<double> _vAnimation;

  @override
  void initState() {
    super.initState();

    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _imageAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.easeIn),
    );

    _vController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _vAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _vController, curve: Curves.elasticOut),
    );

    _imageController.forward().then((_) {
      _vController.forward();
    });

    _loadResources();
  }

  Future<void> _loadResources() async {
    // Simulate a network request or some async task
    await Future.delayed(const Duration(seconds: 5));
    // Navigate to the home screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  void dispose() {
    _imageController.dispose();
    _vController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            FadeTransition(
              opacity: _imageAnimation,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/splash.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            ScaleTransition(
              scale: _vAnimation,
              child: const Text(
                'V',
                style: TextStyle(
                  fontSize: 200,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
