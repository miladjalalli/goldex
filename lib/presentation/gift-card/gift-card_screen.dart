import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/core/theme/theme.dart';
import '../../core/dependency_injection.dart';
import '../../widget/connectivity_wrapper.dart';
import '../../widget/custom_button.dart';
import '../../core/assets.dart';
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
    return ConnectivityWrapper(
      child: BlocProvider(
        create: (context) => sl<GiftCardCubit>(),
        child: BlocConsumer<GiftCardCubit, GiftCardState>(
          listener: (context, state) {
            if (state is GiftCardsSuccess && state.res.giftCards!.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GiveGiftCardScreen(state.res)),
              );
            }
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
                backgroundColor: Theme.of(context).colorScheme.surface,
                elevation: 0,
                forceMaterialTransparency: true,
                centerTitle: true,
                title: Text(
                  context.translate('giftCard'),
                ),
                titleTextStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.onPrimary,
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
                          children: [Image.asset(Asset.giftCard, fit: BoxFit.cover)],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(23, 7, 23, 0),
                          child: Text(context.translate('giveGoldMessage'), style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurface), textAlign: TextAlign.center),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 34.0),
                          child: CustomButton(
                            text: context.translate('iWantGiveGift'),
                            backgroundColorStart: Theme.of(context).primaryColor,
                            backgroundColorEnd: Theme.of(context).colorScheme.secondary,
                            textColor: Theme.of(context).colorScheme.surface,
                            height: 50,
                            width: 300,
                            borderColor: Theme.of(context).primaryColor,
                            isLoading: state is GiftCardsLoading,
                            onPressed: () {
                              cubit.giftCardsRequest();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CustomButton(
                            text: context.translate('IveGotGift'),
                            backgroundColorStart: Theme.of(context).colorScheme.surface,
                            textColor: Theme.of(context).primaryColor,
                            height: 50,
                            width: 300,
                            borderColor: Theme.of(context).primaryColor,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BarcodeScannerScreen(title: 'GIFT\nCARD')),
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
          },
        ),
      ),
    );
  }
}
