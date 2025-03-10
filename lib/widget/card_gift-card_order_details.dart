import 'package:flutter/material.dart';
import 'package:goldex/core/app_localizations.dart';
import '../core/theme/theme.dart';

class GiftCardOrderDetails extends StatelessWidget {
  final String title;
  final String giftCardAmount;
  final String giftCardType;
  final String giftCardTitle;
  final String number;
  final String issuanceFee;
  final String issuanceAmount;
  final String issuanceType;
  final String miniCardAmount;
  final String miniCardType;

  const GiftCardOrderDetails({
    required this.title,
    required this.giftCardAmount,
    required this.giftCardType,
    required this.giftCardTitle,
    required this.number,
    required this.issuanceFee,
    required this.issuanceAmount,
    required this.issuanceType,
    required this.miniCardAmount,
    required this.miniCardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        width: 375,
        height: 134,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(color: Theme.of(context).colorScheme.primaryContainer),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 5),
              child: ListTile(
                leading: cardView(context, 1),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: giftCardAmount,
                                  style: TextStyle(fontSize: 32,
                                      color: Theme.of(context).colorScheme.onSurface,
                                      fontWeight: FontWeight.w700,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                WidgetSpan(
                                  child: Transform.translate(
                                    offset: const Offset(0, 1),
                                    child: Text(
                                      giftCardType,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Theme.of(context).colorScheme.onSurface,
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 5),
                          SizedBox(
                            child: Text(
                              giftCardTitle,
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: RichText(
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.ltr,
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 32,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w700,
                              overflow: TextOverflow.ellipsis
                          ),
                          children: [
                            TextSpan(text: context.translate('x'),
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.ellipsis
                              ),),
                            TextSpan(
                              text: number,
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.ellipsis
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Divider(height: 1, color: Theme.of(context).colorScheme.primaryContainer),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          context.translate('issuanceFee'),
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      SizedBox(
                        child: Text(
                          '($issuanceFee%)',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        child: Text(
                          issuanceAmount,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      SizedBox(
                        child: Text(
                          issuanceType,
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardView(BuildContext context, int index) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 45,
        width: 77,
        padding: EdgeInsets.only(left: 8),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'GIFT\n', // First line text
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSurface, // Color for the first line
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900,
                                  height: 0.8,
                                ),
                              ),
                              TextSpan(
                                text: 'CARD', // Second line text
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.surface,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w900,
                                  height: 0.9,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.start,
                        )
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          miniCardAmount,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                      SizedBox(width: 1,),
                      Flexible(
                        child: Text(
                          miniCardType,
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w900,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


