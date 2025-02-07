import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/core/theme/theme.dart';
import '../../widget/card_widget.dart';
import '../../widget/custom_button.dart';
import '../assets.dart';
import '../deposit/cubit/deposit_cubit.dart';
import '../deposit/deposit_screen.dart';
import '../withdrawal/cubit/withdrawal_cubit.dart';
import '../withdrawal/withdrawal_screen.dart';
import 'all_transactions.dart';
import 'cubit/wallet_cubit.dart';

double width = 0;
double height = 0;

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        forceMaterialTransparency: true,
        toolbarHeight: 8,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(28, 0, 28, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(
                name: 'Scott Williams',
                balance: '\$1430.5',
                cardNumber: '2020-1821-1530-2401',
                goldAmount: '123.4 ',
                type: context.translate('gr'),
                onDeposit: () => {}
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(2, 20, 2, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: context.translate('deposit'),
                      backgroundColorStart: colorGreen,
                      textColor: Colors.white,
                      height: 50,
                      width: 180,
                      borderColor: colorGreen,
                      borderRadius: BorderRadius.circular(25),
                      textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      isIconEnabled: true,
                      icon: Asset.deposit,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BlocProvider(
                            create: (context) => DepositCubit(),
                            child: DepositScreen(),
                          )),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Expanded(
                    child: CustomButton(
                      text: context.translate('withdrawal'),
                      backgroundColorStart: Colors.white,
                      textColor: colorGreen,
                      height: 50,
                      width: 180,
                      borderColor: colorGreen,
                      borderRadius: BorderRadius.circular(25),
                      textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: colorGreen,
                      ),
                      isIconEnabled: true,
                      icon: Asset.withdrawal,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BlocProvider(
                            create: (context) => WithdrawalCubit(),
                            child: WithdrawalScreen(),
                          )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(2, 20, 5, 0),
                child: Row(
                  children: [
                    Text(context.translate('transactions'), style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: colorLightGreyModal)),
                    SizedBox(
                      width: 13,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BlocProvider(
                              create: (context) => WalletCubit(),
                              child: AllTransactionsScreen(),
                            )),
                          );
                        },
                        child: Text(context.translate('seeAll'), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400 ,color: colorGreen))),
                  ],
                )),
            Expanded(
              child: ShaderMask(
                blendMode: BlendMode.dstIn,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
                    stops: [0.1, 0.8],
                  ).createShader(bounds);
                },
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: context.read<WalletCubit>().transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = context.read<WalletCubit>().transactions[index];
                    return cardView(transaction);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget cardView(var transaction) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
      height: 50,
      width: width,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colorLightGreyModal9,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                SvgPicture.asset(
                  transaction['type'] == 'dollar' ? Asset.dollar : Asset.gold,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    transaction['title']!,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              transaction['date']!,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              transaction['type'] == 'dollar' ? '\$${transaction['amount']!}' : '${transaction['amount']!} gr',
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  transaction['status']!,
                  style: TextStyle(
                    color: transaction['status'] == 'Done'
                        ? colorGreen
                        : transaction['status'] == 'Failed'
                        ? colorFailed
                        : colorPending,
                    fontWeight: FontWeight.w900,
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.end,
                ),
                SizedBox(width: 12,),
                SvgPicture.asset(Asset.attention,
                  width: 13,
                  height: 15,)
              ],
            ),
          ),
        ],
      ),
    ),
  );
}