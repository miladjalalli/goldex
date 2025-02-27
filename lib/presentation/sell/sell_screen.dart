import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/core/theme/theme.dart';
import '../../core/dependency_injection.dart';
import '../../widget/card_widget.dart';
import '../../widget/custom_button.dart';
import '../../core/assets.dart';
import '../../widget/goldex_text_form_field.dart';
import '../order_summary/order_summary_screen.dart';
import 'cubit/sell_cubit.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SellCubit>()..loadUserData(),
      child: BlocConsumer<SellCubit, SellState>(
        listener: (context, state) {
          SellCubit cubit = context.read<SellCubit>();
          if (state is UpdateUserDataSuccess) {
            cubit.livePrice18K();
          }
          if (state is ConfirmSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderSummaryScreen(
                      buyPage: false,
                      sellPage: true,
                      sendPage: false,
                      totalAmount: cubit.sellGoldResponse?.data?.fiatReceived.toString() ?? '--',
                      totalAmountType: '\$',
                      totalGoldOrUSDReceiveAmount: cubit.sellGoldResponse?.data?.fiatReceived.toString() ?? '--',
                      totalGoldOrUSDReceiveAmountType: '\$',
                      netGoldPriceOrSellAmount: cubit.sellGoldResponse?.data?.goldSoldMg.toString() ?? '--',
                      netGoldPriceOrSellAmountType: 'mg',
                      feePercent: '${(cubit.sellGoldResponse!.data!.fee)! / (cubit.sellGoldResponse!.data!.basePrice!)}',
                      feeAmount: cubit.sellGoldResponse?.data?.fee.toString() ?? '--',
                      feeAmountType: '\$')),
            );
          }
          if (state is ConfirmError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state is GoldCalcError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          SellCubit cubit = context.read<SellCubit>();
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
                context.translate('sell'),
              ),
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
              elevation: 0,
              forceMaterialTransparency: true,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (state is UpdateUserDataLoading)
                      ? SpinKitThreeBounce(
                          color: Theme.of(context).primaryColor,
                          size: 20,
                        )
                      : CardWidget(
                          name: '${cubit.name} ${cubit.family}',
                          balance: '\$ ${cubit.currencyBalanceUSD?.toStringAsFixed(2) ?? '0.0'}',
                          cardNumber: '2020-1821-1530-2401',
                          goldAmount: cubit.goldBalanceMg?.toStringAsFixed(2) ?? '0.0',
                          type: context.translate('mg'),
                          onDeposit: () => {}
                      ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: Center(
                      child: (state is LivePriceLoading)
                          ? SpinKitThreeBounce(
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            )
                          : RichText(
                              textAlign: TextAlign.justify,
                              textDirection: TextDirection.ltr,
                              text: TextSpan(
                                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 18, fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(text: '${context.translate('liveGoldPrice')}  '),
                                  TextSpan(
                                    text: (cubit.livePrice18kResponse?.data?.pricePerGram18k ?? 0).toString() ?? '---',
                                    style: TextStyle(color: colorGold, fontSize: 34, fontWeight: FontWeight.w800),
                                  ),
                                  TextSpan(
                                    // text: '  ${context.translate('perGram')}',
                                    text: '  ${(cubit.livePrice18kResponse?.data?.unit ?? context.translate('perGram'))}',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).colorScheme.primaryContainer,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 36, 10, 0),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          width: 1,
                        ),
                      ),
                      width: double.infinity,
                      child: SingleChildScrollView(
                        // Add SingleChildScrollView
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start, // Align content to start
                          children: [
                            GoldexTextFormField(
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                              suffix: Text(
                                cubit.suffix1,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              isLoading: state is GoldCalcLoading,
                              controller: cubit.weightController,
                              title: context.translate("iWantToSell"),
                              onChanged: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  cubit.setUsdControllerHasError(true);
                                }
                                cubit.setUsdControllerHasError(false);
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            GoldexTextFormField(
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                              controller: cubit.usdController,
                              suffix: Text(
                                cubit.suffix2,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              isLoading: state is GoldCalcLoading,
                              title: context.translate("iWillEarn"),
                              onChanged: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  cubit.setWeightControllerHasError(true);
                                }
                                cubit.setWeightControllerHasError(false);
                              },
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.number,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      context.translate('cancel'),
                                      style: TextStyle(fontSize: 14, color: Colors.grey),
                                    ),
                                  ),
                                  SizedBox(width: 29),
                                  CustomButton(
                                    text: context.translate('confirm'),
                                    backgroundColorStart: Theme.of(context).primaryColor,
                                    backgroundColorEnd: Theme.of(context).colorScheme.secondary,
                                    textColor: Theme.of(context).colorScheme.surface,
                                    height: 50,
                                    width: 121,
                                    borderColor: Theme.of(context).primaryColor,
                                    isLoading: (state is ConfirmLoading),
                                    onPressed: () {
                                      cubit.confirm(context);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
