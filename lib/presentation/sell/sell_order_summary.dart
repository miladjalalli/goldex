import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/app_localizations.dart';

import '../../theme/theme.dart';
import '../../widget/card_buy_or_sell_details.dart';
import '../../widget/custom_button.dart';
import '../assets.dart';

class SellOrderSummary extends StatelessWidget {
  const SellOrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(39 ,36 ,39, 33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardBuyOrSellDetails(
                    firstText: 'Live Gold price per gram',
                    firstTextAmount: "68.21",
                    firstTextAmountType: '\$',
                    secondText: 'Total USD receive',
                    secondTextAmount: '87.23',
                    secondTextAmountType: '\$',
                    thirdText: 'Sell amount',
                    thirdTextAmount: '1.5',
                    thirdTextAmountType: 'gr',
                    forthText: 'Fee',
                    forthPercent: '1',
                    forthTextAmount: '0.87',
                    forthTextAmountType: '\$',
                  ),
                  Column(
                    children: [
                      Divider(color: colorLightGreyModal2),
                      Text(context.translate('total'), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),),
                      Text('\$86.36', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.black),),
                      SizedBox(height: 33),
                      CustomButton(
                        text: "Continue",
                        backgroundColor: colorGreen,
                        textColor: Colors.white,
                        height: 50,
                        width: 300,
                        borderColor: colorGreen,
                        borderRadius: BorderRadius.circular(25),
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        onPressed: () {

                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
