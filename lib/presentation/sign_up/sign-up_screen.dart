import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldex/app_localizations.dart';
import '../../theme/theme.dart';
import '../../widget/custom_button.dart';
import '../../widget/dotter_painter.dart';
import '../assets.dart';
import 'cubit/sing_up_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

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
              Positioned.fill(
                child: CustomPaint(
                  painter: DottedBackgroundPainter(),
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
          _buildStepIndicator(context.translate('signUp'), 0),
          _buildDivider(),
          _buildStepIndicator(context.translate('setPassword'), 1),
          _buildDivider(),
          _buildStepIndicator(context.translate('verify'), 2),
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
                            context.translate('firstName'),
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
                            context.translate('lastName'),
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
                          borderSide: BorderSide(color: Colors.white, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 14, 0, 5),
                      child: Row(
                        children: [
                          Text(
                            context.translate('phoneNumber'),
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
                          borderSide: BorderSide(color: Colors.white, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 14, 0, 5),
                      child: Row(
                        children: [
                          Text(
                            context.translate('verificationCode'),
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
                                borderSide: BorderSide(color: Colors.white, width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.blue, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        CustomButton(
                          text: context.translate('sendCode'),
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
                                  TextSpan(text: context.translate('iHave')),
                                  TextSpan(
                                    text: context.translate('readTheToS'),
                                    style: TextStyle(
                                      fontFamily: 'IRsans',
                                      color: colorGreen,
                                    ),
                                  ),
                                  TextSpan(text: context.translate('andAgreedWithThem')),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    CustomButton(
                      text: context.translate('confirmAndContinue'),
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
                context.translate('alreadyHaveAnAccount') + context.translate('logIn'),
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
                              context.translate('password'),
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
                            borderSide: BorderSide(color: Colors.white, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 14, 0, 5),
                        child: Row(
                          children: [
                            Text(
                              context.translate('repeatPassword'),
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
                            borderSide: BorderSide(color: Colors.white, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 43),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text(
                            context.translate('showPassword'),
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomButton(
                    text: context.translate('confirmAndContinue'),
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
                          context.translate('takeSelfie'),
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
                        Asset.genericAvatar,
                        width: 105,
                        height: 105,
                      ),
                    ),
                  ),
                  CustomButton(
                    text: context.translate('openCamera'),
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
                          context.translate('verifyWith'),
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  DropdownButtonFormField(
                    items: [
                      DropdownMenuItem(value: context.translate('passport'), child: Text(context.translate('passport'))),
                      DropdownMenuItem(value: context.translate('iDCard'), child: Text(context.translate('iDCard'))),
                      DropdownMenuItem(value: context.translate('driverLicense'), child: Text(context.translate('driverLicense'))),
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
                        borderSide: BorderSide(color: Colors.white, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    hint: Text(context.translate('selectDocument')),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 22, 0, 0),
                    child: CustomButton(
                      text: context.translate('takePhoto'),
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
                    text: context.translate('confirm'),
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
                text: context.translate('skipVerification'),
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
