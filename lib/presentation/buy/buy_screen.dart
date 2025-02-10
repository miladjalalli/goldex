import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/core/theme/theme.dart';
import 'package:goldex/widget/card_widget.dart';
import '../../widget/custom_button.dart';
import '../assets.dart';
import '../order_summary/order_summary_screen.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({super.key});

  @override
  _BuyScreenState createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  String suffix1 = 'USD';
  String suffix2 = 'Gram';

  TextEditingController controller1 = TextEditingController(text: '250');
  TextEditingController controller2 = TextEditingController(text: '4.2');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
        centerTitle: true,
        title: Text(
          context.translate('buy'),
        ),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(name: 'Scott Williams', balance: '\$1430.5', cardNumber: '2020-1821-1530-2401', goldAmount: '123.4 ', type: context.translate('gr'), onDeposit: () => {}),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.justify,
                  textDirection: TextDirection.ltr,
                  text: TextSpan(
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 18, fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(text: '${context.translate('liveGoldPrice')}  '),
                      TextSpan(
                        text: '68.21',
                        style: TextStyle(color: colorGold, fontSize: 34, fontWeight: FontWeight.w800),
                      ),
                      TextSpan(
                        text: '  ${context.translate('perGram')}',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 36, 10, 0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    width: 1,
                  ),
                ),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(23, 10, 0, 7),
                        child: Row(
                          children: [
                            Text(
                              context.translate("iWantToSpend"),
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onSurface),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: TextField(
                          textAlign: TextAlign.left,
                          controller: controller1,
                          keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer, width: 1),
                            ),
                            // Increased horizontal padding
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.surface,
                            suffix: Text(
                              suffix1,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(23, 10, 0, 7),
                        child: Row(
                          children: [
                            Text(
                              context.translate("iWillReceive"),
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onSurface),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: TextField(
                          textAlign: TextAlign.left,
                          controller: controller2,
                          keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer, width: 1),
                            ),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.surface,
                            suffix: Text(
                              suffix2,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                context.translate('cancel'),
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                            SizedBox(width: 29),
                            CustomButton(
                              text: "Confirm",
                              backgroundColorStart: Theme.of(context).primaryColor,
                              textColor: Theme.of(context).colorScheme.surface,
                              height: 50,
                              width: 121,
                              borderColor: Theme.of(context).primaryColor,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OrderSummaryScreen(
                                            title: 'Order Summary',
                                            totalAmount: '102.68',
                                            totalAmountType: '\$',
                                            firstText: 'Live Gold price per gram',
                                            firstTextAmount: "68.21",
                                            firstTextAmountType: '\$',
                                            secondText: 'Total Gold receive',
                                            secondTextAmount: '1.5',
                                            secondTextAmountType: 'gr',
                                            thirdText: 'Net Gold price',
                                            thirdTextAmount: '102',
                                            thirdTextAmountType: '\$',
                                            forthText: 'Fee',
                                            forthPercent: '1',
                                            forthTextAmount: '0.68',
                                            forthTextAmountType: '\$',
                                          )),
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
