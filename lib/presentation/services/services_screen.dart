import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/app_localizations.dart';

import '../../core/theme/theme.dart';
import '../../core/assets.dart';
import '../get-gold/cubit/give_gold_cubit.dart';
import '../get-gold/give-gold_screen.dart';
import '../gift-card/cubit/gift_card_cubit.dart';
import '../gift-card/gift-card_screen.dart';
import 'cubit/services_cubit.dart';

double width = 0;
double height = 0;

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    ServicesCubit cubit = context.read<ServicesCubit>();
    return BlocConsumer<ServicesCubit, ServicesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Container(
            padding: const EdgeInsets.fromLTRB(20, 58, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 16),
                  child: CarouselSlider(
                    items: cubit.imageUrls.map((url) {
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            url,
                            fit: BoxFit.cover,
                            width: width,
                            height: 190,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                Asset.imageDefault,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 190,
                              );
                            },
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16/9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          cubit.currentSlide = index;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: cubit.imageUrls.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => setState(() {
                        cubit.currentSlide = entry.key;
                      }),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: cubit.currentSlide == entry.key
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(15, 39, 0, 11),
                    child: Row(
                      children: [
                        Text(context.translate('services'), style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Theme.of(context).colorScheme.onPrimary)),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BlocProvider(
                                    create: (context) => GiveGoldCubit(),
                                    child: GiveGoldCardScreen(),
                                  )),
                                );
                              },
                              child: ListTile(
                                leading: SvgPicture.asset(Asset.getGold, width: 17, height: 17),
                                title: Text(
                                  context.translate('getYourGold'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child:  Divider(height: 1, color: Theme.of(context).colorScheme.primaryContainer),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BlocProvider(
                                    create: (context) => GiftCardCubit(),
                                    child: GiftCardScreen(),
                                  )),
                                );
                              },
                              child: ListTile(
                                leading: SvgPicture.asset(
                                  Asset.gift,
                                  width: 17,
                                  height: 17,
                                ),
                                title: Text(
                                  context.translate('giftCard'),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
