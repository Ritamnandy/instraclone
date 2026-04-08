import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instra_clone/screens/home_screen.dart';
import 'package:instra_clone/screens/profilescreen.dart';
import 'package:instra_clone/screens/searchscreen.dart';
import 'package:instra_clone/screens/sharescreen.dart';
import 'package:instra_clone/screens/videoscreen.dart';

class Navbarpage extends StatefulWidget {
  const Navbarpage({super.key});

  @override
  State<Navbarpage> createState() => _NavbarpageState();
}

class _NavbarpageState extends State<Navbarpage> {
  int _index = 0;
  final List _pages = [
    HomeScreen(),
    Videoscreen(),
    Sharescreen(),
    Searchscreen(),
    Profilescreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.transparent,

        height: 45.sp,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: [
          CurvedNavigationBarItem(
            child: FaIcon(FontAwesomeIcons.solidHouse, size: 25.sp),
          ),

          CurvedNavigationBarItem(
            child: FaIcon(FontAwesomeIcons.solidCirclePlay, size: 25.sp),
          ),
          CurvedNavigationBarItem(
            child: FaIcon(FontAwesomeIcons.solidPaperPlane, size: 25.sp),
          ),
          CurvedNavigationBarItem(
            child: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 25.sp),
          ),
          CurvedNavigationBarItem(
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('asset/man.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
