import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/core/dependency_injection.dart';
import 'package:goldex/presentation/assets.dart';
import 'package:goldex/presentation/home/home_screen.dart';
import 'package:goldex/core/theme/theme.dart';
import 'package:goldex/presentation/sign_up/cubit/sing_up_cubit.dart';
import 'package:goldex/presentation/sign_up/sign-up_screen.dart';
import 'package:goldex/widget/goldex_text_form_field.dart';
import 'package:goldex/widget/custom_button.dart';
import 'package:goldex/presentation/login/cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
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
                            style: TextStyle(color: Theme.of(context).colorScheme.surface, fontSize: 32, fontWeight: FontWeight.w900)
                          ),
                          const SizedBox(height: 12),
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
                            textInputAction: TextInputAction.next,
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
                                        side: BorderSide(width: 2, color: Theme.of(context).colorScheme.primaryContainer),
                                        // Border weight & color
                                        visualDensity: VisualDensity(horizontal: -1, vertical: -4),
                                        // Remove padding
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduce touch target size
                                      ),
                                    ),
                                    Text(
                                      context.translate('rememberMe'),
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Theme.of(context).colorScheme.onPrimaryContainer),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Handle forgot password
                                  },
                                  child: Text(
                                    context.translate('forgotPassword'),
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 17.0),
                            child: CustomButton(
                              text: context.translate('logIn'),
                              backgroundColorStart: Theme.of(context).primaryColor,
                              backgroundColorEnd: Theme.of(context).colorScheme.secondary,
                              textColor: Theme.of(context).colorScheme.surface,
                              height: 50,
                              width: 300,
                              borderColor: Theme.of(context).primaryColor,
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
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Theme.of(context).colorScheme.onSurface),
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
                          color: Theme.of(context).colorScheme.surface,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(height: 12),
                    CustomButton(
                      text: context.translate('signUp'),
                      backgroundColorStart: Colors.transparent,
                      textColor: Theme.of(context).primaryColor,
                      height: 50,
                      width: 300,
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
      ),
    );
  }
}
