import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goldex/core/app_localizations.dart';
import '../../core/dependency_injection.dart';
import '../../widget/modal_dialog.dart';
import '../../core/assets.dart';
import 'cubit/transaction_cubit.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final DraggableScrollableController _draggableController = DraggableScrollableController();

  double _floatingTextOffset = 0.3; // Initial offset for floating text

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
                                  Text(
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
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Icon(
                            Icons.notifications,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Positioned(
                  top: (MediaQuery.of(context).size.height + 100) * (_floatingTextOffset),
                  left: 20,
                  right: 20,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          '1430.5',
                          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(Asset.gold),
                            SizedBox(width: 5),
                            Text(
                              '123.4 gr',
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
                    print("Height Factor: $heightFactor"); // بررسی مقدار heightFactor در کنسول
                    setState(() {
                      _floatingTextOffset = 0.5 - (heightFactor * 0.5); // حرکت روان‌تر متن
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
