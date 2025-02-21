import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goldex/domain/repository/secure_storage_service.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.secureStorageService}) : super(SplashInitial());

  SecureStorageService secureStorageService;
  bool isLoggedIn = false;

  checkIsLoggedIn() async {
    String? token = await secureStorageService.readToken();
    if (token != null) {
      isLoggedIn = true;
      emit(SplashLoggedIn());
    }else{
      emit(SplashDontLoggedIn());
    }
  }
}
