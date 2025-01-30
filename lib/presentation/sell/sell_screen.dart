import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/app_localizations.dart';
import 'package:goldex/theme/theme.dart';
import '../../widget/custom_button.dart';
import '../assets.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({super.key});

  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  String suffix1 = 'Gram';
  String suffix2 = 'USD';

  TextEditingController controller1 = TextEditingController(text: '4.2');
  TextEditingController controller2 = TextEditingController(text: '250');

  void swapSuffix() {
    setState(() {
      String temp = suffix1;
      suffix1 = suffix2;
      suffix2 = temp;
    });
  }

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

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                height: 245,
                width: double.infinity,
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
                            'Scott Williams',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '2020-1821-1530-2401',
                            style: TextStyle(color: colorGreen, fontSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.translate('balance'),
                                  style: TextStyle(color: Colors.white, fontSize: 17),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                    '\$1430.5',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
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
                                          '123.4 ${context.translate('gram')}',
                                          style: TextStyle(color: Colors.white, fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
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
                                            fontSize: 14,
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 25, 60, 0),
              child: Row(
                children: [
                  RichText(
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.ltr,
                    text: TextSpan(
                      style: TextStyle(
                        color: colorLightGreyModal,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(text: context.translate('liveGoldPrice')),
                        TextSpan(
                          text: '68.21',
                          style: TextStyle(color: colorGold, fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: context.translate('perGram'),
                          style: TextStyle(
                            fontSize: 11,
                            color: colorLightGreyModal3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                        child: Text(
                          context.translate('iWantToSell'),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextField(
                        textAlign: TextAlign.left,
                        controller: controller1,
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
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context.translate('iWillEarn'),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.swap_vert, color: colorDarkGrey),
                              onPressed: () {
                                swapSuffix();
                              },
                            ),
                          ],
                        ),
                      ),
                      TextField(
                        textAlign: TextAlign.left,
                        controller: controller2,
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
                          filled: true,
                          fillColor: Colors.white,
                          suffix: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              suffix2,
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
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                context.translate('cancel'),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            CustomButton(
                              text: context.translate('confirm'),
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
                              onPressed: () {},
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
