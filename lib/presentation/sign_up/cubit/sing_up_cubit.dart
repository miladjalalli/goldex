import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/domain/entity/response/login_response.dart';
import 'package:goldex/domain/entity/response/register_response.dart';
import 'package:goldex/domain/entity/response/set_password_response.dart';
import 'package:goldex/domain/entity/response/signup_response.dart';
import 'package:goldex/domain/repository/api_repository.dart';
import 'package:goldex/domain/repository/secure_storage_service.dart';

part 'sing_up_state.dart';

class SingUpCubit extends Cubit<SingUpState> {
  SingUpCubit({required this.apiRepository,required this.secureStorageService}) : super(SingUpInitial());

  ApiRepository apiRepository;
  SecureStorageService secureStorageService;

  int currentIndex = 0;

  //step 1
  GlobalKey<FormState> enterNumberForm = GlobalKey<FormState>();
  List<String> countryCodes = ['+1', '+44', '+49', '+91', '+98', '+33', '+61', '+81'];
  String selectedCountryCode = '+1';
  TextEditingController numberOrEmailController = TextEditingController();
  bool numberOrEmailControllerHasError = true;
  bool tosChecked = false;
  bool otpIsShowing = false;

  //step 2
  int resendTimerInSecond =  120;
  String? confirmCode;

  //step 3
  TextEditingController nameController = TextEditingController();
  TextEditingController familyController = TextEditingController();
  TextEditingController invitationCodeController = TextEditingController();
  bool nameControllerHasError = true;
  bool familyControllerHasError = true;
  bool isFormValid = false;

  //step 4
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  bool passwordControllerHasError = true;
  bool passwordConfirmControllerHasError = true;
  bool showPassword = false;
  bool atLeast8Characters = false;
  bool upperAndLowerCaseLetters = false;
  bool numbers = false;
  final PageController pageController = PageController();

  final List<Map<String, String>> items = [
    {'value': 'passport', 'label': 'passport'},
    {'value': 'iDCard', 'label': 'iDCard'},
    {'value': 'driverLicense', 'label': 'driverLicense'},
  ];

  final List<String> tos = [
    'Introduction Welcome to Goldex! By using the services of this application, you agree to the following terms and conditions. Please read them carefully before using our services. This agreement is between you and Goldex, with registration number [company registration number] and national ID [national ID]',
    'Definitions Goldex: The online platform for buying and selling melted gold.User: An individual who uses the services of Goldex and has registered.Account: An account created for buying and selling melted gold on Goldex.Services: All the services provided by Goldex, including buying and selling gold, investment, and related services.',
    'Registration and Authentication To use Goldex services, the user must create an account and complete the authentication process. This process includes providing personal information and valid identification. Goldex keeps this information confidential and does not share it with third parties.',
    'Financial Terms and Fees Buying and Selling Gold: Goldex allows you to buy and sell melted gold. The fees for these services are as follows: Buying and selling up to 100 grams of gold: 1% fee. For transactions above 100 grams, the fee will be calculated based on special agreements and prior notification. Price and Transactions in Goldex: All prices and transactions are calculated based on 18-carat gold. Payments: You can increase your balance via credit cards, digital wallets, or bank transfers. Transaction Fees: A 1% fee applies to all financial transactions.',
    'Security and Privacy Goldex keeps your information secure with the highest level of protection. The information is used solely for authentication and service delivery purposes. Your personal and financial information will not be shared with third parties unless required by law.',
    'Investment Risks Gold Price Fluctuations: The gold market may experience significant price fluctuations. Therefore, investing in gold comes with risks that must be understood and considered by the user. User Responsibility: All investment decisions are made by the user, and Goldex is not responsible for any potential losses.',
    'User Rights and Obligations User Obligations: Users must comply with all rules and regulations of Goldex. Users are also prohibited from using Goldex services for illegal or suspicious activities.Goldex Rights: Goldex has the right to temporarily or permanently block any account found violating its terms.',
    'Account Termination Users can deactivate or delete their account at any time by submitting a request to Goldex support. After review and approval, the account will be closed within a specified time frame.',
    'Legal and Regulatory Framework Goldex operates under the laws of Lebanon.Any legal disputes between Goldex and users will be resolved in Lebanese courts under Lebanese constitutional law.',
    'Changes to Terms and Conditions Goldex reserves the right to change these terms and conditions at any time. Any changes will be communicated to users, and continued use of the services indicates acceptance of the changes.',
  ];

  void selectValue(String value, String Function(String) translate) {
    emit(SelectedValue());
  }

  void showOtpWidget() {
    otpIsShowing = true;
    emit(SingUpInitial());
  }

  void goToNextPage() {
    if (currentIndex < 2) {
      currentIndex++;
      pageController.animateToPage(currentIndex, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
    emit(SingUpInitial());
  }

  void goToPreviousPage() {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    emit(state);
  }

  changeTosCheckStatus(bool value) {
    tosChecked = value;
    emit(SingUpInitial());
  }

  void setTNumberOrEmailControllerHasError(bool value) {
    numberOrEmailControllerHasError = value;
    emit(SingUpInitial());
  }

  void setNameControllerHasError(bool value) {
    nameControllerHasError = value;
    emit(SingUpInitial());
  }

  void setFamilyControllerHasError(bool value) {
    familyControllerHasError = value;
    emit(SingUpInitial());
  }

  void setPasswordControllerHasError(bool value) {
    passwordControllerHasError = value;
    emit(SingUpInitial());
  }


  void setPasswordConfirmControllerHasError(bool value) {
    passwordConfirmControllerHasError = value;
    emit(SingUpInitial());
  }


  Future<void> register(BuildContext context) async {
    // bool isValidate = enterNumberForm.currentState!.validate();

    if (numberOrEmailControllerHasError) {
      emit(RegisterError(context.translate('EnterAValidEmailOrMobileNumber')));
      return;
    } else if (!tosChecked) {
      emit(RegisterError(context.translate('pleaseAcceptTheTermsOfService')));
      return;
    } else {
      emit(RegisterLoading());
      try {
        var data = {
          "field": "${selectedCountryCode.replaceFirst('+', '')}${numberOrEmailController.text.trim()}",
        };
        final res = await apiRepository.register(data);
        RegisterResponse response = RegisterResponse.fromJson(res.data);
        if (response.status == "Ok") {
          resendTimerInSecond = response.data?.codeExpire??120;
          startCountdown();
          emit(RegisterSuccess());
        } else {
          emit(RegisterError(response.message!));
        }
      } catch (e) {
        emit(RegisterError(e.toString()));
      }
    }
  }

  Future<void> confirmRegister(BuildContext context) async {

    if (confirmCode==null) {
      emit(ConfirmRegisterError(context.translate('pleaseEnterOTPCode')));
      return;
    } else {
      emit(ConfirmRegisterLoading());
      try {
        var data = {
          "field": "${selectedCountryCode.replaceFirst('+', '')}${numberOrEmailController.text.trim()}",
          "code": confirmCode
        };
        final res = await apiRepository.confirmRegister(data);
        LoginResponse response = LoginResponse.fromJson(res.data);
        if (response.status == "Ok") {
          await secureStorageService.writeToken(response.data!.token!);
          emit(ConfirmRegisterSuccess());
        } else {
          emit(ConfirmRegisterError(response.message!));
        }
      } catch (e) {
        emit(ConfirmRegisterError(e.toString()));
      }
    }
  }


  Future<void> signUp(BuildContext context) async {
    if (nameControllerHasError) {
      emit(SignUpError(context.translate('EnterYourFirstName')));
      return;
    } else if (familyControllerHasError) {
      emit(SignUpError(context.translate('EnterYourLastName')));
      return;
    } else {
      emit(SignUpLoading());
      try {
        var data = {
          "name": nameController.text.trim(),
          "lastname": familyController.text.trim(),
          "identifyCode": invitationCodeController.text.trim()
        };
        final res = await apiRepository.signUp(data);
        SignUpResponse response = SignUpResponse.fromJson(res.data);
        if (response.status == "Ok") {
          secureStorageService.writeName(nameController.text.trim());
          secureStorageService.writeFamily(familyController.text.trim());
          emit(SignUpSuccess());
        } else {
          emit(SignUpError(response.error!));
        }
      } catch (e) {
        emit(SignUpError(e.toString()));
      }
    }
  }


  Future<void> setPassword(BuildContext context) async {
    if (passwordControllerHasError) {
      emit(SetPasswordError(context.translate('passwordMustBe6TO10CharactersUsingOnlyLettersNumbers')));
      return;
    } else if (passwordConfirmControllerHasError) {
      emit(SetPasswordError(context.translate('ThePasswordAndItsRepetitionAreNotTheSame')));
      return;
    } else {
      emit(SetPasswordLoading());
      try {
        var data = {
          "password": passwordController.text.trim()
        };
        final res = await apiRepository.setPassword(data);
        SetPasswordResponse response = SetPasswordResponse.fromJson(res.data);
        if (response.status == "Ok") {
          emit(SetPasswordSuccess());
        } else {
          emit(SetPasswordError(response.error!));
        }
      } catch (e) {
        emit(SetPasswordError(e.toString()));
      }
    }
  }

  void startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendTimerInSecond > 0) {
        resendTimerInSecond--;
        emit(SingUpInitial());
      } else {
        timer.cancel(); // متوقف کردن تایمر
      }
    });
  }

  void confirmCodeRecieved(String code) {
    confirmCode = code;
    emit(SingUpInitial());
  }

  void showHidePassword() {
    showPassword = !showPassword;
    emit(SingUpInitial());
  }

}
