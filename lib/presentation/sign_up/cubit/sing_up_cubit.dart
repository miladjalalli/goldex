import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../assets.dart';
part 'sing_up_state.dart';

class SingUpCubit extends Cubit<SingUpState>  {
  SingUpCubit() : super(SingUpInitial());

  int currentIndex = 0;
  bool showOTP = false;
  bool isFormValid = false;

  final PageController pageController = PageController();
  List<String> countryCodes = ['+1', '+44', '+49', '+91', '+98', '+33', '+61', '+81'];
  String selectedCountryCodes = "";

  final List<Map<String, String>> items = [
    {'value': 'passport', 'label': 'passport'},
    {'value': 'iDCard', 'label': 'iDCard'},
    {'value': 'driverLicense', 'label': 'driverLicense'},
  ];

  void selectValue(String value, String Function(String) translate) {
    emit(SelectedValue());
  }
  void goToNextPage() {
    if (currentIndex < 2) {
      currentIndex++;
      pageController.animateToPage(
          currentIndex,
          duration: Duration(milliseconds: 300),
    curve: Curves.easeInOut
          );
    }
    emit(state);
  }

  void goToPreviousPage() {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    emit(state);
  }

  void changeContent() {
    showOTP = true;
    emit(ChangeContent());
  }


}
