import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:goldex/app_localizations.dart';

import '../../theme/theme.dart';
import '../../widget/custom_button.dart';
import '../assets.dart';

class ConfirmationScreen extends StatefulWidget {

  final bool showTextMessage;
  final bool showShareBottom;
  final bool showSaveToGalleryBottom;
  final bool showGotItBottom;

  const ConfirmationScreen(
      {
        super.key,
        this.showTextMessage = false,
        this.showShareBottom = true,
        this.showSaveToGalleryBottom = true,
        this.showGotItBottom = false
      }
    );

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
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text(
          _isCodeConfirmed ? context.translate('transactionReceipt') : context.translate('confirmTransaction'),
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: colorLightGreyModal,
        ),
      ),
      body: _isCodeConfirmed ? _buildTransactionDetails() : _buildConfirmationCode(),
    );
  }

  Widget _buildConfirmationCode() {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                padding: const EdgeInsets.fromLTRB(70, 29, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      context.translate('didntReceiveCode'),
                      style: Theme.of(context).textTheme.bodyMedium,
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
            backgroundColorStart: colorGreen,
            textColor: Colors.white,
            height: 50,
            width: 300,
            borderColor: colorGreen,
            borderRadius: BorderRadius.circular(25),
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Visibility(
            visible: widget.showTextMessage,
            child: Padding(
              padding: EdgeInsets.only(bottom: 27.0),
              child: Text(context.translate('youHaveGotMessage'), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),),
            ),
          ),
          Container(
            width: 320,
            decoration: BoxDecoration(
              color: colorLightGreyModal8,
              borderRadius: BorderRadius.circular(29),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 29,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 23), // Padding for content
                  child: Column(
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
                        '10 ${context.translate('gr')}',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.green,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 23), // Padding for content
                  child: Column(
                    children: [
                      Text(
                        context.translate('transactionDetails'),
                        style: TextStyle(
                          fontSize: 12,
                          color: colorLightGreyModal6,
                          fontWeight: FontWeight.w500
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
              ],
            ),
          ),
          Spacer(),
          Visibility(
            visible: widget.showShareBottom,
            child: Padding(
              padding: EdgeInsets.only(bottom: widget.showGotItBottom || widget.showSaveToGalleryBottom ? 11.0 : 32),
              child: CustomButton(
                text: context.translate('share'),
                isIconEnabled: true,
                icon: Asset.share,
                backgroundColorStart: Colors.transparent,
                textColor: colorGreen,
                height: 50,
                width: 300,
                borderColor: colorGreen,
                borderRadius: BorderRadius.circular(25),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isCodeConfirmed = true;
                  });
                },
              ),
            ),
          ),
          Visibility(
            visible: widget.showSaveToGalleryBottom,
            child: Padding(
              padding: EdgeInsets.only(bottom: widget.showGotItBottom ? 11.0 : 32),
              child: CustomButton(
                text: context.translate('saveGallery'),
                isIconEnabled: true,
                icon: Asset.download,
                backgroundColorStart: colorGreen,
                textColor: Colors.white,
                height: 50,
                width: 300,
                borderColor: colorGreen,
                borderRadius: BorderRadius.circular(25),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                onPressed: () {
                },
              ),
            ),
          ),
          Visibility(
            visible: widget.showGotItBottom,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: CustomButton(
                text: context.translate('gotIt'),
                backgroundColorStart: colorGreen,
                textColor: Colors.white,
                height: 50,
                width: 300,
                borderColor: colorGreen,
                borderRadius: BorderRadius.circular(25),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                onPressed: () {
                },
              ),
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
              fontWeight: FontWeight.w500,
              color: colorLightGreyModal7,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: colorLightGreyModal6,
            ),
          ),
        ],
      ),
    );
  }
}
