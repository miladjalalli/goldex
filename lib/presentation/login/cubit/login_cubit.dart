import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:goldex/domain/repository/api_repository.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  ApiRepository apiRepository;
  LoginCubit({required this.apiRepository}) : super(LoginInitial());



}
