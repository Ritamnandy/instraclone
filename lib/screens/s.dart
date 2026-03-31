
// ListView(
//           children: [
//             ///name
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
                // FaIcon(
                //   FontAwesomeIcons.plus,
                //   size: 28.sp,
                //   fontWeight: FontWeight.bold,
                // ),
//                 Text(
//                   'Instagram',
//                   style: GoogleFonts.marckScript(
//                     fontSize: 33.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
                // FaIcon(
                //   FontAwesomeIcons.heart,
                //   fontWeight: FontWeight.bold,
                //   size: 28.sp,
                // ),
//               ],
            // ).animate().fadeIn(
            //   duration: Duration(milliseconds: 1300),
            //   curve: Curves.easeInCirc,
            // ),
//             SizedBox(
//               height: 100.h,
//               width: MediaQuery.of(context).size.width,

//               child: ListView.builder(
//                 itemCount: 10,
//                 scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () {},
//                     child:
//                         Container(
//                           margin: EdgeInsets.all(10),
//                           height: 95.h,
//                           width: 95.w,
//                           padding: const EdgeInsets.all(
//                             3,
//                           ).w, // outer ring thickness
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             gradient: LinearGradient(
//                               colors: [
//                                 Color.fromARGB(205, 255, 213, 0), // Yellow
//                                 Color.fromARGB(202, 255, 123, 0), // Orange
//                                 Color.fromARGB(201, 255, 0, 106), // Pink
//                                 Color.fromARGB(191, 211, 0, 197), // Purple
//                                 Color.fromARGB(211, 117, 56, 250),
//                               ],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                           ),
//                           child: Container(
//                             padding: const EdgeInsets.all(
//                               3,
//                             ).w, // inner gap (black ring)
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: Colors.transparent, // background gap
//                             ),
//                             child: CircleAvatar(
//                               backgroundColor: Colors.black,
//                               radius: 35,
//                               child: FaIcon(FontAwesomeIcons.user),
//                             ),
//                           ),
//                         ).animate().fadeIn(
//                           duration: Duration(milliseconds: 1300),
//                           curve: Curves.easeInCirc,
//                         ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ).animate().fade(duration: 1200.ms, begin: 0.8, end: 1),