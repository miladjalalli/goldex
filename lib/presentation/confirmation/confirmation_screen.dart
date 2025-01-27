import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../../theme/theme.dart';
import '../../widget/custom_button.dart';

class ConfirmationScreen extends StatefulWidget {
  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  bool _onEditing = true;
  String _code = '';
  bool _isCodeConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.only(left: 20)),
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
      ),
      body: _isCodeConfirmed ? _buildTransactionDetails() : _buildConfirmationCode(),
    );
  }

  Widget _buildConfirmationCode() {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(81, 66, 81, 124),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Confirm the Transaction',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Please Enter the Confirmation Code',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
                child: Center(
                  child: VerificationCode(
                    digitsOnly: true,
                    isSecure: true,
                    textStyle: TextStyle(fontSize: 20, color: Colors.black),
                    keyboardType: TextInputType.number,
                    underlineColor: Colors.transparent,
                    fillColor: Colors.grey[200],
                    itemSize: 50,
                    cursorColor: Colors.green,
                    length: 5,
                    onCompleted: (String value) {
                      setState(() {
                        _code = value;
                      });
                    },
                    onEditing: (bool value) {
                      setState(() {
                        _onEditing = value;
                      });
                      if (!_onEditing) FocusScope.of(context).unfocus();
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 29, 81, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Didn\'t Receive The Code?',
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 0, 0, 5),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Resend', style: TextStyle(color: Colors.green)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: CustomButton(
            text: "Confirm",
            backgroundColor: colorGreen,
            textColor: Colors.white,
            height: 50,
            width: 300,
            borderColor: colorGreen,
            borderRadius: BorderRadius.circular(25),
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isCodeConfirmed = true;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionDetails() {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(54, 60, 54, 124),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Confirm the Transaction',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            width: 320,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorLightGreyModal8,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total gold Sell',
                  style: TextStyle(
                    fontSize: 12,
                    color: colorLightGreyModal6,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '10 gr',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Transaction Details',
                  style: TextStyle(
                    fontSize: 12,
                    color: colorLightGreyModal6,
                  ),
                ),
                SizedBox(height: 16),
                _buildDetailRow('Total Money Received', '252.5 USD'),
                _buildDetailRow('Transaction Code', '3214568'),
                _buildDetailRow('Time', '07/07/2024 - 20:54'),
                _buildDetailRow('Type', 'Buy Gold'),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 11.0),
            child: CustomButton(
              text: "Share",
              isIconEnabled: true,
              icon: 'assets/icons/share.svg',
              backgroundColor: Colors.white,
              textColor: colorLightGreyModal2,
              height: 50,
              width: 300,
              borderColor: colorLightGreyModal2,
              borderRadius: BorderRadius.circular(25),
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _isCodeConfirmed = true;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: CustomButton(
              text: "Save to Gallery",
              isIconEnabled: true,
              icon: 'assets/icons/download.svg',
              backgroundColor: colorGreen,
              textColor: Colors.white,
              height: 50,
              width: 300,
              borderColor: colorGreen,
              borderRadius: BorderRadius.circular(25),
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              onPressed: () {
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: colorLightGreyModal7,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: colorLightGreyModal6,
            ),
          ),
        ],
      ),
    );
  }
}
