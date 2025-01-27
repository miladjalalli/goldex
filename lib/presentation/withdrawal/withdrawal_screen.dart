import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/presentation/confirmation/confirmation_screen.dart';
import 'package:goldex/theme/theme.dart';
import '../../widget/custom_button.dart';
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
            'assets/icons/back.svg',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Withdrawal',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: colorLightGreyModal,
                  ),
                ),
              ],
            ),
          ],
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
                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Current Balance',
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
                                          '1430.5 USD',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
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
                            padding: const EdgeInsets.fromLTRB(10, 18, 0, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Amount',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextField(
                            textAlign: TextAlign.left,
                            controller: cubit.amountController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(color: colorLightGreyModal4, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(color: colorLightGreyModal4, width: 1),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'USD',
                              hintStyle: TextStyle(fontSize: 16, color: colorLightGreyModal2),
                              hintTextDirection: TextDirection.rtl,
                            ),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 18, 0, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'to your account',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextField(
                            textAlign: TextAlign.left,
                            controller: cubit.accountNumberController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(color: colorLightGreyModal4, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: const BorderSide(color: colorLightGreyModal4, width: 1),
                              ),
                              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: '2064 - 5699 - 2569 - 6919',
                              hintStyle: TextStyle(fontSize: 16, color: colorLightGreyModal2),
                              hintTextDirection: TextDirection.rtl,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(19,0,20,0),
                                child: SvgPicture.asset(
                                  'assets/icons/pay/master_card.svg',
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 34, 0, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                CustomButton(
                                  text: "Confirm",
                                  backgroundColor: colorGreen,
                                  textColor: Colors.white,
                                  height: 50,
                                  width: 121,
                                  borderColor: colorGreen,
                                  borderRadius: BorderRadius.circular(25),
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
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
                  child: Text('your request will be submitted and will be done by 2 work days.', style: TextStyle(fontSize: 16, color: Colors.black),
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
