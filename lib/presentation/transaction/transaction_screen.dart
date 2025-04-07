import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goldex/core/app_localizations.dart';
import '../../core/dependency_injection.dart';
import '../../widget/connectivity_wrapper.dart';
import '../../widget/modal_dialog.dart';
import '../../core/assets.dart';
import 'cubit/transaction_cubit.dart';

double width = 0;
double height = 0;

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final DraggableScrollableController _draggableController = DraggableScrollableController();

  double _floatingTextOffset = 0.49;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return ConnectivityWrapper(
      child: BlocProvider(
        create: (context) => sl<TransactionCubit>()..loadUserData(),
        child: BlocConsumer<TransactionCubit, TransactionState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            TransactionCubit cubit = context.read<TransactionCubit>();
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                elevation: 0,
                forceMaterialTransparency: true,
                toolbarHeight: 0,
              ),
              body: Stack(
                children: [
                  Positioned.fill(
                    right: -15,
                    child: Image.asset(
                      Asset.home,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    Asset.person,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    (state is UpdateUserDataLoading)
                                        ? SpinKitThreeBounce(
                                            color: Theme.of(context).primaryColor,
                                            size: 20,
                                          ) : Text(
                                            '${context.translate('hey')} ${cubit.name}',
                                            style: TextStyle(
                                              color: Theme.of(context).colorScheme.surface,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                    Text(
                                      context.translate('welcomeBack'),
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.surface,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: SvgPicture.asset(
                                Asset.notification,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: height * (_floatingTextOffset) - 120,
                    left: 20,
                    right: 20,
                    child: Center(
                      child: (state is UpdateUserDataLoading)
                          ? SpinKitThreeBounce(
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            )
                          : Column(
                              children: [
                                Text(
                                  '\$ ${cubit.currencyBalanceUSD?.toStringAsFixed(2) ?? '0.0'}',
                                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(Asset.gold),
                                    SizedBox(width: 5),
                                    Text(
                                      '${cubit.goldBalanceMg?.toStringAsFixed(2) ?? '0.0'} mg',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                    ),
                  ),
                  DraggableModalDialog(
                    draggableController: _draggableController,
                    onScroll: (heightFactor) {
                      setState(() {
                        _floatingTextOffset = 1 - (heightFactor);
                      });
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
