import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/app_localizations.dart';

import '../../core/theme/theme.dart';
import '../../widget/card_buy_or_sell_details.dart';
import '../../widget/custom_button.dart';
import '../assets.dart';
import '../confirmation/confirmation_screen.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen({
    super.key,
    required this.title,
    required this.totalAmount,
    required this.totalAmountType,
    this.firstText,
    this.firstTextAmount,
    this.firstTextAmountType,
    this.secondText,
    this.secondTextAmount,
    this.secondTextAmountType,
    this.thirdText,
    this.thirdTextAmount,
    this.thirdTextAmountType,
    this.forthText,
    this.forthPercent,
    this.forthTextAmount,
    this.forthTextAmountType
  });

  final String totalAmount;
  final String totalAmountType;
  final String? title;
  final String? firstText;
  final String? firstTextAmount;
  final String? firstTextAmountType;
  final String? secondText;
  final String? secondTextAmount;
  final String? secondTextAmountType;
  final String? thirdText;
  final String? thirdTextAmount;
  final String? thirdTextAmountType;
  final String? forthText;
  final String? forthPercent;
  final String? forthTextAmount;
  final String? forthTextAmountType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
        centerTitle: true,
        title: Text(
          context.translate('orderSummary'),
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        forceMaterialTransparency: true,
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
                    firstText: firstText,
                    firstTextAmount: firstTextAmount,
                    firstTextAmountType: firstTextAmountType,
                    secondText: secondText,
                    secondTextAmount: secondTextAmount,
                    secondTextAmountType: secondTextAmountType,
                    thirdText: thirdText,
                    thirdTextAmount: thirdTextAmount,
                    thirdTextAmountType: thirdTextAmountType,
                    forthText: forthText,
                    forthPercent: forthPercent,
                    forthTextAmount: forthTextAmount,
                    forthTextAmountType: forthTextAmountType,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Divider(color: Theme.of(context).colorScheme.primaryContainer),
                      ),
                      Text(context.translate('total'), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onSurface),),
                      Text(
                        totalAmountType == '\$' ? totalAmountType+totalAmount : totalAmount+totalAmountType,
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onSurface),),
                      SizedBox(height: 33),
                      CustomButton(
                        text: context.translate('continue'),
                        backgroundColorStart: Theme.of(context).primaryColor,
                        backgroundColorEnd: Theme.of(context).colorScheme.secondary,
                        textColor: Theme.of(context).colorScheme.surface,
                        height: 50,
                        width: 300,
                        borderColor: Theme.of(context).primaryColor,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ConfirmationScreen()));
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
