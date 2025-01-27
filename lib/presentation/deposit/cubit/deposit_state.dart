part of 'deposit_cubit.dart';

@immutable
abstract class DepositState {}

class DepositInitial extends DepositState {}

class SelectPaymentMethod extends DepositState {}