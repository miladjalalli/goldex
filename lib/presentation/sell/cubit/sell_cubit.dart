import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/response/get_calc_response.dart';
import '../../../domain/entity/response/live_price_18k_response.dart';
import '../../../domain/repository/api_repository.dart';
import '../../../domain/repository/secure_storage_service.dart';

part 'sell_state.dart';

class SellCubit extends Cubit<SellState> {
  ApiRepository apiRepository;
  SecureStorageService secureStorageService;
  LocalAuthentication _auth = LocalAuthentication();

  SellCubit({required this.apiRepository, required this.secureStorageService}) : super(SellInitial()) {
    weightController.addListener(_onWeightTextChanged);
    usdController.addListener(_onUsdTextChanged);
  }
  String? name;
  String? family;

  String suffix1 = 'Gram';
  String suffix2 = 'USD';
  double? previousWeightValue;
  double? previousUsdValue;
  LivePrice18KResponse? livePrice18kResponse;

  TextEditingController weightController = TextEditingController();
  TextEditingController usdController = TextEditingController();
  bool weightControllerHasError = true;
  bool usdControllerHasError = true;

  void _onWeightTextChanged() {
    if (weightController.text.isNotEmpty && (double.parse(weightController.text) != previousWeightValue)) {
      previousWeightValue = double.parse(weightController.text);
      _goldCalc(0, double.parse(weightController.text));
    }
  }

  void _onUsdTextChanged() {
    if (usdController.text.isNotEmpty && (double.parse(usdController.text) != previousUsdValue)) {
      previousUsdValue = double.parse(usdController.text);
      _goldCalc(double.parse(usdController.text), 0);
    }
  }

  void setUsdControllerHasError(bool value) {
    usdControllerHasError = value;
    emit(SellInitial());
  }

  void setWeightControllerHasError(bool value) {
    weightControllerHasError = value;
    emit(SellInitial());
  }

  Future<void> _goldCalc(double usdAmount, double goldWeight) async {
    emit(GoldCalcLoading());
    try {
      var data = {
        "gold_weight_mg": goldWeight,
        "fiat_amount": usdAmount,
      };
      final res = await apiRepository.goldCalc(data);
      GetCalcResponse response = GetCalcResponse.fromJson(res.data);
      if (res.statusCode == 200) {
        if (usdAmount != 0) {
          weightController.removeListener(_onWeightTextChanged);
          weightController.text = response.data!.estimatedGoldGrams.toString();
          weightController.addListener(_onWeightTextChanged);
        } else {
          usdController.removeListener(_onUsdTextChanged);
          usdController.text = response.data!.totalCostUsd.toString();
          usdController.addListener(_onUsdTextChanged);
        }

        emit(GoldCalcSuccess());
      } else {
        emit(GoldCalcError('Error on get calc'));
      }
    } catch (e) {
      emit(GoldCalcError(e.toString()));
    }
  }

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

  Future<void> loadUserData() async {
    emit(UpdateUserDataLoading());
    name = await secureStorageService.readName();
    family = await secureStorageService.readFamily();
    emit(UpdateUserDataSuccess());
  }
}
