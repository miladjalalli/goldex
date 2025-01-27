import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());

  final List<Map<String, String>> transactions = [
    {"title": "Withdrawal", "date": "Jan 12", "amount": "100", "type": "dollar", "status": "Pending"},
    {"title": "Send", "date": "Jan 03", "amount": "16", "type": "gr", "status": "Done"},
    {"title": "Receive", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Done"},
    {"title": "Deposit", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Failed"},
    {"title": "Withdrawal", "date": "Dec 20", "amount": "30", "type": "gr", "status": "Done"},
    {"title": "Receive", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Done"},
    {"title": "Withdrawal", "date": "Jan 12", "amount": "100", "type": "dollar", "status": "Pending"},
    {"title": "Send", "date": "Jan 03", "amount": "16", "type": "gr", "status": "Done"},
    {"title": "Receive", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Done"},
    {"title": "Deposit", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Failed"},
    {"title": "Withdrawal", "date": "Dec 20", "amount": "30", "type": "gr", "status": "Done"},
    {"title": "Receive", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Done"},
    {"title": "Withdrawal", "date": "Jan 12", "amount": "100", "type": "dollar", "status": "Pending"},
    {"title": "Send", "date": "Jan 03", "amount": "16", "type": "gr", "status": "Done"},
    {"title": "Receive", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Done"},
    {"title": "Deposit", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Failed"},
    {"title": "Withdrawal", "date": "Dec 20", "amount": "30", "type": "gr", "status": "Done"},
    {"title": "Receive", "date": "Dec 28", "amount": "2000", "type": "dollar", "status": "Done"},
  ];
}
