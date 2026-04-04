import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instra_clone/provider/authprovider.dart';
import 'package:instra_clone/provider/imageprovider.dart';
import 'package:instra_clone/provider/randomimages.dart';
import 'package:instra_clone/provider/randomuser.dart';
import 'package:instra_clone/provider/videpovider.dart';
import 'package:instra_clone/services/authservice.dart';
import 'package:instra_clone/view/spalhscreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Authservice.instance.getSharePref();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Authprovider()),
        ChangeNotifierProvider(create: (context) => Randomuser()),
        ChangeNotifierProvider(create: (context) => Randomimages()),
        ChangeNotifierProvider(create: (context) => Imageprovider()),
        ChangeNotifierProvider(create: (context) => Videpovider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: Spalhscreen(),
        );
      },
    );
  }
}
