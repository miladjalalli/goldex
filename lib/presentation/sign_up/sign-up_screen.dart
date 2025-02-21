import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/widget/goldex_text_form_field.dart';

import '../../core/assets.dart';
import '../../widget/custom_button.dart';
import '../home/home_screen.dart';
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
        SingUpCubit cubit = context.read<SingUpCubit>();
        if (state is RegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is ConfirmRegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is SignUpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is SetPasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }

        if (state is RegisterSuccess) {
          cubit.showOtpWidget();
        }

        if (state is ConfirmRegisterSuccess) {
          cubit.goToNextPage();
        }

        if (state is SignUpSuccess) {
          cubit.goToNextPage();
        }

        if (state is SetPasswordSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      },
      builder: (context, state) {
        SingUpCubit cubit = context.read<SingUpCubit>();
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
                          _buildPhoneNumberStep(state),
                          _buildSignUpStep(state),
                          _buildSetPasswordStep(state),
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
                    ? Theme.of(context).colorScheme.surface
                    : cubit.currentIndex >= index
                        ? Colors.green
                        : Theme.of(context).colorScheme.onPrimary,
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
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }

  Widget _buildPhoneNumberStep(SingUpState state) {
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
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Form(
                key: cubit.enterNumberForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Visibility(
                      visible: !cubit.otpIsShowing,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(23, 5, 0, 7),
                            child: Text(
                              context.translate("phoneNumberEmail"),
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).colorScheme.onSurface),
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
                                      color: Theme.of(context).colorScheme.surface,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Theme.of(context).colorScheme.primaryContainer,
                                        width: 1,
                                      ),
                                    ),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        cardColor: Theme.of(context).colorScheme.surface,
                                        popupMenuTheme: PopupMenuThemeData(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: cubit.selectedCountryCode.isNotEmpty
                                              ? cubit.selectedCountryCode
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
                                              cubit.selectedCountryCode = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    )),
                                SizedBox(width: 6),
                                Expanded(
                                  child: GoldexTextFormField(
                                      controller: cubit.numberOrEmailController,
                                      onChanged: (value) {
                                        if (value == null || value.isEmpty) {
                                          cubit.setTNumberOrEmailControllerHasError(true);
                                          return;
                                        }

                                        // Regex for email validation
                                        final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

                                        // Regex for a 10-digit mobile number (without country code)
                                        final mobileRegex = RegExp(r'^\d{10}$');

                                        if (!emailRegex.hasMatch(value) && !mobileRegex.hasMatch(value)) {
                                          cubit.setTNumberOrEmailControllerHasError(true);
                                          return;
                                        }
                                        cubit.setTNumberOrEmailControllerHasError(false);
                                      },
                                      validator: (String? value) {
                                        return null; // ✅ Valid input
                                      },
                                      suffixIcon: cubit.numberOrEmailControllerHasError
                                          ? Icon(Icons.error, color: Colors.red)
                                          : SizedBox()),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: cubit.otpIsShowing,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 5, 0, 25),
                            child: Row(
                              children: [
                                Text(
                                  context.translate("pleaseEnterVerificationCode"),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).colorScheme.onSurface),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: VerificationCode(
                              digitsOnly: true,
                              isSecure: true,
                              textStyle: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onSurface),
                              keyboardType: TextInputType.number,
                              underlineColor: Colors.transparent,
                              fillColor: Colors.grey[200],
                              itemSize: 42,
                              cursorColor: Colors.green,
                              fullBorder: true,
                              underlineWidth: 0,
                              length: 6,
                              onCompleted: (String value) {
                                cubit.confirmCodeRecieved(value);
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
                            padding: EdgeInsets.fromLTRB(cubit.resendTimerInSecond == 0 ? 10 : 0, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    if (state is! RegisterLoading && cubit.resendTimerInSecond == 0) {
                                      cubit.register(context);
                                    }
                                  },
                                  child: state is RegisterLoading
                                      ? SpinKitThreeBounce(
                                          color: Theme.of(context).colorScheme.primary,
                                          size: 14,
                                        )
                                      : Text(
                                          cubit.resendTimerInSecond == 0
                                              ? context.translate('resend')
                                              : cubit.resendTimerInSecond.toString(),
                                          style: TextStyle(color: Colors.green)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Visibility(
                      visible: !cubit.otpIsShowing,
                      child: InkWell(
                        onTap: () {
                          cubit.changeTosCheckStatus(!cubit.tosChecked);
                        },
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 19 / 19,
                              child: Checkbox(
                                value: cubit.tosChecked,
                                onChanged: (val) {
                                  cubit.changeTosCheckStatus(val!);
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                side: BorderSide(width: 2, color: Theme.of(context).colorScheme.primaryContainer),
                                // Border weight & color
                                visualDensity: VisualDensity(horizontal: -1, vertical: -4),
                                // Remove padding
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  showCustomDialog(
                                    context,
                                    cubit.tos,
                                    () => Navigator.pop(context),
                                  );
                                },
                                child: RichText(
                                  textAlign: TextAlign.justify,
                                  textDirection: TextDirection.ltr,
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.onSurface,
                                      fontSize: 14,
                                    ),
                                    children: [
                                      TextSpan(text: context.translate('iHave')),
                                      TextSpan(
                                        text: context.translate('readTheToS'),
                                        style: TextStyle(
                                          fontFamily: 'IRsans',
                                          color: Theme.of(context).primaryColor,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, bottom: 0),
                      child: CustomButton(
                        text: context.translate('confirmAndContinue'),
                        backgroundColorStart: Theme.of(context).primaryColor,
                        backgroundColorEnd: Theme.of(context).colorScheme.secondary,
                        textColor: Theme.of(context).colorScheme.surface,
                        height: 50,
                        width: 300,
                        isLoading: state is RegisterLoading || state is ConfirmRegisterLoading,
                        borderColor: Theme.of(context).primaryColor,
                        onPressed: () {
                          if (cubit.otpIsShowing) {
                            cubit.confirmRegister(context);
                          } else {
                            cubit.register(context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {},
              child: Text(
                context.translate('alreadyHaveAnAccount'),
                style:
                    TextStyle(color: Theme.of(context).colorScheme.surface, fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
            const SizedBox(height: 5),
            CustomButton(
              text: context.translate('logIn'),
              backgroundColorStart: Colors.transparent,
              textColor: Theme.of(context).primaryColor,
              height: 50,
              width: 300,
              borderColor: Theme.of(context).colorScheme.surface,
              onPressed: () {
                // Handle Sign Up action
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpStep(SingUpState state) {
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
                color: Theme.of(context).colorScheme.surface,
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
                        controller: cubit.nameController,
                        title: context.translate("firstName"),
                        onChanged: (value) {
                          if (value == null || value.trim().isEmpty) {
                            cubit.setNameControllerHasError(true);
                          }
                          cubit.setNameControllerHasError(false);
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GoldexTextFormField(
                        controller: cubit.familyController,
                        title: context.translate("lastName"),
                        onChanged: (value) {
                          if (value == null || value.trim().isEmpty) {
                            cubit.setFamilyControllerHasError(true);
                          }
                          cubit.setFamilyControllerHasError(false);
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GoldexTextFormField(
                        controller: cubit.invitationCodeController,
                        title: context.translate("invitationCode"),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomButton(
                    text: context.translate('confirmAndContinue'),
                    backgroundColorStart: Theme.of(context).primaryColor,
                    backgroundColorEnd: Theme.of(context).colorScheme.secondary,
                    textColor: Theme.of(context).colorScheme.surface,
                    height: 50,
                    width: 300,
                    isLoading: state is SignUpLoading,
                    borderColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      cubit.signUp(context);
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

  Widget _buildSetPasswordStep(SingUpState state) {
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
                color: Theme.of(context).colorScheme.surface,
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
                    controller: cubit.passwordController,
                    title: context.translate("password"),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !cubit.showPassword,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      final RegExp _passwordRegex = RegExp(r'^[a-zA-Z0-9_@]{6,10}$');

                     cubit.atLeast8Characters = value.length >= 8;
                     cubit.upperAndLowerCaseLetters = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])').hasMatch(value);
                     cubit.numbers = RegExp(r'(?=.*[0-9])').hasMatch(value);

                      if (value.isEmpty) {
                        cubit.setPasswordControllerHasError(true);
                      } else if (!_passwordRegex.hasMatch(value)) {
                        if (value.length < 8) {
                          cubit.setPasswordControllerHasError(true);
                        } else if (value.length > 10) {
                          cubit.setPasswordControllerHasError(true);
                        } else {
                          cubit.setPasswordControllerHasError(true);
                        }
                      } else {
                        cubit.setPasswordControllerHasError(false);
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,8,0,8),
                    child: Row(
                      children: [
                        Icon(Icons.check, color: cubit.atLeast8Characters?Colors.green:Theme.of(context).colorScheme.tertiary.withOpacity(0.3),size: 16,),
                        SizedBox(width: 2,),
                        Text(
                          context.translate('atLeast8Characters'),
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 12,  color: cubit.atLeast8Characters?Colors.green:Theme.of(context).colorScheme.tertiary.withOpacity(0.3)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,8,0,8),
                    child: Row(
                      children: [
                        Icon(Icons.check, color: cubit.upperAndLowerCaseLetters?Colors.green:Theme.of(context).colorScheme.tertiary.withOpacity(0.3),size: 16,),
                        SizedBox(width: 2,),
                        Text(
                          context.translate('upperAndLowerCaseLetters'),
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 12,  color: cubit.upperAndLowerCaseLetters?Colors.green:Theme.of(context).colorScheme.tertiary.withOpacity(0.3)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,8,0,8),
                    child: Row(
                      children: [
                        Icon(Icons.check, color: cubit.numbers?Colors.green:Theme.of(context).colorScheme.tertiary.withOpacity(0.3),size: 16,),
                        SizedBox(width: 2,),
                        Text(
                          context.translate('numbers'),
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 12,  color: cubit.numbers?Colors.green:Theme.of(context).colorScheme.tertiary.withOpacity(0.3)),
                        ),
                      ],
                    ),
                  ),
                  GoldexTextFormField(
                    controller: cubit.passwordConfirmController,
                    title: context.translate("repeatPassword"),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !cubit.showPassword,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      if (value != cubit.passwordController.text.trim()) {
                        cubit.setPasswordConfirmControllerHasError(true);
                      } else {
                        cubit.setPasswordConfirmControllerHasError(false);
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 19 / 19,
                          child: Checkbox(
                            value: cubit.showPassword,
                            onChanged: (val) {
                              cubit.showHidePassword();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            side: BorderSide(width: 2, color: Theme.of(context).colorScheme.primaryContainer),
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
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CustomButton(
                    text: context.translate('confirmAndContinue'),
                    backgroundColorStart: Theme.of(context).primaryColor,
                    backgroundColorEnd: Theme.of(context).colorScheme.secondary,
                    textColor: Theme.of(context).colorScheme.surface,
                    height: 50,
                    width: 300,
                    borderColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      cubit.setPassword(context);
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

  void showCustomDialog(BuildContext context, List<String> messages, Function() onConfirm) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 400, minWidth: 300), // ارتفاع ثابت
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Goldex Terms & Conditions",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: messages.asMap().entries.map((entry) {
                            int index = entry.key + 1;
                            String msg = entry.value;
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "$index. ",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      msg,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          text: context.translate('reject'),
                          backgroundColorStart: Colors.transparent,
                          backgroundColorEnd: Colors.transparent,
                          textColor: Colors.red,
                          height: 50,
                          width: 140,
                          borderColor: Colors.red,
                          onPressed: () => Navigator.pop(context, false),
                        ),
                        CustomButton(
                          text: context.translate('confirm'),
                          backgroundColorStart: Theme.of(context).colorScheme.primary,
                          backgroundColorEnd: Theme.of(context).colorScheme.secondary,
                          textColor: Theme.of(context).colorScheme.surface,
                          height: 50,
                          width: 140,
                          borderColor: Colors.green,
                          onPressed: () {
                            Navigator.pop(context, true);
                            onConfirm();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
