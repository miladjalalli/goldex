import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/app_localizations.dart';

import '../presentation/assets.dart';
import '../core/theme/theme.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.name, required this.cardNumber, required this.balance, required this.goldAmount, required this.onDeposit, required this.type});

  final String name;
  final String cardNumber;
  final String balance;
  final String goldAmount;
  final String type;
  final VoidCallback onDeposit;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: 218,
        width: 372,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: RadialGradient(
                  center: Alignment(1.0, -1.0),
                  radius: 1.9,
                  colors: [
                    colorDarkGrey,
                    Colors.transparent,
                  ],
                  stops: [0.4, 1.0],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: RadialGradient(
                  center: Alignment(-2.0, -1.0),
                  radius: 1.6,
                  colors: [
                    colorGreen,
                    Colors.transparent,
                  ],
                  stops: [0.2, 1.0],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: RadialGradient(
                  center: Alignment(0, -2.1),
                  radius: 1.4,
                  colors: [
                    colorGreen,
                    Colors.transparent,
                  ],
                  stops: [0.2, 1.0],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(Asset.copy),
                      SizedBox(width: 7),
                      Text(
                        cardNumber,
                        style: TextStyle(color: colorGreen, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${context.translate('balance')}: ",
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            balance,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Asset.gold,
                                  fit: BoxFit.cover,
                                  width: 18,
                                  height: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  goldAmount + type,
                                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 18, bottom: 8),
                child: ElevatedButton(
                  onPressed: onDeposit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.white),
                    ),
                    minimumSize: Size(111, 25), // Set width and height here
                  ),
                  child: RichText(
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr,
                    text: TextSpan(
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      ),
                      children: [
                        TextSpan(text: context.translate('depositUSD')),
                        TextSpan(
                          text: '+',
                          style: TextStyle(
                            color: colorGreen,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
