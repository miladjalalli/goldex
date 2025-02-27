import 'package:bloc/bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/response/live_price_18k_response.dart';
import '../../../domain/repository/api_repository.dart';
import '../../../domain/repository/secure_storage_service.dart';

part 'order_summary_state.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  ApiRepository apiRepository;
  SecureStorageService secureStorageService;
  LocalAuthentication _auth = LocalAuthentication();

  OrderSummaryCubit({required this.apiRepository, required this.secureStorageService}) : super(OrderSummaryInitial()) {}

  LivePrice18KResponse? livePrice18kResponse;

  Future<void> livePrice18K() async {
    emit(LivePriceLoading());
    try {
      final res = await apiRepository.livePrice();
      LivePrice18KResponse response = LivePrice18KResponse.fromJson(res.data);
      if (res.statusCode == 200) {
        livePrice18kResponse = response;
        emit(LivePriceSuccess());
      } else {
        emit(LivePriceError('Error on get live price'));
      }
    } catch (e) {
      emit(LivePriceError(e.toString()));
    }
  }
}

