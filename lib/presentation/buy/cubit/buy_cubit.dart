import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:local_auth/local_auth.dart';

import '../../../domain/entity/response/buy_gold_by_amount_response.dart';
import '../../../domain/entity/response/get_calc_response.dart';
import '../../../domain/entity/response/live_price_18k_response.dart';
import '../../../domain/repository/api_repository.dart';
import '../../../domain/repository/secure_storage_service.dart';

part 'buy_state.dart';

class BuyCubit extends Cubit<BuyState> {
  ApiRepository apiRepository;
  SecureStorageService secureStorageService;
  LocalAuthentication _auth = LocalAuthentication();

  BuyCubit({required this.apiRepository, required this.secureStorageService}) : super(BuyInitial()) {
    usdController.addListener(_onUsdTextChanged);
    weightController.addListener(_onWeightTextChanged);
  }

  String? name;
  String? family;

  String suffix1 = 'USD';
  String suffix2 = 'Gram';
  double? previousUsdValue;
  double? previousWeightValue;
  bool isWeightControllerSelected = false;
  bool isUSDControllerSelected = false;

  BuyGoldByAmountAndWeightResponse? buyGoldByAmountAndWeightResponse;

  LivePrice18KResponse? livePrice18kResponse;

  final TextEditingController usdController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  bool usdControllerHasError = true;
  bool weightControllerHasError = true;

  void _onUsdTextChanged() {
    if (usdController.text.isNotEmpty && (double.parse(usdController.text) != previousUsdValue)) {
      previousUsdValue = double.parse(usdController.text);
      _goldCalc(double.parse(usdController.text), 0);
    }
  }

  void _onWeightTextChanged() {
    if (weightController.text.isNotEmpty && (double.parse(weightController.text) != previousWeightValue)) {
      previousWeightValue = double.parse(weightController.text);
      _goldCalc(0, double.parse(weightController.text));
    }
  }

  void setUsdControllerHasError(bool value) {
    usdControllerHasError = value;
    isWeightControllerSelected = false;
    isUSDControllerSelected = true;
    emit(BuyInitial());
  }

  void setWeightControllerHasError(bool value) {
    weightControllerHasError = value;
    isUSDControllerSelected = false;
    isWeightControllerSelected = true;
    emit(BuyInitial());
  }

  Future<void> confirm(BuildContext context) async {
    if (usdControllerHasError && isUSDControllerSelected) {
      emit(ConfirmError(context.translate('EnterUSD')));
      return;
    } else if (weightControllerHasError && isWeightControllerSelected) {
      emit(ConfirmError(context.translate('EnterWeight')));
      return;
    } else {
      emit(ConfirmLoading());
      try {
        Map<String, dynamic> data;
        isWeightControllerSelected
            ? data = {"weight_in_mg": weightController.text}
            : data = {"fiat_amount": usdController.text};

        final res = isWeightControllerSelected
            ? await apiRepository.buyGoldByWeight(data)
            : await apiRepository.buyGoldByAmount(data);
        if (res.statusCode == 200) {
          buyGoldByAmountAndWeightResponse = BuyGoldByAmountAndWeightResponse.fromJson(res.data);
          emit(ConfirmSuccess());
        } else {
          var result = BuyGoldByAmountAndWeightResponse.fromJson(res.data);
          emit(ConfirmError(result.message ?? 'Error on confirm data'));
        }
      } catch (e) {
        emit(ConfirmError(e.toString()));
      }
    }
  }

  Future<void> _goldCalc(double usdAmount, double goldWeight) async {
    emit(GoldCalcLoading());
    try {
      var data = {
        "gold_weight_mg": goldWeight,
        "fiat_amount": usdAmount,
      };
      final res = await apiRepository.goldCalc(data);
      if (res.statusCode == 200) {
        GetCalcResponse response = GetCalcResponse.fromJson(res.data);
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
        var result = GetCalcResponse.fromJson(res.data);
        emit(GoldCalcError(result.message ??'Error on get calc'));
      }
    } catch (e) {
      emit(GoldCalcError(e.toString()));
    }
  }

  Future<void> livePrice18K() async {
    emit(LivePriceLoading());
    try {
      final res = await apiRepository.livePrice();
      if (res.statusCode == 200) {
        LivePrice18KResponse response = LivePrice18KResponse.fromJson(res.data);
        livePrice18kResponse = response;
        emit(LivePriceSuccess());
      } else {
        var result = LivePrice18KResponse.fromJson(res.data);
        emit(LivePriceError(result.message ?? 'Error on get live price'));
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

  @override
  Future<void> close() {
    usdController.removeListener(_onUsdTextChanged);
    weightController.removeListener(_onWeightTextChanged);
    usdController.dispose();
    weightController.dispose();
    return super.close();
  }
}
