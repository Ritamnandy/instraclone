import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,

      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 80,
            title: Container(
              height: 50.h,
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
                      'Search with Meta AI ',
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
          ),
          for (int i = 1; i <= 10; i++)
            SliverToBoxAdapter(
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      margin: EdgeInsets.only(left: 3.w, bottom: 4.h),
                      width: 115.w,
                      height: 150.h,
                      decoration: BoxDecoration(color: Colors.grey.shade900),
                    ),
                ],
              ),
            ),
          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
        ],
      ),
    );
  }
}
