import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instra_clone/modal/skeletonui_video.dart';
import 'package:video_player/video_player.dart';

class Playvideo extends StatefulWidget {
  final String playurl;
  final bool isactive;
  const Playvideo({super.key, required this.playurl, required this.isactive});

  @override
  State<Playvideo> createState() => _PlayvideoState();
}

class _PlayvideoState extends State<Playvideo> {
  late VideoPlayerController _controller;
  bool isLike = false;
  bool likeButton = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.playurl))
      ..initialize().then((_) {
        setState(() {});
        _controller.setVolume(1.0);
        _controller.setLooping(true);
        if (widget.isactive) {
          _controller.play();
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
      child: GestureDetector(
        onDoubleTap: () async {
          setState(() {
            isLike = true;
            if (widget.isactive) {
              likeButton = true;
            }
          });

          await Future.delayed(Duration(milliseconds: 1300));
          setState(() {
            isLike = false;
          });
        },
        child: Stack(
          children: [
            Container(
              height: 610.h,

              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : const SkeletonuiVideo(),
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
                  IconButton(
                    onPressed: () {
                      setState(() {
                        likeButton = !likeButton;
                      });
                    },
                    icon: likeButton
                        ? FaIcon(
                            FontAwesomeIcons.solidHeart,
                            size: 27.sp,
                            color: Colors.redAccent,
                          )
                        : FaIcon(FontAwesomeIcons.heart, size: 27.sp),
                  ),
                  Text(
                    '1',
                    style: GoogleFonts.abel(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: FaIcon(FontAwesomeIcons.message, size: 27.sp),
                  ),
                  Text(
                    '1',
                    style: GoogleFonts.abel(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: FaIcon(FontAwesomeIcons.retweet, size: 27.sp),
                  ),
                  Text(
                    '1',
                    style: GoogleFonts.abel(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: FaIcon(FontAwesomeIcons.paperPlane, size: 27.sp),
                  ),
                  Text(
                    '1',
                    style: GoogleFonts.abel(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: FaIcon(FontAwesomeIcons.bookmark, size: 27.sp),
                  ),
                  Text(
                    '1',
                    style: GoogleFonts.abel(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: FaIcon(
                      FontAwesomeIcons.ellipsisVertical,
                      size: 27.sp,
                    ),
                  ),
                ],
              ),
            ),

            Align(
              alignment: AlignmentGeometry.xy(0, 0.92),
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
                    Text('Users', style: GoogleFonts.abel(fontSize: 21.sp)),
                    SizedBox(width: 25.w),
                    Container(
                      height: 32.h,
                      width: 100.w,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 2),
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

            isLike
                ? Align(
                    alignment: AlignmentGeometry.xy(-0.1, -0.1),
                    child:
                        SizedBox(
                          height: 120.h,
                          width: 120.w,

                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.solidHeart,
                              color: Colors.redAccent,
                              size: 100.sp,
                            ),
                          ),
                        ).animate().scale(
                          begin: Offset(0.8, 0.8),
                          end: Offset(1, 1),
                          duration: Duration(milliseconds: 1200),
                          curve: Curves.easeInOut,
                        ),
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
