import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instra_clone/provider/randomimages.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context.read<Randomimages>().getImages(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fetchimages = Provider.of<Randomimages>(context);
    return SafeArea(
      bottom: false,

      child: LiquidPullToRefresh(
        onRefresh: () async {
          await context.read<Randomimages>().getImages();
        },
        color: Colors.transparent,
        backgroundColor: Colors.white,
        borderWidth: 3,
        height: 200,
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
            for (int i = 0; i < fetchimages.data.length; i++)
              fetchimages.data.isEmpty || fetchimages.isloding
                  ? SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : SliverToBoxAdapter(
                      child: Row(
                        children: [
                          for (int i = 0; i < 3; i++)
                            Container(
                              margin: EdgeInsets.only(left: 3.w, bottom: 4.h),
                              width: 117.w,
                              height: 150.h,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    fetchimages.data[i]['urls']['regular'],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
          ],
        ),
      ),
    );
  }
}
