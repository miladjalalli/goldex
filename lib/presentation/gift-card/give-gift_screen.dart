import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/presentation/gift-card/give-gift_receiving_method.dart';
import 'package:goldex/widget/custom_button.dart';
import '../../core/dependency_injection.dart';
import '../../widget/counter_widget.dart';
import '../../core/assets.dart';
import 'cubit/gift_card_cubit.dart';

class GiveGiftCardScreen extends StatefulWidget {
  const GiveGiftCardScreen({super.key});

  @override
  _GiveGiftCardScreenState createState() => _GiveGiftCardScreenState();
}

class _GiveGiftCardScreenState extends State<GiveGiftCardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GiftCardCubit>(),
      child: BlocConsumer<GiftCardCubit, GiftCardState>(
        listener: (context, state) {},
        builder: (context, state) {
          GiftCardCubit cubit = context.read<GiftCardCubit>();
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
              backgroundColor: Theme.of(context).colorScheme.surface,
              elevation: 0,
              forceMaterialTransparency: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: badges.Badge(
                    showBadge: cubit.totalQuantity > 0,
                    badgeContent: Text(
                      cubit.totalQuantity.toString(),
                      style: TextStyle(color: Theme.of(context).colorScheme.surface, fontSize: 14),
                    ),
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: Theme.of(context).primaryColor,
                    ),
                    child: SvgPicture.asset(
                      Asset.buy,
                      width: 27,
                      height: 27,
                    ),
                  ),
                ),
              ],
              centerTitle: true,
              title: Text(
                context.translate('giftCard'),
              ),
              titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.onPrimary),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(28, 34, 28, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ShaderMask(
                      blendMode: BlendMode.dstIn,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          colors: [Colors.transparent, Theme.of(context).colorScheme.onSurface],
                          stops: [0.01, 0.1],
                        ).createShader(bounds);
                      },
                      child: ListView.builder(
                        itemCount: cubit.giftCards.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              print('${cubit.giftCards[index]['amount']} selected');
                            },
                            child: Padding(padding: EdgeInsets.only(bottom: 29), child: cardView(cubit, index)),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Visibility(
              visible: cubit.totalQuantity > 0,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(64, 0, 64, 32),
                  child: CustomButton(
                    text: context.translate('continue'),
                    backgroundColorStart: Theme.of(context).primaryColor,
                    backgroundColorEnd: Theme.of(context).colorScheme.secondary,
                    textColor: Theme.of(context).colorScheme.surface,
                    height: 50,
                    width: 300,
                    borderColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GiveGiftReceivingMethodScreen()),
                      );
                    },
                  )),
            ),
          );
        },
      ),
    );
  }

  Widget cardView(GiftCardCubit cubit, int index) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      elevation: 5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Container(
        constraints: BoxConstraints(minHeight: 201),
        height: 201,
        width: 347,
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${cubit.giftCards[index]['title']!.split(' ').first}\n${cubit.giftCards[index]['title']!.split(' ').last} ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        height: 0.9,
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        cubit.giftCards[index]['amount']!,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        cubit.giftCards[index]['type']!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CounterWidget(
                    onQuantityChanged: (quantity) {
                      cubit.updateQuantity(index, quantity);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
