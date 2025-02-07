import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:goldex/app_localizations.dart';
import 'package:goldex/widget/goldex_text_form_field.dart';
import '../../theme/theme.dart';
import '../../widget/custom_button.dart';
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
      listener: (context, state) {},
      builder: (context, state) {
        SingUpCubit cubit = context.read<SingUpCubit>();
        return Scaffold(
          backgroundColor: Colors.black,
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
                          _buildPhoneNumberStep(),
                          _buildSignUpStep(),
                          _buildSetPasswordStep(),
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
      padding: const EdgeInsets.fromLTRB(40, 100, 41, 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStepIndicator(context.translate('phoneNumber'), 0),
          _buildDivider(),
          _buildStepIndicator(context.translate('singUp'), 1),
          _buildDivider(),
          _buildStepIndicator(context.translate('setPassword'), 2),
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
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: cubit.currentIndex == index
                    ? Colors.white
                    : cubit.currentIndex >= index
                        ? Colors.green
                        : Colors.white60,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0, right: 6),
        child: Container(
          height: 2,
          color: Colors.white60,
        ),
      ),
    );
  }

  Widget _buildPhoneNumberStep() {
    SingUpCubit cubit = context.read<SingUpCubit>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 0, 21, 35),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 448,
              width: 363,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
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
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Visibility(
                    visible: !cubit.showOTP,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(23, 5, 0, 7),
                          child: Text(
                            context.translate("phoneNumberEmail"),
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 37.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 90,
                                  height: 50,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: colorLightGreyModal2,
                                      width: 1,
                                    ),
                                  ),
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      cardColor: Colors.white,
                                      popupMenuTheme: PopupMenuThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: cubit.selectedCountryCodes.isNotEmpty
                                            ? cubit.selectedCountryCodes
                                            : cubit.countryCodes.first,
                                        isExpanded: true,
                                        icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                                        items: cubit.countryCodes.map((String code) {
                                          return DropdownMenuItem<String>(
                                            value: code,
                                            child: Text(code, style: Theme.of(context).textTheme.bodySmall),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            cubit.selectedCountryCodes = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  )),
                              SizedBox(width: 6),
                              Expanded(
                                child: GoldexTextFormField(suffixIcon: Icon(Icons.error, color: Colors.red)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: cubit.showOTP,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 5, 0, 35),
                          child: Row(
                            children: [
                              Text(
                                context.translate("pleaseEnterVerificationCode"),
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: VerificationCode(
                            digitsOnly: true,
                            isSecure: true,
                            textStyle: TextStyle(fontSize: 20, color: Colors.black),
                            keyboardType: TextInputType.number,
                            underlineColor: Colors.transparent,
                            fillColor: Colors.grey[200],
                            itemSize: 50,
                            cursorColor: Colors.green,
                            fullBorder: true,
                            underlineWidth: 0,
                            length: 5,
                            onCompleted: (String value) {
                              setState(() {});
                            },
                            onEditing: (bool value) {
                              setState(() {});
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(22, 29, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                context.translate('didntReceiveCode'),
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(context.translate('resend'), style: TextStyle(color: Colors.green)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Visibility(
                    visible: !cubit.showOTP,
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 19 / 19,
                          child: Checkbox(
                            value: false,
                            onChanged: (val) {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            side: BorderSide(width: 2, color: colorLightGreyModal2),
                            // Border weight & color
                            visualDensity: VisualDensity(horizontal: -1, vertical: -4),
                            // Remove padding
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
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
                                      color: Theme.of(context).colorScheme.primary,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 0),
                    child: CustomButton(
                      text: context.translate('confirmAndContinue'),
                      backgroundColorStart: Theme.of(context).colorScheme.primary,
                      backgroundColorEnd: Theme.of(context).colorScheme.secondary,
                      textColor: Colors.white,
                      height: 50,
                      width: 300,
                      borderColor: colorGreen,
                      borderRadius: BorderRadius.circular(25),
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (cubit.showOTP) {
                          cubit.goToNextPage();
                        } else {
                          cubit.changeContent();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            TextButton(
              onPressed: () {},
              child: Text(
                context.translate('alreadyHaveAnAccount'),
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
            const SizedBox(height: 5),
            CustomButton(
              text: context.translate('logIn'),
              backgroundColorStart: Colors.transparent,
              textColor: colorGreen,
              height: 50,
              width: 300,
              borderColor: Colors.white,
              borderRadius: BorderRadius.circular(25),
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.primary,
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

  Widget _buildSignUpStep() {
    SingUpCubit cubit = context.read<SingUpCubit>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 0, 21, 35),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 448,
              width: 363,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
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
                      GoldexTextFormField(
                        title: context.translate("firstName"),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GoldexTextFormField(
                        title: context.translate("lastName"),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GoldexTextFormField(
                        title: context.translate("invitationCode"),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomButton(
                    text: context.translate('confirmAndContinue'),
                    backgroundColorStart: colorGreen,
                    textColor: Colors.white,
                    height: 50,
                    width: 300,
                    borderColor: colorGreen,
                    borderRadius: BorderRadius.circular(25),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
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

  Widget _buildSetPasswordStep() {
    SingUpCubit cubit = context.read<SingUpCubit>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(21, 0, 21, 35),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 448,
              width: 363,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
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
                  GoldexTextFormField(
                    title: context.translate("password"),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                  ),
                  GoldexTextFormField(
                    title: context.translate("repeatPassword"),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 19 / 19,
                          child: Checkbox(
                            value: false,
                            onChanged: (val) {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            side: BorderSide(width: 2, color: colorLightGreyModal2),
                            // Border weight & color
                            visualDensity: VisualDensity(horizontal: -1, vertical: -4),
                            // Remove padding
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            context.translate('showPassword'),
                            textAlign: TextAlign.justify,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CustomButton(
                    text: context.translate('confirmAndContinue'),
                    backgroundColorStart: colorGreen,
                    textColor: Colors.white,
                    height: 50,
                    width: 300,
                    borderColor: colorGreen,
                    borderRadius: BorderRadius.circular(25),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      cubit.goToPreviousPage();
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
}
