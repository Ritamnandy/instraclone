import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:instra_clone/modal/skeletonui_video.dart';
import 'package:instra_clone/provider/videpovider.dart';
import 'package:instra_clone/view/playvideo.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class Videoscreen extends StatefulWidget {
  const Videoscreen({super.key});

  @override
  State<Videoscreen> createState() => _VideoscreenState();
}

class _VideoscreenState extends State<Videoscreen> {
  int currentindex = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context.read<Videpovider>().getvideo(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fetchvideos = Provider.of<Videpovider>(context);
    return LiquidPullToRefresh(
      onRefresh: () async {
        await context.read<Videpovider>().getvideo();
      },
      color: Colors.transparent,
      backgroundColor: Colors.white,
      borderWidth: 3,
      height: 200,
      child: Scaffold(
        body: fetchvideos.isloding || fetchvideos.data.isEmpty
            ? SkeletonuiVideo()
            : SafeArea(
                bottom: false,
                child: PageView.builder(
                  itemCount: fetchvideos.data['hits'].length,
                  onPageChanged: (value) {
                    setState(() {
                      currentindex = value;
                    });
                  },
                  scrollDirection: Axis.vertical,
                  scrollBehavior: ScrollBehavior(),
                  itemBuilder: (context, index) {
                    return Playvideo(
                      isactive: index == currentindex,
                      playurl: fetchvideos
                          .data['hits'][index]['videos']['small']['url'],
                    );
                  },
                ),
              ).animate().fadeIn(
                duration: Duration(milliseconds: 700),
                curve: Curves.easeInCirc,
              ),
      ),
    );
  }
}
