import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:kondaas/screens/HomeScreen.dart';
import 'package:kondaas/services/Basic_service.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController plantidController = TextEditingController();

  var plantid;
  var focusNodeEmail = FocusNode();
  var focusNodePassword = FocusNode();
  var focusNodePlantId = FocusNode();
  bool isFocusedEmail = false;
  bool isFocusedPassword = false;
  bool isFocusedPlantId = false;

  @override
  void initState() {
    // TODO: implement initState
    focusNodeEmail.addListener(() {
      setState(() {
        isFocusedEmail = focusNodeEmail.hasFocus;
      });
    });
    focusNodePassword.addListener(() {
      setState(() {
        isFocusedPassword = focusNodePassword.hasFocus;
      });
    });
    focusNodePlantId.addListener(() {
      setState(() {
        isFocusedPlantId = focusNodePlantId.hasFocus;
      });
    });
    super.initState();
  }
  void updatePlantId(){
    plantid = plantidController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      FadeInDown(
                        delay: const Duration(milliseconds: 900),
                        duration: const Duration(milliseconds: 1000),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              IconlyBroken.arrow_left,
                              size: 3.6.h,
                            )),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInDown(
                              delay: const Duration(milliseconds: 700),
                              duration: const Duration(milliseconds: 800),
                              child: Text(
                                'Welcome Back...',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            FadeInDown(
                              delay: const Duration(milliseconds: 800),
                              duration: const Duration(milliseconds: 900),
                              child: Text(
                                'Let\'s Enter the Plant Id',
                                style: GoogleFonts.abel(
                                  fontSize: 23.sp,
                                  fontWeight: FontWeight.w400,
                                )
                              ),
                            ),

                            /*FadeInDown(
                              delay: const Duration(milliseconds: 600),
                              duration: const Duration(milliseconds: 700),
                              child: Text(
                                'You\'ve been missed!',
                                style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )*/
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      /*FadeInDown(
                        delay: const Duration(milliseconds: 700),
                        duration: const Duration(milliseconds: 800),
                        child: const Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      FadeInDown(
                        delay: const Duration(milliseconds: 600),
                        duration: const Duration(milliseconds: 700),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 0.8.h),
                          padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: .3.h),
                          decoration: BoxDecoration(
                              color:
                              isFocusedEmail ? Colors.white : Color(0xFFF1F0F5),
                              border:
                              Border.all(width: 1, color: Color(0xFFD2D2D4)),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                if (isFocusedEmail)
                                  BoxShadow(
                                      color: Color(0xFF835DF1).withOpacity(.3),
                                      blurRadius: 4.0,
                                      spreadRadius: 2.0
                                    // Glow Color
                                  )
                              ]),
                          child: TextField(
                            style: TextStyle(fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Your Email'),
                            focusNode: focusNodeEmail,
                          ),
                        ),
                      ),*/
                      /*SizedBox(
                        height: 2.h,
                      ),
                      FadeInDown(
                        delay: const Duration(milliseconds: 500),
                        duration: const Duration(milliseconds: 600),
                        child: const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      FadeInDown(
                        delay: const Duration(milliseconds: 400),
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 0.8.h),
                          padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: .3.h),
                          decoration: BoxDecoration(
                              color: isFocusedPassword
                                  ? Colors.white
                                  : Color(0xFFF1F0F5),
                              border:
                              Border.all(width: 1, color: Color(0xFFD2D2D4)),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                if (isFocusedPassword)
                                  BoxShadow(
                                      color: Color(0xFF835DF1).withOpacity(.3),
                                      blurRadius: 4.0,
                                      spreadRadius: 2.0
                                    // Glow Color
                                  )
                              ]),
                          child: TextField(
                            style: const TextStyle(fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                  size: 16.sp,
                                ),
                                border: InputBorder.none,
                                hintText: 'Password'),
                            focusNode: focusNodePassword,
                          ),
                        ),
                      ),*/

                      SizedBox(
                        height: 2.h,
                      ),
                      FadeInDown(
                        delay: const Duration(milliseconds: 400),
                        duration: const Duration(milliseconds: 500),
                        child: const Text(
                          'Plant ID',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      FadeInDown(
                        delay: const Duration(milliseconds: 300),
                        duration: const Duration(milliseconds: 400),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 0.8.h),
                          padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: .3.h),
                          decoration: BoxDecoration(
                              color:
                              isFocusedPlantId ? Colors.white : Color(0xFFF1F0F5),
                              border:
                              Border.all(width: 1, color: Color(0xFFD2D2D4)),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                if (isFocusedPlantId)
                                  BoxShadow(
                                      color: Color(0xFF835DF1).withOpacity(.3),
                                      blurRadius: 4.0,
                                      spreadRadius: 2.0
                                    // Glow Color
                                  )
                              ]),
                          child: TextField(
                            controller: plantidController,
                            style: TextStyle(fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Plant ID'),
                            focusNode: focusNodePlantId,

                          ),
                        ),
                      ),
                      const Expanded(
                          child: SizedBox(
                            height: 10,
                          )),

                      FadeInUp(
                        delay: const Duration(milliseconds: 600),
                        duration: const Duration(milliseconds: 700),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  updatePlantId();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(plantid: plantid),
                                      ));
                                },
                                child: FadeInUp(
                                    delay: const Duration(milliseconds: 700),
                                    duration: const Duration(milliseconds: 800),
                                    child: Text(
                                        'Submit',
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white
                                      ),
                                    )
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    textStyle: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Satoshi'),
                                    backgroundColor: Color(0xFF835DF1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 16)),
                              ),
                            )
                          ],
                        ),
                      ),
                      /*FadeInUp(
                        delay: const Duration(milliseconds: 800),
                        duration: const Duration(milliseconds: 900),
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
                ),
              ))
        ],
      ),
    );
  }
}