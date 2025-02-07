import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:goldex/domain/repository/api_repository.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  ApiRepository apiRepository;
  LoginCubit({required this.apiRepository}) : super(LoginInitial());


  Future<void> login(Map<String, dynamic> data) async {
    emit(LoginLoading());
    try {
      final response = await apiRepository.chargeWallet(data);
      emit(LoginSuccess(response));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

}
