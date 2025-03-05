import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/core/dependency_injection.dart';
import 'package:goldex/core/theme/theme.dart';
import 'package:goldex/domain/repository/secure_storage_service.dart';
import 'package:goldex/core/assets.dart';
import 'package:goldex/presentation/home/home_screen.dart';
import 'package:goldex/presentation/login/cubit/login_cubit.dart';
import 'package:goldex/presentation/sign_up/cubit/sing_up_cubit.dart';
import 'package:goldex/presentation/sign_up/sign-up_screen.dart';
import 'package:goldex/widget/custom_button.dart';
import 'package:goldex/widget/goldex_text_form_field.dart';

import '../../widget/size_config.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider(
        create: (context) => sl<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state)  {
            LoginCubit cubit = context.read<LoginCubit>();
            if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
            if (state is LoginSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }
          },
          builder: (context, state) {
            LoginCubit cubit = context.read<LoginCubit>();
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Asset.background),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Asset.goldexLogo,
                          width: 96,
                          height: 96,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(61, 125, 61, 17),
                            child: Column(
                              children: [
                                Text(context.translate('signInToYourAccount'),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Theme.of(context).colorScheme.surface,
                                        height: 1.4,
                                        fontSize: SizeConfig.scaleWidth(32),
                                        fontFamily: 'interBold',
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 9),
                                Text(
                                  context.translate('enterYourEmailAndPasswordToLogIn'),
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.surface,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 363,
                            height: 405,
                            padding: const EdgeInsets.fromLTRB(24, 10, 24, 24),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
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
                                  controller: cubit.numberOrEmailController,
                                  title: context.translate("phoneNumberEmail"),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) {
                                    if (value == null || value.isEmpty) {
                                      cubit.setTNumberOrEmailControllerHasError(true);
                                      return;
                                    }
                                    // Regex for email validation
                                    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

                                    // Regex for a 10-digit mobile number (without country code)
                                    final mobileRegex = RegExp(r'^\d{12}$');

                                    if (!emailRegex.hasMatch(value) && !mobileRegex.hasMatch(value)) {
                                      cubit.setTNumberOrEmailControllerHasError(true);
                                      return;
                                    }
                                    cubit.setTNumberOrEmailControllerHasError(false);
                                  },
                                  validator: (String? value) {
                                    return null; // ✅ Valid input
                                  },
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                GoldexTextFormField(
                                  controller: cubit.passwordController,
                                  title: context.translate("password"),
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: !cubit.showPassword,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      cubit.showHidePassword();
                                    },
                                    child: Padding(
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
                                  onChanged: (value) {
                                    if (value == null || value.isEmpty) {
                                      cubit.setPasswordControllerHasError(true);
                                      return;
                                    }

                                    if (value.length < 4) {
                                      cubit.setPasswordControllerHasError(true);
                                      return;
                                    }
                                    cubit.setPasswordControllerHasError(false);
                                  },
                                  validator: (String? value) {
                                    return null; // ✅ Valid input
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Transform.scale(
                                            scale: 1,
                                            child: Checkbox(
                                              value: cubit.rememberMe,
                                              onChanged: (val) {
                                                cubit.setRememberMe(val!);
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5), // Set border radius
                                              ),
                                              side: BorderSide(
                                                  width: 2, color: Theme.of(context).colorScheme.primaryContainer),
                                              // Border weight & color
                                              visualDensity: VisualDensity(horizontal: -1, vertical: -4),
                                              // Remove padding
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize.shrinkWrap, // Reduce touch target size
                                            ),
                                          ),
                                          Text(
                                            context.translate('rememberMe'),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: SizeConfig.scaleWidth(14),
                                                color: Theme.of(context).colorScheme.onPrimaryContainer),
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
                                              fontWeight: FontWeight.w600,
                                              fontSize: SizeConfig.scaleWidth(14),
                                              color: Theme.of(context).primaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: CustomButton(
                                    text: context.translate('logIn'),
                                    backgroundColorStart: Theme.of(context).primaryColor,
                                    backgroundColorEnd: Theme.of(context).colorScheme.secondary,
                                    textColor: Theme.of(context).colorScheme.surface,
                                    height: 50,
                                    width: 300,
                                    isLoading: state is LoginLoading,
                                    borderColor: Theme.of(context).primaryColor,
                                    onPressed: () {
                                      if(state is! LoginLoading) {
                                        cubit.login(context);
                                      }
                                    },
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    cubit.loginWithFingerPrint(context);
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                                        child: Text(
                                          context.translate("useYourFingerprint"),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Theme.of(context).colorScheme.onSurface),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: SvgPicture.asset(Asset.fingerPrint),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            context.translate('dontHaveAnAccount'),
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.surface,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 18),
                          CustomButton(
                            text: context.translate('signUp'),
                            backgroundColorStart: Colors.transparent,
                            textColor: Theme.of(context).primaryColor,
                            height: 50,
                            width: 300,
                            borderWidth: 2,
                            borderColor: Theme.of(context).colorScheme.surface,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return BlocProvider(
                                  create: (context) => sl<SingUpCubit>(),
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
          },
        ));
  }
}
