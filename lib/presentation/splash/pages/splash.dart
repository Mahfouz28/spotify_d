import 'package:flutter/material.dart';
import 'package:spotify/presentation/intro/pages/get_started_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirict();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 60,
          width: 196,
          child: Image.asset("assets/vectors/spotifyLogo.png"),
        ),
      ),
    );
  }

  Future<void> redirict() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Getstartedpage()),
    );
  }
}
