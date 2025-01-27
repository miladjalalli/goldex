import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/presentation/confirmation/confirmation_screen.dart';
import 'package:goldex/theme/theme.dart';
import '../../widget/counter_widget.dart';
import '../../widget/custom_button.dart';
import 'cubit/gift_card_cubit.dart';

class GiveGiftCardScreen extends StatefulWidget {
  const GiveGiftCardScreen({super.key});

  @override
  _GiveGiftCardScreenState createState() => _GiveGiftCardScreenState();
}

class _GiveGiftCardScreenState extends State<GiveGiftCardScreen> {
  @override
  Widget build(BuildContext context) {
    GiftCardCubit cubit = context.read<GiftCardCubit>();
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(
              'assets/icons/buy.svg',
              width: 27,
              height: 27,
            ),
          ),
        ],
        title: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gift Card',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: colorLightGreyModal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 34, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cubit.giftCards.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print('${cubit.giftCards[index]['amount']} selected');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 29),
                      child: Card(
                        color: colorLightGreyModal4,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Container(
                          height: 201,
                          width: 347,
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${cubit.giftCards[index]['title']!.split(' ').first}\n${cubit.giftCards[index]['title']!.split(' ').last} ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      height: 0.9,
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cubit.giftCards[index]['amount']!,
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  CounterWidget(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // سایر ویجت‌ها را اینجا اضافه کنید
          ],
        ),
      ),
    );
  }
}
