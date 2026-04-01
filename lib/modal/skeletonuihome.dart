import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class Skeletonuihome extends StatelessWidget {
  const Skeletonuihome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: FaIcon(
                FontAwesomeIcons.plus,
                size: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Instagram',
              style: GoogleFonts.marckScript(
                fontSize: 33.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: FaIcon(
                FontAwesomeIcons.heart,
                fontWeight: FontWeight.bold,
                size: 28.sp,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 100.h,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade100,
                highlightColor: Colors.grey.shade500,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black38,
                    radius: 60,
                  ),
                ),
              );
            },
          ),
        ),
        for (int i = 0; i < 10; i++)
          Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.grey.shade500,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 35, backgroundColor: Colors.black38),
                      SizedBox(width: 12.w),
                      Container(
                        height: 30.h,
                        width: 240.w,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    margin: EdgeInsets.only(bottom: 20.sp),
                    height: 350.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
