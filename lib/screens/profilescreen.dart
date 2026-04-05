import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.all(13.0).h,
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(14.0).h,
                  child: FaIcon(
                    FontAwesomeIcons.bars,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              title: Text(
                'User',
                style: GoogleFonts.abel(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                height: 180.h,
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(top: 10.h),
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage('asset/man.png'),
                          backgroundColor: const Color.fromARGB(
                            107,
                            253,
                            253,
                            253,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          'user_name\n',
                          style: GoogleFonts.abel(fontSize: 23.sp),
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentGeometry.xy(0.2, -0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          // mainAxisAlignment: .spaceEvenly,
                          children: [
                            SizedBox(width: 90.w),
                            Text(
                              '  0\nPost',
                              style: GoogleFonts.abel(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Text(
                              '  0\nFollowers',
                              style: GoogleFonts.abel(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Text(
                              '  0\nfollowing',
                              style: GoogleFonts.abel(
                                fontSize: 19.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Align(
                      alignment: AlignmentGeometry.xy(0, 0.9),
                      child: Row(
                        children: [
                          Container(
                            height: 30.h,
                            width: 130.w,
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Edit profile',
                                style: GoogleFonts.abel(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Container(
                            height: 30.h,
                            width: 130.w,
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Edit profile',
                                style: GoogleFonts.abel(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Container(
                            height: 30.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: FaIcon(FontAwesomeIcons.userPlus),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverAppBar(
              toolbarHeight: 0,
              bottom: TabBar(
                unselectedLabelStyle: TextStyle(color: Colors.white60),
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                labelColor: Colors.white,

                tabs: [
                  Tab(icon: FaIcon(FontAwesomeIcons.gripVertical, size: 27.sp)),
                  Tab(icon: FaIcon(FontAwesomeIcons.circlePlay, size: 27.sp)),
                  Tab(icon: FaIcon(FontAwesomeIcons.retweet, size: 27.sp)),
                  Tab(icon: FaIcon(FontAwesomeIcons.userTag, size: 27.sp)),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white10,
                height: 400.h,
                child: TabBarView(
                  children: [
                    Center(child: Text('1')),
                    Center(child: Text('2')),
                    Center(child: Text('3')),
                    Center(child: Text('4')),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          ],
        ),
      ),
    );
  }
}
