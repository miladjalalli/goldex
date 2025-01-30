import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  List<Map<String, dynamic>> documents = [
    {'title': 'Phone number', 'completed': true},
    {'title': 'E-Mail', 'completed': false},
    {'title': 'Selfie Photo', 'completed': false},
    {'title': 'Verify Identity', 'completed': false},
    {'title': 'Payment method', 'completed': false},
  ];
}
