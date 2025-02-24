import 'package:bloc/bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';

import '../../../domain/repository/api_repository.dart';
import '../../../domain/repository/secure_storage_service.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  ApiRepository apiRepository;
  SecureStorageService secureStorageService;

  TransactionCubit({required this.apiRepository, required this.secureStorageService}) : super(TransactionInitial());

  String? name;
  String? family;

  Future<void> loadUserData() async {
    name = await secureStorageService.readName();
    family = await secureStorageService.readFamily();
    emit(UpdateUserData());
  }
}
