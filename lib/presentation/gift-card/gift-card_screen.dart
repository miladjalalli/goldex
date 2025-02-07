import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/core/theme/theme.dart';
import '../../widget/custom_button.dart';
import '../assets.dart';
import 'barcode_scanner_screen.dart';
import 'cubit/gift_card_cubit.dart';
import 'give-gift_screen.dart';

class GiftCardScreen extends StatefulWidget {
  const GiftCardScreen({super.key});

  @override
  _GiftCardScreenState createState() => _GiftCardScreenState();
}

class _GiftCardScreenState extends State<GiftCardScreen> {

  int quantity = 0;

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
        backgroundColor: Colors.white,
        elevation: 0,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          context.translate('giftCard'),
        ),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
          color: colorLightGreyModal,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 34, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Asset.giftCard,
                        fit: BoxFit.cover)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(23, 7, 23, 0),
                  child: Text(context.translate('giveGoldMessage'), style: TextStyle(fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.center),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 34.0),
                  child: CustomButton(
                    text: context.translate('iWantGiveGift'),
                    backgroundColorStart: colorGreen,
                    textColor: Colors.white,
                    height: 50,
                    width: 300,
                    borderColor: colorGreen,
                    borderRadius: BorderRadius.circular(25),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            BlocProvider(
                              create: (context) => GiftCardCubit(),
                              child: GiveGiftCardScreen(),
                            )),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomButton(
                    text: context.translate('IveGotGift'),
                    backgroundColorStart: Colors.white,
                    textColor: colorGreen,
                    height: 50,
                    width: 300,
                    borderColor: colorGreen,
                    borderRadius: BorderRadius.circular(25),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            BlocProvider(
                              create: (context) => GiftCardCubit(),
                              child: BarcodeScannerScreen(title: 'GIFT\nCARD'),
                            )),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
