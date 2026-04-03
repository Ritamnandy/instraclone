import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instra_clone/modal/skeletonui_video.dart';

class Videoscreen extends StatefulWidget {
  const Videoscreen({super.key});

  @override
  State<Videoscreen> createState() => _VideoscreenState();
}

class _VideoscreenState extends State<Videoscreen> {
  bool x = true;
  @override
  void initState() {
    isloding();
    super.initState();
  }

  void isloding() async {
    await Future.delayed(Duration(seconds: 2));
    if (mounted) {
      setState(() {
        x = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: x
          ? SkeletonuiVideo()
          : SafeArea(
              bottom: false,
              child: PageView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                scrollBehavior: ScrollBehavior(),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        height: 590.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.blueAccent),
                      ),
                      SizedBox(height: 5.h),
                      Align(
                        alignment: AlignmentGeometry.xy(0, -0.99),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.plus,
                                size: 27,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(width: 80.w),
                              Text(
                                'Reels',
                                style: GoogleFonts.abel(
                                  fontSize: 25.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Text(
                                'Friends',
                                style: GoogleFonts.abel(
                                  fontSize: 25.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        top: 200.h,
                        left: 300.w,
                        right: 0.w,
                        bottom: 0.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.heart, size: 27.sp),
                            Text(
                              '1',
                              style: GoogleFonts.abel(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            FaIcon(FontAwesomeIcons.message, size: 27.sp),
                            Text(
                              '1',
                              style: GoogleFonts.abel(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            FaIcon(FontAwesomeIcons.retweet, size: 27.sp),
                            Text(
                              '1',
                              style: GoogleFonts.abel(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            FaIcon(FontAwesomeIcons.paperPlane, size: 27.sp),
                            Text(
                              '1',
                              style: GoogleFonts.abel(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            FaIcon(FontAwesomeIcons.bookmark, size: 27.sp),
                            Text(
                              '1',
                              style: GoogleFonts.abel(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            FaIcon(
                              FontAwesomeIcons.ellipsisVertical,
                              size: 27.sp,
                            ),
                          ],
                        ),
                      ),

                      Align(
                        alignment: AlignmentGeometry.xy(0, 0.84),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('asset/text.png'),
                                backgroundColor: Colors.black26,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                'Users',
                                style: GoogleFonts.abel(fontSize: 21.sp),
                              ),
                              SizedBox(width: 25.w),
                              Container(
                                height: 32.h,
                                width: 100.w,
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Follow',
                                    style: GoogleFonts.abel(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Center(
                        child: Text(
                          index.toString(),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ).animate().fadeIn(
              duration: Duration(milliseconds: 700),
              curve: Curves.easeInCirc,
            ),
    );
  }
}
