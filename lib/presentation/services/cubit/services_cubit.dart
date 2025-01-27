import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitial());

  int currentSlide = 0;

  final List<String> imageUrls = [
    'https://pic22sum.photos/200',
    'https://picsum.photos/200',
    'https://picsum.photos/200',
  ];

}
