import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldex/app_localizations.dart';
import 'package:goldex/presentation/sell/sell_screen.dart';
import 'package:goldex/theme/theme.dart';
import '../presentation/assets.dart';
import '../presentation/buy/buy_screen.dart';
import '../presentation/transfer/cubit/transfer_cubit.dart';
import '../presentation/transfer/transfer_screen.dart';

class DraggableModalDialog extends StatefulWidget {
  final DraggableScrollableController draggableController;
  const DraggableModalDialog({super.key, required this.draggableController});

  @override
  _DraggableModalDialogState createState() => _DraggableModalDialogState();
}

class _DraggableModalDialogState extends State<DraggableModalDialog> {
  int _currentSlide = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          height: 140,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(60),
            ),
          ),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      actionButton(
                        Asset.buyModal,
                        context.translate('buyGold'),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BuyScreen()),
                          );
                        },
                      ),
                      actionButton(
                        Asset.sellModal,
                        context.translate('sellGold'),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SellScreen()),
                          );
                        },
                      ),
                      actionButton(
                        Asset.transferModal,
                        context.translate('transfer'),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BlocProvider(
                              create: (context) => TransferCubit(),
                              child: TransferScreen(),
                            )),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  controller: scrollController,
                  child: Center(
                    child: Container(
                      width: 379,
                      height: 317,
                      decoration: BoxDecoration(
                        color: colorLightGrey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    context.translate('goldPriceChart'),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: colorLightGreyModal1,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(4, (index) {
                                      return _buildTimeframeButton(index);
                                    }),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  '67.51',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '+2.1%',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Expanded(
                              child: LineChart(
                                LineChartData(
                                  gridData: FlGridData(show: false),
                                  titlesData: FlTitlesData(show: false),
                                  borderData: FlBorderData(show: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: [
                                        FlSpot(0, 3),
                                        FlSpot(1, 2),
                                        FlSpot(2, 5),
                                        FlSpot(3, 3.1),
                                        FlSpot(4, 4),
                                        FlSpot(5, 3.5),
                                        FlSpot(6, 4.1),
                                      ],
                                      isCurved: true,
                                      color: Colors.black,
                                      barWidth: 1,
                                      isStrokeCapRound: true,
                                      belowBarData: BarAreaData(
                                        show: true,
                                        gradient: LinearGradient(
                                          colors: [
                                            colorGreen,
                                            colorLightGrey,
                                          ],
                                          stops: [
                                            0.01,
                                            1.0,
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 28, 5, 0),
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: [
                          Container(
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                context.translate('slider'),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 84,
                          viewportFraction: 1,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentSlide = index;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3, // Number of slides
                          (index) => Container(
                            width: 8,
                            height: 8,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentSlide == index ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTimeframeButton(int index) {
    bool isSelected = _selectedIndex == index;
    List<String> labels = ['D', 'W', 'M', 'Y'];

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            labels[index],
            style: TextStyle(
              color: isSelected ? colorGreen : colorLightGreyModal2,
              fontSize: 19
            ),
          ),
        ),
      ),
    );
  }
}

Widget actionButton(String icon, String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
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
    ),
  );
}
