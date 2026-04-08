import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instra_clone/provider/randomuser.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class Sharescreen extends StatefulWidget {
  const Sharescreen({super.key});

  @override
  State<Sharescreen> createState() => _SharescreenState();
}

class _SharescreenState extends State<Sharescreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context.read<Randomuser>().getUser(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fetchusers = Provider.of<Randomuser>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'User',
          style: GoogleFonts.abel(fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: FaIcon(
              FontAwesomeIcons.solidPenToSquare,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: LiquidPullToRefresh(
        color: Colors.transparent,
        backgroundColor: Colors.white,
        borderWidth: 3,
        height: 200,

        onRefresh: () async {
          await context.read<Randomuser>().getUser();
        },
        child: fetchusers.data.isEmpty || fetchusers.isloding
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
            : ListView(
                children: [
                  SizedBox(height: 15.h),
                  Container(
                    height: 50.h,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(20).r,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          hint: Text(
                            'Search',
                            style: GoogleFonts.abel(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0).w,
                            child: FaIcon(FontAwesomeIcons.magnifyingGlass),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 90.h,
                    padding: EdgeInsets.only(left: 6.w, right: 6.w),
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 4.w),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey.shade800,
                            backgroundImage: NetworkImage(
                              fetchusers
                                  .data['results'][index]['picture']['medium'],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Message',
                          style: GoogleFonts.abel(fontSize: 25.sp),
                        ),
                        Text(
                          'Requests',
                          style: GoogleFonts.abel(
                            fontSize: 25.sp,
                            color: const Color.fromARGB(255, 159, 104, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 13.h),
                  for (int i = 10; i <= 40; i++)
                    Padding(
                      padding: EdgeInsets.only(bottom: 13.sp),
                      child: Row(
                        mainAxisAlignment: .spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey.shade800,
                              backgroundImage: NetworkImage(
                                fetchusers
                                    .data['results'][i]['picture']['medium'],
                              ),
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Text(
                            '${fetchusers.data['results'][i]['name']['first']}_${fetchusers.data['results'][i]['name']['last']}',
                            style: GoogleFonts.abel(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(width: 80.w),
                          FaIcon(FontAwesomeIcons.camera, size: 27.sp),
                        ],
                      ),
                    ),

                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text(
                          'Accounts to follow',
                          style: GoogleFonts.abel(
                            fontSize: 21.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'See all',
                          style: GoogleFonts.abel(
                            fontSize: 25.sp,
                            color: const Color.fromARGB(255, 159, 104, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 13.sp),
                  for (int j = 41; j <= 60; j++)
                    Padding(
                      padding: EdgeInsets.only(bottom: 13.sp),
                      child: Row(
                        mainAxisAlignment: .spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey.shade800,
                              backgroundImage: NetworkImage(
                                fetchusers
                                    .data['results'][j]['picture']['medium'],
                              ),
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Text(
                            '__${fetchusers.data['results'][j]['name']['last']}',
                            style: GoogleFonts.abel(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 35.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 103, 50, 250),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  'Follow',
                                  style: GoogleFonts.abel(
                                    fontSize: 19.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 14.sp),
                            child: FaIcon(FontAwesomeIcons.x, size: 20),
                          ),

                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
