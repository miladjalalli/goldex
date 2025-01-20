import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goldex/theme/theme.dart';

class ModalDialog extends StatelessWidget {
  const ModalDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDetailsContent(context);
  }

  Widget buildDetailsContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(60),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                actionButton('assets/images/modal/buy.png', 'Buy Gold'),
                actionButton('assets/images/modal/sell.png', 'Sell Gold'),
                actionButton('assets/images/modal/transfer.png', 'Transfer'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(31, 31, 0, 11),
            child: Row(
              children: [
                Text(
                  'Transactions',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: colorLightGreyModal),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                transactionCard('Adam West', '+10', colorGreen, 'Received', 'gr'),
                transactionCard('Antoni Gates', '-8.2', Colors.red, 'Sent', 'gr'),
                transactionCard('Selling Gold', '+120', colorGreen, 'Exchange','\$'),
                transactionCard('Selling Gold', '-2.3', Colors.red, 'Exchange', 'gr'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget actionButton(String icon, String label) {
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: colorGreen,
        child: Image.asset(
          icon,
        ),
      ),
      const SizedBox(height: 8),
      Text(label, style: const TextStyle(fontSize: 14)),
    ],
  );
}

Widget transactionCard(String name, String amount, Color color, String subtitle, String unit) {
  return SizedBox(
    height: 90,
    child: Card(
      margin: const EdgeInsets.fromLTRB(18, 0, 18, 13),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: colorLightGrey,
      child: ListTile(
        leading: Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: name == 'Selling Gold'
              ? Image.asset(
            'assets/images/selling_gold.png',
          )
              : Image.asset(
            'assets/images/generic_avatar.png',
          ),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: amount,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              TextSpan(
                text: ' $unit',
                style: TextStyle(
                  color: colorLightGreyUnit,
                  fontWeight: FontWeight.normal,
                  fontSize: 21,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
