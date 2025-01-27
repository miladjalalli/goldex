import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'withdrawal_state.dart';

class WithdrawalCubit extends Cubit<WithdrawalState> {
  WithdrawalCubit() : super(WithdrawalInitial());

  TextEditingController amountController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();

}
