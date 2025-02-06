import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/app_localizations.dart';
import '../../theme/theme.dart';
import '../assets.dart';
import 'cubit/wallet_cubit.dart';

double width = 0;
double height = 0;

class AllTransactionsScreen extends StatelessWidget {
  const AllTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.only(left: 20)),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            Asset.back,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          context.translate('transaction'),
        ),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: colorLightGreyModal10,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: context.read<WalletCubit>().transactions.length,
          itemBuilder: (context, index) {
            final transaction = context.read<WalletCubit>().transactions[index];
            return cardView(transaction);
          },
        ),
      ),
    );
  }
}

Widget cardView(var transaction) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
    child: Card(
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
    ),
  );
}