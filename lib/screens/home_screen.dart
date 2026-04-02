import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instra_clone/modal/skeletonuihome.dart';
import 'package:instra_clone/view/imagesview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool x = true;
  @override
  void initState() {
    _loding();
    super.initState();
  }

  Future<void> _loding() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      x = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        body:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: x
                  ? Skeletonuihome()
                  : CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          leading: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child:
                                FaIcon(
                                  FontAwesomeIcons.plus,
                                  size: 28.sp,
                                  fontWeight: FontWeight.bold,
                                ).animate()..fadeIn(
                                  duration: Duration(milliseconds: 600),
                                  curve: Curves.easeInCirc,
                                ),
                          ),
                          centerTitle: true,
                          title:
                              Text(
                                'Instagram',
                                style: GoogleFonts.marckScript(
                                  fontSize: 35.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ).animate()..fadeIn(
                                duration: Duration(milliseconds: 600),
                                curve: Curves.easeInCirc,
                              ),

                          actions: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child:
                                  FaIcon(
                                    FontAwesomeIcons.heart,
                                    fontWeight: FontWeight.bold,
                                    size: 28.sp,
                                  ).animate()..fadeIn(
                                    duration: Duration(milliseconds: 600),
                                    curve: Curves.easeInCirc,
                                  ),
                            ),
                          ],
                        ),

                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 100.h,
                            child: ListView.builder(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  child:
                                      Container(
                                        margin: EdgeInsets.all(10),
                                        height: 95.h,
                                        width: 95.w,
                                        padding: const EdgeInsets.all(
                                          3,
                                        ).w, // outer ring thickness
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromARGB(
                                                205,
                                                255,
                                                213,
                                                0,
                                              ), // Yellow
                                              Color.fromARGB(
                                                202,
                                                255,
                                                123,
                                                0,
                                              ), // Orange
                                              Color.fromARGB(
                                                201,
                                                255,
                                                0,
                                                106,
                                              ), // Pink
                                              Color.fromARGB(
                                                191,
                                                211,
                                                0,
                                                197,
                                              ), // Purple
                                              Color.fromARGB(211, 117, 56, 250),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.all(
                                            3,
                                          ).w, // inner gap (black ring)
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors
                                                .transparent, // background gap
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.black,
                                            radius: 35,
                                            child: FaIcon(
                                              FontAwesomeIcons.user,
                                            ),
                                          ),
                                        ),
                                      ).animate().fadeIn(
                                        duration: Duration(milliseconds: 600),
                                        curve: Curves.easeInCirc,
                                      ),
                                );
                              },
                            ),
                          ),
                        ),

                        for (int i = 0; i < 10; i++)
                          SliverToBoxAdapter(
                            child: Imagesview().animate().fadeIn(
                              duration: Duration(milliseconds: 600),
                              curve: Curves.easeInCirc,
                            ),
                          ),
                      ],
                    ),
            ).animate()..fadeIn(
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInCirc,
            ),
      ),
    );
  }
}
