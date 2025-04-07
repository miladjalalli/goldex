import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/app_localizations.dart';

import '../../core/dependency_injection.dart';
import '../../core/theme/theme.dart';
import '../../widget/card_buy_or_sell_details.dart';
import '../../widget/connectivity_wrapper.dart';
import '../../widget/custom_button.dart';
import '../../core/assets.dart';
import '../confirmation/confirmation_screen.dart';
import 'cubit/order_summary_cubit.dart';

class OrderSummaryScreen extends StatelessWidget {
  const OrderSummaryScreen(
      {super.key,
      required this.buyPage,
      required this.sellPage,
      required this.sendPage,
      required this.totalAmount,
      required this.totalAmountType,
      this.liveGoldPriceAmount,
      this.totalGoldOrUSDReceiveAmount,
      this.totalGoldOrUSDReceiveAmountType,
      this.netGoldPriceOrSellAmount,
      this.netGoldPriceOrSellAmountType,
      this.feePercent,
      this.feeAmount,
      this.feeAmountType
  });

  final bool buyPage;
  final bool sellPage;
  final bool sendPage;

  final String totalAmount;
  final String totalAmountType;
  final String? liveGoldPriceAmount;

  final String? totalGoldOrUSDReceiveAmount;
  final String? totalGoldOrUSDReceiveAmountType;

  final String? netGoldPriceOrSellAmount;
  final String? netGoldPriceOrSellAmountType;

  final String? feePercent;
  final String? feeAmount;
  final String? feeAmountType;

  @override
  Widget build(BuildContext context) {
    return ConnectivityWrapper(
      child: BlocProvider(
        create: (context) => sl<OrderSummaryCubit>()..livePrice18K(),
        child: BlocConsumer<OrderSummaryCubit, OrderSummaryState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            OrderSummaryCubit cubit = context.read<OrderSummaryCubit>();
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
              body: Padding(
                padding: const EdgeInsets.fromLTRB(39, 36, 39, 33),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (state is LivePriceLoading)
                        ? SpinKitThreeBounce(
                            color: Theme.of(context).primaryColor,
                            size: 20,
                          )
                        : CardBuyOrSellDetails(
                            firstText: context.translate('liveGoldPrice'),
                            firstTextAmount: cubit.livePrice18kResponse?.data?.pricePerGram18k.toString() ?? liveGoldPriceAmount,
                            firstTextAmountType: '\$',
                            secondText: buyPage ? context.translate('totalGoldReceive') : sellPage ? context.translate('totalUSDReceive') : null,
                            secondTextAmount: totalGoldOrUSDReceiveAmount,
                            secondTextAmountType: totalGoldOrUSDReceiveAmountType,
                            thirdText: buyPage ? context.translate('netGoldPrice') : sellPage ? context.translate('sellAmount') : context.translate('sendAmount'),
                            thirdTextAmount: netGoldPriceOrSellAmount,
                            thirdTextAmountType: netGoldPriceOrSellAmountType,
                            forthText: context.translate('fee'),
                            forthPercent: feePercent,
                            forthTextAmount: feeAmount,
                            forthTextAmountType: feeAmountType,
                          ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Divider(color: Theme.of(context).colorScheme.primaryContainer),
                        ),
                        Text(
                          context.translate('total'),
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onSurface),
                        ),
                        Text(
                          totalAmountType == '\$' ? totalAmountType + totalAmount : totalAmount + totalAmountType,
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onSurface),
                        ),
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
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    )
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
