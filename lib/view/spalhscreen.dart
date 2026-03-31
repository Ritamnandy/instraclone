import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:instra_clone/view/navbarpage.dart';

class Spalhscreen extends StatefulWidget {
  const Spalhscreen({super.key});

  @override
  State<Spalhscreen> createState() => _SpalhscreenState();
}

class _SpalhscreenState extends State<Spalhscreen> {
  @override
  void initState() {
    _nextpage();
    super.initState();
  }

  Future<void> _nextpage() async {
    await Future.delayed(Duration(seconds: 4));
    if (!mounted) return;
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      PageRouteBuilder(
        pageBuilder: (_, animation, secondaryAnimation) {
          return Navbarpage();
        },
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Image.asset(
                  'assets/images/icon.png',
                  fit: BoxFit.cover,
                  height: 140.h,
                )
                .animate()
                .fadeIn(
                  delay: Duration(milliseconds: 900),
                  curve: Curves.easeInCirc,
                )
                .slideY(
                  end: 0,
                  begin: 1,
                  curve: Curves.easeIn,
                  duration: Duration(milliseconds: 1800),
                ),
      ),
    );
  }
}
