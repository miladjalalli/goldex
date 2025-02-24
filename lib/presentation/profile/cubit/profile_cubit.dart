import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/repository/api_repository.dart';
import '../../../domain/repository/secure_storage_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ApiRepository apiRepository;
  SecureStorageService secureStorageService;

  ProfileCubit({required this.apiRepository, required this.secureStorageService}) : super(ProfileInitial());

  int completeField = 0;

  String? name;
  String? family;

  Future<void> loadUserData() async {
    name = await secureStorageService.readName();
    family = await secureStorageService.readFamily();
    emit(UpdateUserData());
  }

  Future<void> logout() async {
    await secureStorageService.deleteName();
    await secureStorageService.deleteFamily();
    await secureStorageService.deleteMobile();
    await secureStorageService.deletePassword();
    await secureStorageService.deleteToken();
    emit(LogoutUserData());
  }

  List<Map<String, dynamic>> documents = [
    {'title': 'Phone number', 'completed': true},
    {'title': 'E-Mail', 'completed': true},
    {'title': 'Selfie Photo', 'completed': false},
    {'title': 'Verify Identity', 'completed': false},
    {'title': 'Payment method', 'completed': false},
  ];
}
