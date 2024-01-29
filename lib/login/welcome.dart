import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'login.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  FadeInDown(
                    delay: const Duration(milliseconds: 800),
                    duration: const Duration(milliseconds: 800),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/kondaasLogo.png',
                          width: 200,
                          height: 150,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 1.6.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeInUp(
                                  delay: const Duration(milliseconds: 700),
                                  duration: const Duration(milliseconds: 800),
                                  child: Center(
                                    child: Text(
                                      'Kondaas Smart App',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.acme(
                                          fontSize: 25.sp, fontWeight: FontWeight.w600
                                      )
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                FadeInUp(
                                  delay: const Duration(milliseconds: 900),
                                  duration: const Duration(milliseconds: 1000),
                                  child: Center(
                                    child: Text(
                                      'Prompt-dependable-quality',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.abyssinicaSil(
                                          fontSize: 15.sp, fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        FadeInUp(
                          delay: const Duration(milliseconds: 1000),
                          duration: const Duration(milliseconds: 1100),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(),
                                        ));
                                  },
                                  child: FadeInUp(
                                      delay: const Duration(milliseconds: 1100),
                                      duration: const Duration(milliseconds: 1200),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Next',
                                            style: GoogleFonts.montserrat(
                                                color: Colors.white
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.navigate_next_rounded,
                                            color: Colors.white,
                                          ),
                                        ],
                                      )

                                  ),
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Satoshi'),
                                      backgroundColor: Color(0xFF835DF1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 16),
                                  ),
                                ),

                              ),
                            ],
                          ),
                        ),
                       /* FadeInUp(
                          delay: const Duration(milliseconds: 1100),
                          duration: const Duration(milliseconds: 1200),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Color(0xFF835DF1),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ))
                            ],
                          ),
                        )*/
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}