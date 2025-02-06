import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/app_localizations.dart';

import '../../theme/theme.dart';
import '../../widget/card_buy_or_sell_details.dart';
import '../../widget/card_gift-card_order_details.dart';
import '../../widget/custom_button.dart';
import '../assets.dart';
import '../confirmation/confirmation_screen.dart';
import '../order_summary/cubit/order_summary_cubit.dart';
import 'cubit/gift_card_cubit.dart';

class GiftCardOrderSummaryScreen extends StatelessWidget {
  const GiftCardOrderSummaryScreen({
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
    GiftCardCubit cubit = context.read<GiftCardCubit>();
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
        centerTitle: true,
        title: Text(
          context.translate('orderSummary'),
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: colorLightGreyModal10,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(27 ,36 ,26, 33),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 72,
                    width: 325,
                    padding: const EdgeInsets.fromLTRB(13, 8, 13, 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: colorLightGreyModal2,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context.translate('currentBalance'),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: colorLightGreyModal5
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '431.1 ${context.translate('gr')}',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                      child: ListView(
                        children: cubit.orderSummaryData.map((item) {
                          return GiftCardOrderDetails(
                            title: '',
                            giftCardAmount: item['giftCardAmount']!,
                            giftCardType: item['giftCardType']!,
                            giftCardTitle: item['giftCardTitle']!,
                            number: item['number']!,
                            issuanceFee: item['issuanceFee']!,
                            issuanceAmount: item['issuanceAmount']!,
                            issuanceType: item['issuanceType']!,
                            miniCardAmount: item['miniCardAmount']!,
                            miniCardType: item['miniCardType']!
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Divider(color: colorLightGreyModal2),
                      ),
                      Text(context.translate('total'), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),),
                      Text(
                        totalAmountType == '\$' ? totalAmountType+totalAmount : '$totalAmount $totalAmountType',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.black),),
                      SizedBox(height: 33),
                      CustomButton(
                        text: context.translate('continue'),
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
