import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/app_localizations.dart';
import 'package:goldex/presentation/confirmation/confirmation_screen.dart';
import 'package:goldex/theme/theme.dart';
import '../../widget/custom_button.dart';
import '../assets.dart';
import 'cubit/withdrawal_cubit.dart';

class WithdrawalScreen extends StatefulWidget {
  const WithdrawalScreen({super.key});

  @override
  _WithdrawalScreenState createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {

  @override
  Widget build(BuildContext context) {
    WithdrawalCubit cubit = context.read<WithdrawalCubit>();
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
          context.translate('withdrawal'),
        ),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: colorLightGreyModal10,
        ),
      ),
      body: BlocConsumer<WithdrawalCubit, WithdrawalState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 36, 10, 0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: colorLightGreyModal2,
                        width: 1,
                      ),
                    ),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      // Add SingleChildScrollView
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(13),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: colorLightGreyModal2,
                                width: 1,
                              ),
                            ),
                            width: double.infinity,
                            child: SingleChildScrollView(
                              // Add SingleChildScrollView
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
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '1430.5 ${context.translate('USD')}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(23, 10, 0, 7),
                            child: Row(
                              children: [
                                Text(
                                  context.translate("amount"),
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: TextField(
                              textAlign: TextAlign.left,
                              controller: cubit.amountController,
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
                                hintText: context.translate('USD'),
                                hintStyle: TextStyle(fontSize: 16, color: colorLightGreyModal2),
                                hintTextDirection: TextDirection.ltr,
                              ),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(23, 10, 0, 7),
                            child: Row(
                              children: [
                                Text(
                                  context.translate("toYourAccount"),
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: TextField(
                              textAlign: TextAlign.left,
                              controller: cubit.accountNumberController,
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
                                hintText: '2064 - 5699 - 2569 - 6919',
                                hintStyle: TextStyle(fontSize: 16, color: colorLightGreyModal2),
                                hintTextDirection: TextDirection.rtl,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.fromLTRB(19,0,20,0),
                                  child: SvgPicture.asset(
                                    Asset.masterCard,
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
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
                                    style: TextStyle(fontSize: 14, color: Colors.grey),
                                  ),
                                ),
                                SizedBox(width: 29),
                                CustomButton(
                                  text: context.translate('confirm'),
                                  backgroundColor: colorGreen,
                                  textColor: Colors.white,
                                  height: 50,
                                  width: 121,
                                  borderColor: colorGreen,
                                  borderRadius: BorderRadius.circular(25),
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                  ),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 41, 30, 0),
                  child: Text(context.translate('yourRequestMessage'), style: TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
