import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldex/theme/theme.dart';

class CardBuyOrSellDetails extends StatelessWidget {
  const CardBuyOrSellDetails({
    super.key,
    this.firstText,
    this.firstTextAmount,
    this.secondText,
    this.secondTextAmount,
    this.thirdText,
    this.thirdTextAmount,
    this.forthTextAmount,
    this.firstTextAmountType,
    this.secondTextAmountType,
    this.thirdTextAmountType,
    this.forthText,
    this.forthTextAmountType,
    this.forthPercent
  });

  final String? firstText;
  final String? firstTextAmount;
  final String? firstTextAmountType;

  final String? secondText;
  final String? secondTextAmount;
  final String? secondTextAmountType;

  final String? thirdText;
  final String? thirdTextAmount;
  final String? thirdTextAmountType;

  final String? forthText;
  final String? forthPercent;
  final String? forthTextAmount;
  final String? forthTextAmountType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: colorLightGreyModal2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (firstText != null && firstTextAmount != null)
            _buildRow(firstText!, _formatAmount(firstTextAmountType, firstTextAmount)),
          if (firstText != null && firstTextAmount != null) _divider(),
          if (secondText != null && secondTextAmount != null)
            _buildRow(secondText!, _formatAmount(secondTextAmountType, secondTextAmount)),
          if (secondText != null && secondTextAmount != null) _divider(),
          if (thirdText != null && thirdTextAmount != null)
            _buildRow(thirdText!, _formatAmount(thirdTextAmountType, thirdTextAmount)),
          if (thirdText != null && thirdTextAmount != null) _divider(),
          if (forthText != null && forthTextAmount != null && forthPercent != null)
            _buildRow('$forthText ($forthPercent%)', _formatAmount(forthTextAmountType, forthTextAmount)),
        ],
      ),
    );
  }

  String _formatAmount(String? type, String? amount) {
    if(type == '\$') {
      return '$type$amount';
    } else if (type == 'gr') {
      return '$amount$type';
    } else {
      return amount!;
    }
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(color: colorLightGreyModal2);
  }
}
