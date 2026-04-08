import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instra_clone/modal/skeletonuihome.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:instra_clone/provider/imageprovider.dart';
import 'package:instra_clone/view/imagesview.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context.read<Imageprovider>().getImage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fetchusers = Provider.of<Imageprovider>(context);
    return SafeArea(
      bottom: false,

      child: Scaffold(
        body:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LiquidPullToRefresh(
                onRefresh: () async {
                  await context.read<Imageprovider>().getImage();
                },
                color: Colors.transparent,
                backgroundColor: Colors.white,
                borderWidth: 3,
                height: 200,
                springAnimationDurationInMilliseconds: 1300,
                child: fetchusers.data.isEmpty || fetchusers.isloding
                    ? Skeletonuihome()
                    : CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            leading: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child:
                                  FaIcon(
                                    FontAwesomeIcons.plus,
                                    size: 24.sp,
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
                                    fontSize: 30.sp,
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
                                      size: 24.sp,
                                    ).animate()..fadeIn(
                                      duration: Duration(milliseconds: 600),
                                      curve: Curves.easeInCirc,
                                    ),
                              ),
                            ],
                          ),

                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 75.h,
                              child: ListView.builder(
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {},
                                    child:
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          height: 85.h,
                                          width: 85.w,
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
                                                Color.fromARGB(
                                                  211,
                                                  117,
                                                  56,
                                                  250,
                                                ),
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

                          for (int i = 0; i < fetchusers.data.length; i++)
                            SliverToBoxAdapter(
                              child:
                                  Imagesview(
                                    imgurl: fetchusers
                                        .data[i]['urls']['regular']
                                        .toString(),
                                  ).animate().fadeIn(
                                    duration: Duration(milliseconds: 600),
                                    curve: Curves.easeInCirc,
                                  ),
                            ),
                        ],
                      ),
              ),
            ).animate().fadeIn(
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInCirc,
            ),
      ),
    );
  }
}
