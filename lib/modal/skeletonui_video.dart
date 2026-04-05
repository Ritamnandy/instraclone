import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonuiVideo extends StatelessWidget {
  const SkeletonuiVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade400,
        child: Container(
          margin: EdgeInsets.only(top: 10),
          height: 610.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black12,
          ),
        ),
      ),
    );
  }
}
