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

class BarcodeScannerScreen extends StatelessWidget {
  const BarcodeScannerScreen({
    super.key,
    required this.title,
  });

  final String? title;

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
          Padding(
            padding: const EdgeInsets.only(top: 31.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cardView(cubit),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(64,18,64,32),
              child: CustomButton(
                text: context.translate('scanYourCard'),
                backgroundColorStart: colorGreen,
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
                isIconEnabled: true,
                icon: Asset.scan,
                onPressed: () {
                  // Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => BlocProvider(
                  //     create: (context) => GiftCardCubit(),
                  //     child: GiftCardOrderSummaryScreen(
                  //       title: '',
                  //       totalAmount: '210.5',
                  //       totalAmountType: 'mg',
                  //     ),
                  //   )),
                  // );
                },
              )
          ),
          Text(context.translate('or'), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),),
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 21, 0, 7),
            child: Row(
              children: [
                Text(
                  context.translate("enterSerialCode"),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(64,10,64,10),
            child: SizedBox(
              child: TextField(
                textAlign: TextAlign.left,
                controller: cubit.serialCode,
                keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: colorLightGreyModal4, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: colorLightGreyModal4, width: 1),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(64,0,64,32),
          child: CustomButton(
            text: context.translate('continue'),
            backgroundColorStart: colorGreen,
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
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => BlocProvider(
                  create: (context) => GiftCardCubit(),
                  child: ConfirmationScreen(
                    showGotItBottom: true,
                    showSaveToGalleryBottom: false,
                    showShareBottom: false,
                    showTextMessage: true,
                  ),
                )),
              );
            },
          )
      ),
    );
  }

  Widget cardView(GiftCardCubit cubit) {
    return Card(
      color: colorLightGreyModal4,
      elevation: 5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        constraints: BoxConstraints(minHeight: 201),
        height: 201,
        width: 347,
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        height: 0.9,
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                    ),
                  ],
                ),


              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 21.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        ),
                      child: SvgPicture.asset(Asset.barcode))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}