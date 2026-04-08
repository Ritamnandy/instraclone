import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:instra_clone/provider/authprovider.dart';
import 'package:instra_clone/screens/signin_screen.dart';

import 'package:instra_clone/view/navbarpage.dart';
import 'package:provider/provider.dart';

class Spalhscreen extends StatefulWidget {
  const Spalhscreen({super.key});

  @override
  State<Spalhscreen> createState() => _SpalhscreenState();
}

class _SpalhscreenState extends State<Spalhscreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context.read<Authprovider>().checkLoging(),
    );
    _nextpage();
    super.initState();
  }

  Future<void> _nextpage() async {
    await Future.delayed(Duration(seconds: 3));
    if (!mounted) return;
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return Consumer<Authprovider>(
            builder: (_, auth, _) {
              return auth.isLoging ? Navbarpage() : SigninScreen();
            },
          );
        },
        transitionDuration: Duration(milliseconds: 700),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('asset/splash.png', fit: BoxFit.fill)
            .animate()
            .fadeIn(
              delay: Duration(milliseconds: 1800),
              curve: Curves.easeInOut,
            ),
      ),
    );
  }
}
