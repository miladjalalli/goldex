import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldex/theme/theme.dart';

class CardBuyOrSellDetails extends StatelessWidget {
  const CardBuyOrSellDetails({super.key, required this.firstText, required this.firstTextAmount, required this.secondText, required this.secondTextAmount, required this.thirdText, required this.thirdTextAmount, required this.forthTextAmount, required this.firstTextAmountType, required this.secondTextAmountType, required this.thirdTextAmountType, required this.forthText, required this.forthTextAmountType, required this.forthPercent});

  final String firstText;
  final String firstTextAmount;
  final String firstTextAmountType;

  final String secondText;
  final String secondTextAmount;
  final String secondTextAmountType;

  final String thirdText;
  final String thirdTextAmount;
  final String thirdTextAmountType;

  final String forthText;
  final String forthPercent;
  final String forthTextAmount;
  final String forthTextAmountType;

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
          _buildRow(firstText, firstTextAmountType == '\$' ? firstTextAmountType+firstTextAmount : firstTextAmount+firstTextAmountType),
          _divider(),
          _buildRow(secondText, secondTextAmountType =='\$' ? secondTextAmountType+secondTextAmount : secondTextAmount+secondTextAmountType),
          _divider(),
          _buildRow(thirdText, thirdTextAmountType =='\$' ? thirdTextAmountType+thirdTextAmount : thirdTextAmount+thirdTextAmountType),
          _divider(),
          _buildRow('$forthText ($forthPercent%)',  forthTextAmountType =='\$' ? forthTextAmountType+forthTextAmount : forthTextAmount+forthTextAmountType),
        ],
      ),
    );
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
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(color: colorLightGreyModal2);
  }
}
