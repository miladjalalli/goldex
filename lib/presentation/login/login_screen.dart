import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goldex/app_localizations.dart';
import 'package:goldex/presentation/home/home_screen.dart';
import 'package:goldex/theme/theme.dart';
import 'package:goldex/widget/goldex_text_form_field.dart';
import '../../widget/custom_button.dart';
import '../../widget/dotter_painter.dart';
import '../assets.dart';
import '../sign_up/cubit/sing_up_cubit.dart';
import '../sign_up/sign-up_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Asset.login),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(61, 90, 61, 17),
                    child: Column(
                      children: [
                        Text(
                          context.translate('signInToYourAccount'),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          context.translate('enterYourEmailAndPasswordToLogIn'),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 363,
                    height: 411,
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
                    decoration: BoxDecoration(
                      color: colorLightGrey,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 25,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        GoldexTextFormField(
                          title: context.translate("phoneNumberEmail"),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 8,),
                        GoldexTextFormField(
                          title: context.translate("password"),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 14, 12, 14),
                            child: SizedBox(
                              width: 24, // Set the width
                              height: 24, // Set the height
                              child: SvgPicture.asset(
                                Asset.hide,
                                fit: BoxFit.contain, // Ensure it fits within the box
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Transform.scale(
                                    scale: 19 / 19,
                                    child: Checkbox(
                                      value: false,
                                      onChanged: (val) {},
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5), // Set border radius
                                      ),
                                      side: BorderSide(width: 2, color: colorLightGreyModal2),
                                      // Border weight & color
                                      visualDensity: VisualDensity(horizontal: -1, vertical: -4),
                                      // Remove padding
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduce touch target size
                                    ),
                                  ),
                                  Text(
                                    context.translate('rememberMe'),
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: colorLightGreyModal10),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Handle forgot password
                                },
                                child: Text(
                                  context.translate('forgotPassword'),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 17.0),
                          child: CustomButton(
                            text: context.translate('logIn'),
                            backgroundColorStart: Theme.of(context).colorScheme.primary,
                            backgroundColorEnd: Theme.of(context).colorScheme.secondary,
                            textColor: Colors.white,
                            height: 50,
                            width: 300,
                            borderColor: colorGreen,
                            borderRadius: BorderRadius.circular(25),
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomeScreen()),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text(
                            context.translate("useYourFingerprint"),
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: SvgPicture.asset(
                              Asset.fingerPrint),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    context.translate('dontHaveAnAccount'),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    text: context.translate('signUp'),
                    backgroundColorStart: Colors.transparent,
                    textColor: colorGreen,
                    height: 50,
                    width: 300,
                    borderColor: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: colorGreen
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return BlocProvider<SingUpCubit>(
                          create: (context) => SingUpCubit(),
                          child: const SignUpScreen(),
                        );
                      }));
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
