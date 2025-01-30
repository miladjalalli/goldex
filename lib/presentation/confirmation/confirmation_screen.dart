import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:goldex/app_localizations.dart';

import '../../theme/theme.dart';
import '../../widget/custom_button.dart';
import '../assets.dart';

class ConfirmationScreen extends StatefulWidget {
  @override
  _ConfirmationScreenState createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  bool _onEditing = true;
  String _code = "";
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
            Asset.back,
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
                      context.translate('confirmTransaction'),
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
                      context.translate('enterConfirmationCode'),
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
                      context.translate('didntReceiveCode'),
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
                      child: Text(context.translate('resend'), style: TextStyle(color: Colors.green)),
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
            text: context.translate('confirm'),
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
                  context.translate('confirmTransaction'),
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
                  context.translate('totalGoldSell'),
                  style: TextStyle(
                    fontSize: 12,
                    color: colorLightGreyModal6,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '10 ${context.translate('gram')}',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  context.translate('transactionDetails'),
                  style: TextStyle(
                    fontSize: 12,
                    color: colorLightGreyModal6,
                  ),
                ),
                SizedBox(height: 16),
                _buildDetailRow(context.translate('totalMoneyReceived'), '252.5 ${context.translate('USD')}'),
                _buildDetailRow(context.translate('transactionCode'), '3214568'),
                _buildDetailRow(context.translate('time'), '07/07/2024 - 20:54'),
                _buildDetailRow(context.translate('type'), context.translate('buyGold')),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 11.0),
            child: CustomButton(
              text: context.translate('share'),
              isIconEnabled: true,
              icon: Asset.share,
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
              text: context.translate('saveGallery'),
              isIconEnabled: true,
              icon: Asset.download,
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
