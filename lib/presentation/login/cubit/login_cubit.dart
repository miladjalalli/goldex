import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/domain/entity/response/login_response.dart';
import 'package:goldex/domain/repository/api_repository.dart';
import 'package:goldex/domain/repository/secure_storage_service.dart';
import 'package:local_auth/local_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  ApiRepository apiRepository;
  SecureStorageService secureStorageService;
  final LocalAuthentication _auth = LocalAuthentication();

  LoginCubit({required this.apiRepository, required this.secureStorageService}) : super(LoginInitial());

  TextEditingController numberOrEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool numberOrEmailControllerHasError = true;
  bool passwordControllerHasError = true;
  bool showPassword = false;
  bool rememberMe = false;
  bool isFirstLogin = true; // اضافه شده

  @override
  Future<void> close() {
    numberOrEmailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  void showHidePassword() {
    showPassword = !showPassword;
    emit(LoginInitial());
  }

  void setTNumberOrEmailControllerHasError(bool value) {
    numberOrEmailControllerHasError = value;
    emit(LoginInitial());
  }

  void setPasswordControllerHasError(bool value) {
    passwordControllerHasError = value;
    emit(LoginInitial());
  }

  void setRememberMe(bool value) {
    rememberMe = value;
    emit(LoginInitial());
  }

  Future<void> checkFirstLogin() async {
    String? firstLoginFlag = await secureStorageService.readFirstLogin();
    isFirstLogin = firstLoginFlag == null;
    emit(LoginInitial());
  }

  loginWithFingerPrint(BuildContext context) async {
    await checkFirstLogin();

    if (isFirstLogin) {
      emit(LoginError(context.translate('fingerprintLoginIsDisabledForFirstLogin')));
      return;
    }

    bool canAuthenticate = await _auth.canCheckBiometrics;
    bool isDeviceSupported = await _auth.isDeviceSupported();

    if (!canAuthenticate || !isDeviceSupported) {
      emit(LoginError(context.translate('yourDeviceDoesNotSupportFingerprintLogin')));
      return;
    }
    try {
      bool authenticated = await _auth.authenticate(
        localizedReason: 'Touch your finger on the sensor to login',
      );

      if (authenticated) {
        String? mobile = await secureStorageService.readMobile();
        String? password = await secureStorageService.readPassword();

        if (mobile != null && password != null) {
          login(context, mobile: mobile, password: password);
        } else {
          emit(LoginError(context.translate('enterYourEmailAndPasswordToLogIn')));
        }
      }
    } catch (e) {
      emit(LoginError(context.translate('yourDeviceDoesNotSupportFingerprintLogin')));
    }
  }

  Future<void> login(BuildContext context, {String? mobile, String? password}) async {
    if (numberOrEmailControllerHasError || passwordControllerHasError) {
      emit(LoginError(context.translate('enterYourEmailAndPasswordToLogIn')));
      return;
    } else {
      emit(LoginLoading());
      try {
        var data = {
          "user": mobile ?? numberOrEmailController.text.trim(),
          "password": password ?? passwordController.text.trim()
        };
        final res = await apiRepository.login(data);
        LoginResponse response = LoginResponse.fromJson(res.data);
        if (response.status == "Ok") {
          await secureStorageService.writeToken(response.data!.token!);
          await secureStorageService.writeName(response.data!.user!.name);
          await secureStorageService.writeFamily(response.data!.user!.lastname);
          await secureStorageService.writeMobile(numberOrEmailController.text.trim());
          await secureStorageService.writePassword(passwordController.text.trim());

          await secureStorageService.writeFirstLogin("done");

          emit(LoginSuccess());
        } else {
          emit(LoginError(response.message!));
        }
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    }
  }
}
