import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/core/app_localizations.dart';
import 'package:goldex/core/theme/theme.dart';
import 'package:goldex/widget/custom_button.dart';
import '../../core/assets.dart';
import '../../core/dependency_injection.dart';
import '../order_summary/cubit/order_summary_cubit.dart';
import '../gift-card/gift-card_order_summary_screen.dart';

import 'cubit/give_gold_cubit.dart';
import 'get-gold_order_summary_screen.dart';

class GetGoldReceivingMethodScreen extends StatefulWidget {
  const GetGoldReceivingMethodScreen({super.key});

  @override
  _GetGoldReceivingMethodScreenState createState() => _GetGoldReceivingMethodScreenState();
}

class _GetGoldReceivingMethodScreenState extends State<GetGoldReceivingMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GiveGoldCubit>(),
      child: BlocConsumer<GiveGoldCubit, GiveGoldState>(
        listener: (context, state) {},
        builder: (context, state) {
          GiveGoldCubit cubit = context.read<GiveGoldCubit>();
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
              centerTitle: true,
              title: Text(
                context.translate('receivingMethod'),
              ),
              titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.onPrimary),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 34, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [expandableList(cubit)],
              ),
            ),
            bottomNavigationBar: Padding(
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
                          builder: (context) => GetGoldOrderSummaryScreen(
                                title: '',
                                totalAmount: '36.95',
                                totalAmountType: 'g',
                              )),
                    );
                  },
                )),
          );
        },
      ),
    );
  }

  Widget expandableList(GiveGoldCubit cubit) {
    var items = cubit.items;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: List.generate(items.length, (index) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: index == 0 ? Radius.circular(12) : Radius.zero,
                    topRight: index == 0 ? Radius.circular(12) : Radius.zero,
                    bottomLeft: index == items.length - 1 ? Radius.circular(12) : Radius.zero,
                    bottomRight: index == items.length - 1 ? Radius.circular(12) : Radius.zero,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: items[index]['active']
                          ? () {
                              cubit.toggleExpanded(index);
                            }
                          : null,
                      child: ListTile(
                        leading: SvgPicture.asset(
                          items[index]['icon'],
                          width: 17,
                          height: 17,
                          color: items[index]['active'] ? Theme.of(context).colorScheme.onSurface : Colors.grey,
                        ),
                        title: Text(
                          items[index]['title'],
                          style: TextStyle(fontSize: 16, color: items[index]['active'] ? Theme.of(context).colorScheme.onSurface : Colors.grey),
                        ),
                        trailing: SvgPicture.asset(
                          cubit.expandedState[index] ? Asset.trailingUp : Asset.trailingDown,
                          color: items[index]['active'] ? Theme.of(context).colorScheme.onSurface : Colors.grey,
                          width: 11,
                          height: 6,
                        ),
                      ),
                    ),
                  ),
                ),
                if (cubit.expandedState[index])
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Divider(height: 1, color: Colors.grey.shade300),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 35, top: 10),
                        child: Row(
                          children: [
                            Text(context.translate('officeAddress'), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 20),
                        child: Text('lorem address,ipsum trablos, 12 st. , sample sq. , imam street', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 8.0, left: 35),
                        child: Row(
                          children: [
                            Text(context.translate('visitTime'), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                          ],
                        ),
                      ),
                      Column(
                        children: cubit.visitDays.asMap().entries.map((entry) {
                          int index = entry.key;
                          Map<String, String> day = entry.value;
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0, right: 7),
                                          child: GestureDetector(
                                            onTap: () {
                                              cubit.updateSelectedDay(day['day']!);
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: cubit.selectedDay == day['day']! ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.primaryContainer,
                                                  width: cubit.selectedDay == day['day']! ? 5 : 3,
                                                ),
                                                color: Colors.transparent, // Remove internal color
                                              ),
                                              child: cubit.selectedDay == day['day']!
                                                  ? Center(
                                                      child: Container(
                                                        width: 10,
                                                        height: 10,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.transparent, // No color for the inner circle
                                                        ),
                                                      ),
                                                    )
                                                  : null, // No inner circle when not selected
                                            ),
                                          ),
                                        ),
                                        Text(
                                          day['day']!,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: cubit.selectedDay == day['day']! ? FontWeight.w700 : FontWeight.w500,
                                            color: Theme.of(context).colorScheme.onTertiaryContainer,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          '(${day['hour']})',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: cubit.selectedDay == day['day']! ? FontWeight.w700 : FontWeight.w500,
                                            color: Theme.of(context).colorScheme.onTertiaryContainer,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        day['date']!,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: cubit.selectedDay == day['day']! ? FontWeight.w700 : FontWeight.w500,
                                          color: Theme.of(context).colorScheme.onTertiaryContainer,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (index < cubit.visitDays.length - 1)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                                  child: Divider(
                                    color: Theme.of(context).colorScheme.primaryContainer,
                                    thickness: 1,
                                  ),
                                ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Divider(height: 1, color: Colors.grey.shade300),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
