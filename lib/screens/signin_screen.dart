import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instra_clone/provider/authprovider.dart';
import 'package:instra_clone/screens/signup_screen.dart';
import 'package:instra_clone/view/navbarpage.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _fromkey = GlobalKey<FormState>();
  final passwordcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  bool _isvisible = false;
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Authprovider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 70.h),
            Image.asset(
              'assets/images/icon.png',
              fit: BoxFit.cover,
              height: 100.h,
            ).animate().fadeIn(
              duration: Duration(milliseconds: 1300),
              curve: Curves.easeInCirc,
            ),
            Text(
              'Instagram',
              style: GoogleFonts.marckScript(
                fontSize: 33.sp,
                fontWeight: FontWeight.bold,
              ),
            ).animate().fadeIn(
              duration: Duration(milliseconds: 1300),
              curve: Curves.easeInCirc,
            ),
            SizedBox(height: 12.h),
            Form(
              key: _fromkey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 35.w,
                      vertical: 10.h,
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }

                        String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                        RegExp regex = RegExp(pattern);

                        if (!regex.hasMatch(value)) {
                          return 'Enter a valid email';
                        }

                        return null;
                      },
                      style: TextStyle(fontSize: 18.sp),
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15).r,
                          borderSide: BorderSide(width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15).r,
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15).r,
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Colors.white,
                          ),
                        ),
                        suffixIcon: Icon(
                          Symbols.email,
                          color: ColorEffect.neutralValue,
                        ),
                        hint: Text(
                          'Enter emali',
                          style: GoogleFonts.abel(fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ).animate().fadeIn(
                    duration: Duration(milliseconds: 1300),
                    curve: Curves.easeInCirc,
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 35.w,
                      vertical: 10.h,
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }

                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }

                        return null;
                      },
                      obscureText: _isvisible,
                      style: TextStyle(fontSize: 18.sp),
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15).r,
                          borderSide: BorderSide(width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15).r,
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15).r,
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Colors.white,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isvisible = !_isvisible;
                            });
                          },
                          icon: _isvisible
                              ? Icon(Symbols.visibility)
                              : Icon(Symbols.visibility_off),
                        ),
                        hint: Text(
                          'Enter password',
                          style: GoogleFonts.abel(fontSize: 18.sp),
                        ),
                      ),
                    ),
                  ).animate().fadeIn(
                    duration: Duration(milliseconds: 1300),
                    curve: Curves.easeInCirc,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 140.w),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'forgot password?',
                          style: GoogleFonts.abel(
                            fontSize: 17.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ).animate().fadeIn(
                    duration: Duration(milliseconds: 1300),
                    curve: Curves.easeInCirc,
                  ),

                  ///button
                  InkWell(
                    onTap: () async {
                      if (_fromkey.currentState!.validate()) {
                        await auth.signIn(
                          passwordcontroller.text.trim(),
                          emailcontroller.text.trim(),
                        );

                        Navigator.push(
                          // ignore: use_build_context_synchronously
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                                  return Navbarpage();
                                },
                            transitionsBuilder:
                                (
                                  context,
                                  animation,
                                  secondaryAnimation,
                                  child,
                                ) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                          ),
                        );

                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Sign in faild')),
                        );
                      }
                      passwordcontroller.clear();
                      emailcontroller.clear();
                    },
                    child:
                        Container(
                          height: 48.h,
                          width: 285.w,
                          margin: EdgeInsets.symmetric(
                            horizontal: 35.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(205, 255, 213, 0), // Yellow
                                Color.fromARGB(202, 255, 123, 0), // Orange
                                Color.fromARGB(201, 255, 0, 106), // Pink
                                Color.fromARGB(191, 211, 0, 197), // Purple
                                Color.fromARGB(211, 117, 56, 250),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: GoogleFonts.abel(fontSize: 27.sp),
                            ),
                          ),
                        ).animate().fadeIn(
                          duration: Duration(milliseconds: 1500),
                          curve: Curves.easeInExpo,
                        ),
                  ),

                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 1.h, width: 80.w, color: Colors.white),
                      SizedBox(width: 10.w),
                      Text('or', style: GoogleFonts.abel(fontSize: 20.sp)),
                      SizedBox(width: 10.w),
                      Container(height: 1.h, width: 80.w, color: Colors.white),
                    ],
                  ).animate().fadeIn(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.easeInExpo,
                  ),

                  ///google signin
                  InkWell(
                    onTap: () {},
                    child:
                        Container(
                          height: 48.h,
                          width: 285.w,
                          margin: EdgeInsets.symmetric(
                            horizontal: 35.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            border: BoxBorder.all(
                              color: Colors.white,
                              width: 1.5,
                            ),

                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'sign in with ',
                                  style: GoogleFonts.abel(fontSize: 25.sp),
                                ),
                                SizedBox(width: 12.h),
                                Image.asset(
                                  'assets/images/g.png',
                                  fit: BoxFit.cover,
                                  width: 28.w,
                                  height: 28.h,
                                ),
                              ],
                            ),
                          ),
                        ).animate().fadeIn(
                          duration: Duration(milliseconds: 1500),
                          curve: Curves.easeInExpo,
                        ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: GoogleFonts.abel(fontSize: 17.sp),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return SignupScreen();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                      ),
                    );
                  },

                  child: Text(
                    'sign up',
                    style: GoogleFonts.abel(
                      fontSize: 20.sp,
                      color: Colors.white,
                      decorationStyle: TextDecorationStyle.solid,
                      decoration: TextDecoration.underline,
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ],
            ).animate().fadeIn(
              duration: Duration(milliseconds: 1300),
              curve: Curves.easeInCirc,
            ),
          ],
        ),
      ),
    );
  }
}
