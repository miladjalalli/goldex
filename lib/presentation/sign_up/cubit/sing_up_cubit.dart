import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'sing_up_state.dart';

class SingUpCubit extends Cubit<SingUpState>  {
  SingUpCubit() : super(SingUpInitial());

  int currentIndex = 0;
  final PageController pageController = PageController();

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

}
