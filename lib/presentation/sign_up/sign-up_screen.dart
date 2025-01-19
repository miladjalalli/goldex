import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/theme.dart';
import '../../widget/custom_button.dart';
import '../login/login_screen.dart';
import 'cubit/sing_up_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final points = generatePoints(size: Size(400, 800), count: 100); // Generate 100 points

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingUpCubit, SingUpState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        SingUpCubit cubit = context.read<SingUpCubit>();
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              // Background with dots
              Positioned.fill(
                child: CustomPaint(
                  painter: DottedBackgroundPainter(points),
                ),
              ),
              // Login content
              Align(
                child: Column(
                  children: [
                    _buildHeader(),
                    Expanded(
                      child: PageView(
                        controller: cubit.pageController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          _buildSignUpStep(),
                          _buildSetPasswordStep(),
                          _buildVerifyStep(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(47, 70, 47, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStepIndicator("Sign Up", 0),
          _buildDivider(),
          _buildStepIndicator("Set Password", 1),
          _buildDivider(),
          _buildStepIndicator("Verify", 2),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(String title, int index) {
    SingUpCubit cubit = context.read<SingUpCubit>();
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: cubit.currentIndex == index ? Colors.white : cubit.currentIndex >= index ? Colors.green : Colors.white60,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 2,
      width: 30,
      color: Colors.white,
    );
  }

  Widget _buildSignUpStep() {
    SingUpCubit cubit = context.read<SingUpCubit>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 0, 21, 35),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 540,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: colorLightGrey,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                      child: Row(
                        children: [
                          Text(
                              'First Name',
                              textAlign: TextAlign.left,
                              textDirection: TextDirection.ltr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)
                          ),
                        ],
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.white, width: 1.5), // رنگ border پیش‌فرض
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.blue, width: 2.0), // رنگ border هنگام فوکوس
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 14, 0, 5),
                      child: Row(
                        children: [
                          Text(
                              'Last Name',
                              textAlign: TextAlign.left,
                              textDirection: TextDirection.ltr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)
                          ),
                        ],
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.white, width: 1.5), // رنگ border پیش‌فرض
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.blue, width: 2.0), // رنگ border هنگام فوکوس
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 14, 0, 5),
                      child: Row(
                        children: [
                          Text(
                              "Phone Number",
                              textAlign: TextAlign.left,
                              textDirection: TextDirection.ltr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)
                          ),
                        ],
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        suffixIcon: Icon(Icons.error, color: Colors.red),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.white, width: 1.5), // رنگ border پیش‌فرض
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.blue, width: 2.0), // رنگ border هنگام فوکوس
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 14, 0, 5),
                      child: Row(
                        children: [
                          Text(
                              "Verification Code",
                              textDirection: TextDirection.ltr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.white, width: 1.5), // رنگ border پیش‌فرض
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.blue, width: 2.0), // رنگ border هنگام فوکوس
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        CustomButton(
                          text: "Send Code",
                          backgroundColor: colorGreen,
                          textColor: Colors.white,
                          height: 40,
                          width: 144,
                          borderColor: colorGreen,
                          borderRadius: BorderRadius.circular(25),
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {}, // Handle ToS link tap
                            child: RichText(
                              textAlign: TextAlign.justify,
                              textDirection: TextDirection.ltr,
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                children: [
                                  TextSpan(text: 'I have '),
                                  TextSpan(
                                    text:
                                    'read the ToS',
                                    style: TextStyle(
                                      fontFamily: 'IRsans',
                                      color: colorGreen,
                                    ),
                                  ),
                                  TextSpan(text: ' and agreed with them',),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    CustomButton(
                      text: "Confirm & Continue",
                      backgroundColor: colorGreen,
                      textColor: Colors.white,
                      height: 50,
                      width: 300,
                      borderColor: colorGreen,
                      borderRadius: BorderRadius.circular(25),
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        cubit.goToNextPage();
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {},
              child: Text(
                "Already have an account? Log In",
                style: TextStyle(color: Colors.white60),
              ),
            ),
            const SizedBox(height: 5),
            CustomButton(
              text: "Log in",
              backgroundColor: Colors.transparent,
              textColor: Colors.white,
              height: 50,
              width: 300,
              borderColor: Colors.white,
              borderRadius: BorderRadius.circular(25),
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              onPressed: () {
                // Handle Sign Up action
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSetPasswordStep() {
    SingUpCubit cubit = context.read<SingUpCubit>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 0, 21, 35),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 540,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: colorLightGrey,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 14, 0, 5),
                        child: Row(
                          children: [
                            Text(
                                "Password",
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.white, width: 1.5), // رنگ border پیش‌فرض
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.blue, width: 2.0), // رنگ border هنگام فوکوس
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 14, 0, 5),
                        child: Row(
                          children: [
                            Text(
                              "Repeat Password",
                              textAlign: TextAlign.left,
                              textDirection: TextDirection.ltr, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.white, width: 1.5), // رنگ border پیش‌فرض
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.blue, width: 2.0), // رنگ border هنگام فوکوس
                          ),
                        ),
                      ),
                      SizedBox(height: 43),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text(
                            "Show Password",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomButton(
                    text: "Confirm & Continue",
                    backgroundColor: colorGreen,
                    textColor: Colors.white,
                    height: 50,
                    width: 300,
                    borderColor: colorGreen,
                    borderRadius: BorderRadius.circular(25),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      cubit.goToNextPage();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerifyStep() {
    SingUpCubit cubit = context.read<SingUpCubit>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 0, 21, 35),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 540,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: colorLightGrey,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 14, 0, 5),
                    child: Row(
                      children: [
                        Text(
                          "Take a Selfie",
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 21),
                    child: Center(
                      child: Image.asset(
                        'assets/images/generic_avatar.png',
                        width: 105,
                        height: 105,
                      ),
                    ),
                  ),
                  CustomButton(
                    text: "Open Camera",
                    backgroundColor: colorGreen,
                    textColor: Colors.white,
                    height: 40,
                    width: 144,
                    borderColor: colorGreen,
                    borderRadius: BorderRadius.circular(25),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 35, 0, 12),
                    child: Row(
                      children: [
                        Text(
                          "Verify with",
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(child: Text("Passport"), value: "Passport"),
                      DropdownMenuItem(child: Text("ID Card"), value: "ID Card"),
                      DropdownMenuItem(child: Text("Driver License"), value: "Driver License"),
                    ],
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.white, width: 1.5), // رنگ border پیش‌فرض
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0), // رنگ border هنگام فوکوس
                      ),
                    ),
                    hint: Text("Select Document"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 22, 0, 0),
                    child: CustomButton(
                      text: "Take Photo",
                      backgroundColor: colorGreen,
                      textColor: Colors.white,
                      height: 40,
                      width: 144,
                      borderColor: colorGreen,
                      borderRadius: BorderRadius.circular(25),
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Spacer(),
                  CustomButton(
                    text: "Confirm",
                    backgroundColor: colorGreen,
                    textColor: Colors.white,
                    height: 50,
                    width: 300,
                    borderColor: colorGreen,
                    borderRadius: BorderRadius.circular(25),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      cubit.goToPreviousPage();
                    },
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: CustomButton(
                text: "Skip Verification",
                backgroundColor: colorDarkGrey,
                textColor: Colors.white,
                height: 50,
                width: 300,
                borderColor: colorDarkGrey,
                borderRadius: BorderRadius.circular(25),
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                onPressed: () {
                  cubit.goToNextPage();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
