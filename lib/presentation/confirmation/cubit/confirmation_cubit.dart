import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'confirmation_state.dart';

class ConfirmationCubit extends Cubit<ConfirmationState> {
  ConfirmationCubit() : super(ConfirmationInitial());
}
