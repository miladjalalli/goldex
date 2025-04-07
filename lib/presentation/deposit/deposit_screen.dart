import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/presentation/confirmation/confirmation_screen.dart';
import 'package:goldex/presentation/services/services_screen.dart';
import 'package:goldex/core/theme/theme.dart';
import '../../core/dependency_injection.dart';
import '../../widget/connectivity_wrapper.dart';
import '../../widget/custom_button.dart';
import '../../core/assets.dart';
import '../../widget/goldex_text_form_field.dart';
import 'cubit/deposit_cubit.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ConnectivityWrapper(
      child: BlocProvider(
        create: (context) => sl<DepositCubit>()..getCurrencyBalance(),
        child: BlocConsumer<DepositCubit, DepositState>(
          listener: (context, state) {},
          builder: (context, state) {
            DepositCubit cubit = context.read<DepositCubit>();
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
                  context.translate('deposit'),
                  textAlign: TextAlign.center,
                ),
                titleTextStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                automaticallyImplyLeading: false,
              ),
              body: BlocConsumer<DepositCubit, DepositState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
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
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 8),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.surface,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Theme.of(context).colorScheme.primaryContainer,
                                        width: 1,
                                      ),
                                    ),
                                    width: 325,
                                    height: 72,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          context.translate('currentBalance'),
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.onSurface),
                                        ),
                                        (state is GetCurrencyBalanceLoading)
                                            ? SpinKitThreeBounce(
                                          color: Theme.of(context).primaryColor,
                                          size: 20,
                                        ) : Padding(
                                          padding: const EdgeInsets.only(top: 2),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${cubit.currencyBalanceUSD?.toStringAsFixed(2) ?? 0.0} ${context.translate('USD')}',
                                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.onSurface),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: GoldexTextFormField(
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      suffix: Text(
                                        context.translate('USD'),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      isLoading: false,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter Weight';
                                        }
                                      },
                                      controller: cubit.amountController,
                                      title: context.translate("amount"),
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.number,
                                      inputTypeMode: InputTypeMode.englishNumbers,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(23, 15, 0, 7),
                                    child: Row(
                                      children: [
                                        Text(
                                          context.translate("paymentMethod"),
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onSurface),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                    child: SizedBox(
                                      height: 37,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: cubit.paymentMethods.length,
                                        itemBuilder: (context, index) {
                                          bool isSelected = cubit.selectedPaymentMethod == index;
                                          return GestureDetector(
                                            onTap: () {
                                              cubit.selectPaymentMethod(index);
                                            },
                                            child: Container(
                                              width: 57,
                                              height: 30,
                                              margin: const EdgeInsets.symmetric(horizontal: 5),
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: Theme.of(context).colorScheme.surface,
                                                borderRadius: BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.primaryContainer,
                                                  width: isSelected ? 2 : 1,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    cubit.paymentMethods[index]['icon'],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 34, 0, 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
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
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => ConfirmationScreen()),
                                            );
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
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
