import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/theme/theme.dart';

import '../../widget/custom_button.dart';
import '../assets.dart';
import '../deposit/cubit/deposit_cubit.dart';
import '../deposit/deposit_screen.dart';
import '../home/cubit/home_cubit.dart';
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
      body: Container(
        padding: const EdgeInsets.fromLTRB(28, 109, 28, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23),
              ),
              child: SizedBox(
                height: 245,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        gradient: RadialGradient(
                          center: Alignment(1.0, -1.0),
                          radius: 1.9,
                          colors: [
                            colorDarkGrey,
                            Colors.transparent,
                          ],
                          stops: [0.4, 1.0],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        gradient: RadialGradient(
                          center: Alignment(-2.0, -1.0),
                          radius: 1.6,
                          colors: [
                            colorGreen,
                            Colors.transparent,
                          ],
                          stops: [0.2, 1.0],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23),
                        gradient: RadialGradient(
                          center: Alignment(0, -2.1),
                          radius: 1.4,
                          colors: [
                            colorGreen,
                            Colors.transparent,
                          ],
                          stops: [0.2, 1.0],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Scott Williams',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '2020-1821-1530-2401',
                            style: TextStyle(color: colorGreen, fontSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Balance:',
                                  style: TextStyle(color: Colors.white, fontSize: 17),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                    '\$1430.5',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          Asset.gold,
                                          fit: BoxFit.cover,
                                          width: 18,
                                          height: 18,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '123.4 gr',
                                          style: TextStyle(color: Colors.white, fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                          side: BorderSide(color: Colors.white),
                                        ),
                                        minimumSize: Size(111, 25), // Set width and height here
                                      ),
                                      child: RichText(
                                        textAlign: TextAlign.justify,
                                        textDirection: TextDirection.ltr,
                                        text: TextSpan(
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                          children: [
                                            TextSpan(text: 'Deposit USD '),
                                            TextSpan(
                                              text: '+',
                                              style: TextStyle(
                                                color: colorGreen,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(2, 36, 2, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Deposit",
                      backgroundColor: colorGreen,
                      textColor: Colors.white,
                      height: 50,
                      width: 180,
                      borderColor: colorGreen,
                      borderRadius: BorderRadius.circular(25),
                      textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
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
                      text: "Withdrawal",
                      backgroundColor: Colors.white,
                      textColor: colorGreen,
                      height: 50,
                      width: 180,
                      borderColor: colorGreen,
                      borderRadius: BorderRadius.circular(25),
                      textStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
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
                padding: EdgeInsets.fromLTRB(2, 39, 5, 0),
                child: Row(
                  children: [
                    Text('Transactions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: colorLightGreyModal)),
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
                        child: Text('see all', style: TextStyle(fontSize: 12, color: colorGreen))),
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
                      fontWeight: FontWeight.bold,
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
                fontWeight: FontWeight.bold,
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
                    fontWeight: FontWeight.bold,
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