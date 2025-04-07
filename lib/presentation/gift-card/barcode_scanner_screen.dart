import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/app_localizations.dart';

import '../../core/dependency_injection.dart';
import '../../core/theme/theme.dart';
import '../../widget/card_buy_or_sell_details.dart';
import '../../widget/card_gift-card_order_details.dart';
import '../../widget/connectivity_wrapper.dart';
import '../../widget/custom_button.dart';
import '../../core/assets.dart';
import '../../widget/goldex_text_form_field.dart';
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
    return ConnectivityWrapper(
      child: BlocProvider(
        create: (context) => sl<GiftCardCubit>(),
        child: BlocConsumer<GiftCardCubit, GiftCardState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            GiftCardCubit cubit = context.read<GiftCardCubit>();
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
                  Padding(
                    padding: const EdgeInsets.only(top: 31.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        cardView(context, cubit),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(64, 18, 64, 32),
                      child: CustomButton(
                        text: context.translate('scanYourCard'),
                        backgroundColorStart: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).colorScheme.surface,
                        height: 50,
                        width: 300,
                        borderColor: Theme.of(context).primaryColor,
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
                      )),
                  Text(
                    context.translate('or'),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.onSurface),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(64, 10 , 64, 10),
                    child: GoldexTextFormField(
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      controller: cubit.serialCode,
                      title: context.translate("enterSerialCode"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter serial code';
                        }
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      inputTypeMode: InputTypeMode.englishNumbers,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: Padding(
                  padding: EdgeInsets.fromLTRB(64, 10, 64, 32),
                  child: CustomButton(
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
                        MaterialPageRoute(
                            builder: (context) => ConfirmationScreen(
                                  showGotItBottom: true,
                                  showSaveToGalleryBottom: false,
                                  showShareBottom: false,
                                  showTextMessage: true,
                                )),
                      );
                    },
                  )),
            );
          },
        ),
      ),
    );
  }

  Widget cardView(BuildContext context, GiftCardCubit cubit) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
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
                        color: Theme.of(context).colorScheme.surface,
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
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
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
