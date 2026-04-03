import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Imagesview extends StatelessWidget {
  final String imgurl;
  const Imagesview({super.key, required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(bottom: 30).h,
      height: 490.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 32, backgroundColor: Colors.white),
              SizedBox(width: 8.w),
              Text(
                'Ritam nandy',
                style: GoogleFonts.abel(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 162.w),
              FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                size: 26.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(height: 7.h),
          Container(
            height: 370.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgurl),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.heart,
                size: 22.sp,
                fontWeight: FontWeight.bold,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '33.3k',
                  style: GoogleFonts.abel(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.message,
                size: 22.sp,
                fontWeight: FontWeight.bold,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  '33.3k',
                  style: GoogleFonts.abel(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.retweet,
                size: 22.sp,
                fontWeight: FontWeight.bold,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  '33.3k',
                  style: GoogleFonts.abel(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.paperPlane,
                size: 22.sp,
                fontWeight: FontWeight.bold,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5).w,
                child: Text(
                  '33.3k',
                  style: GoogleFonts.abel(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 50.w),
              FaIcon(
                FontAwesomeIcons.bookmark,
                size: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Text(
              'uweguiwegweuigweui',
              textAlign: TextAlign.start,
              style: GoogleFonts.abel(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
