import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/presentation/confirmation/confirmation_screen.dart';
import 'package:goldex/theme/theme.dart';
import '../../widget/custom_bottom_bar.dart';
import '../../widget/custom_button.dart';
import '../assets.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController(text: '250');
  String suffix1 = '';

  @override
  Widget build(BuildContext context) {
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
        title: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Send',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10 ,36 ,10, 0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: colorLightGreyModal4,
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
                      DropdownButtonFormField(
                        items: [
                          DropdownMenuItem(
                            value: "Gold",
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Asset.gold,
                                  fit: BoxFit.cover,
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(width: 8),
                                Text("Gold"),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Dollar",
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Asset.dollar,
                                  fit: BoxFit.cover,
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(width: 8),
                                Text("Dollar"),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            if (value!.contains('Gold')) {
                              suffix1 = 'Gram';
                            }
                            if (value.contains('Dollar')) {
                              suffix1 = 'USD';
                            }
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: colorLightGrey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.white, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        hint: Text("Select Value"),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 30, 0, 5),
                        child: Text(
                          'To',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextField(
                        textAlign: TextAlign.left,
                        controller: cardNumberController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9]'))
                        ],
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
                          // Increased horizontal padding
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Receiver Card Number',
                          hintStyle: TextStyle(fontSize: 16, color: colorLightGreyModal2)
                        ),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 14, 0, 5),
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
                        controller: amountController,
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
                          // Increased horizontal padding
                          filled: true,
                          fillColor: Colors.white,
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              suffix1,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Balance:',
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
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
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
          ],
        ),
      ),
    );
  }
}
