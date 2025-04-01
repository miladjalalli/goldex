import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/core/theme/theme.dart';
import '../../core/dependency_injection.dart';
import '../../widget/custom_button.dart';
import '../../core/assets.dart';
import '../../widget/goldex_text_form_field.dart';
import '../../widget/size_config.dart';
import '../order_summary/order_summary_screen.dart';
import 'cubit/transfer_cubit.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  String suffix1 = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider(
      create: (context) => sl<TransferCubit>()..getGoldBalance(),
      child: BlocConsumer<TransferCubit, TransferState>(
        listener: (context, state) {
          if (state is SelectedValue) {
            suffix1 = state.suffix1;
          }
          if (state is GoldOrMoneyTransferSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderSummaryScreen(
                      buyPage: false,
                      sellPage: false,
                      sendPage: true,
                      totalAmount: '5',
                      totalAmountType: 'gr',
                      totalGoldOrUSDReceiveAmount: '5',
                      totalGoldOrUSDReceiveAmountType: 'mg',
                      netGoldPriceOrSellAmount: null,
                      netGoldPriceOrSellAmountType: null,
                      feePercent: '1',
                      feeAmount: '0.87',
                      feeAmountType: 'gr')),
            );
          }
          if (state is GoldOrMoneyTransferError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state is GoldOrMoneyTransferError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          TransferCubit cubit = context.read<TransferCubit>();
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
                child: SvgPicture.asset(Asset.back),
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
              elevation: 0,
              forceMaterialTransparency: true,
              centerTitle: true,
              title: Text(
                context.translate('send'),
              ),
              titleTextStyle: TextStyle(
                fontSize: SizeConfig.scaleWidth(24),
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // DropdownButtonFormField<String>(
                            //   value: cubit.selectedItem,
                            //   items: cubit.items.map((item) {
                            //     return DropdownMenuItem(
                            //       value: item['value'],
                            //       child: Row(
                            //         children: [
                            //           SvgPicture.asset(
                            //             item['icon']!,
                            //             fit: BoxFit.cover,
                            //             width: 18,
                            //             height: 18,
                            //           ),
                            //           SizedBox(width: 8),
                            //           Text(context.translate(item['label']!)),
                            //         ],
                            //       ),
                            //     );
                            //   }).toList(),
                            //   onChanged: (value) {
                            //     if (value != null) {
                            //       context.read<TransferCubit>().selectValue(value, context.translate);
                            //     }
                            //   },
                            //   decoration: InputDecoration(
                            //     filled: true,
                            //     fillColor: Colors.grey[200],
                            //     border: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(25),
                            //     ),
                            //     contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                            //     enabledBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(25),
                            //       borderSide: BorderSide(color: Theme.of(context).colorScheme.surface, width: 1.5),
                            //     ),
                            //     focusedBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(25),
                            //       borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            //     ),
                            //   ),
                            //   hint: Text(context.translate('selectValue')),
                            //   dropdownColor: Theme.of(context).colorScheme.surface
                            // ),
                          DropdownButtonFormField2<String>(
                          value: cubit.selectedItem,
                          items: cubit.items.map((item) {
                            return DropdownMenuItem(
                              value: item['value'],
                              child: Container(
                                padding: EdgeInsets.zero,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      item['icon']!,
                                      fit: BoxFit.cover,
                                      width: 22,
                                      height: 22,
                                    ),
                                    SizedBox(width: 8),
                                    Text(context.translate(item['label']!),
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              context.read<TransferCubit>().selectValue(value, context.translate);
                            }
                          },
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: null, // if null => default
                            offset: const Offset(0, 0), //(x,y)
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.surface, width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          hint: Text(context.translate('selectValue')),
                          iconStyleData: IconStyleData(
                              icon: Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: SvgPicture.asset(
                                  Asset.trailingDown,
                                  color: Theme.of(context).colorScheme.onSurface,
                                  width: 11,
                                  height: 6,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Form(
                                  key: cubit.formKey,
                                  child: Column(
                                    children: [
                                      GoldexTextFormField(
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Enter Mobile Num';
                                          }
                                        },
                                        hintText: 'Phone Number',
                                        controller: cubit.mobileNumberController,
                                        title: context.translate("to"),
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                      ),
                                      SizedBox(height: 10),
                                      GoldexTextFormField(
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        suffix: Text(
                                          cubit.selectedSuffix,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty || value == "0.00") {
                                            return 'Get Amount';
                                          }
                                        },
                                        controller: cubit.amountController,
                                        title: context.translate("amount"),
                                        onChanged: (value) {},
                                        textInputAction: TextInputAction.next,
                                        keyboardType: TextInputType.number,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 2, 15, 0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            state is GoldBalanceLoading ? SpinKitThreeBounce(
                                              color: Theme.of(context).primaryColor,
                                              size: 20,
                                            ) : Text(
                                              'Balance: ${cubit.selectedItem == 'Gold' ? cubit.goldBalanceMg : cubit.currencyBalanceUSD} ${cubit.selectedItem == 'Gold' ? 'mg':'usd'}',
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.onPrimaryContainer),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '${context.translate('balance')}:',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.surface),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    context.translate('cancel'),
                                    style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onSurface),
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
                                  isLoading: state is GoldOrMoneyTransferLoading,
                                  onPressed: () {
                                    if (cubit.formKey.currentState!.validate()) {
                                      cubit.transferCurrency();
                                    }
                                  },
                                )
                              ],
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
