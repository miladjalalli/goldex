import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/domain/entity/response/login_response.dart';
import 'package:goldex/domain/repository/api_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  ApiRepository apiRepository;

  LoginCubit({required this.apiRepository}) : super(LoginInitial());

  TextEditingController numberOrEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool numberOrEmailControllerHasError = true;
  bool passwordControllerHasError = true;
  bool showPassword = false;

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

  Future<void> login(BuildContext context) async {
    if (numberOrEmailControllerHasError || passwordControllerHasError) {
      emit(LoginError(context.translate('enterYourEmailAndPasswordToLogIn')));
      return;
    } else {
      emit(LoginLoading());
      try {
        var data = {"user": numberOrEmailController.text.trim(), "password": passwordController.text.trim()};
        final res = await apiRepository.login(data);
        LoginResponse response = LoginResponse.fromJson(res.data);
        if (response.status == "Ok") {
          emit(LoginSuccess(response.data!));
        } else {
          emit(LoginError(response.error!));
        }
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    }
  }
}
