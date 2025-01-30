import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldex/presentation/transaction/transaction_screen.dart';
import 'package:goldex/presentation/wallet/wallet_screen.dart';
import '../../widget/custom_bottom_bar.dart';
import '../services/cubit/services_cubit.dart';
import '../services/services_screen.dart';
import '../wallet/cubit/wallet_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 3;

  final List<Widget> _pages = [
    Center(child: Text('Profile Item', style: TextStyle(color: Colors.white))),
    BlocProvider(
      create: (context) => ServicesCubit(),
      child: ServicesScreen(),
    ),
    BlocProvider(
      create: (context) => WalletCubit(),
      child: WalletScreen(),
    ),
    TransactionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_currentIndex],
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 33),
        child: CustomBottomBar(
          onItemSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
