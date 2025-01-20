import 'package:flutter/material.dart';

import '../../widget/custom_bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 0, // No visible AppBar
      ),
      body: Column(
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0), // فاصله داخلی برای تنظیم بهتر تصویر
                      child: Image.asset(
                        'assets/images/person.png', // تصویر شما
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hey Scott',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'welcome back',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          // Gold Jar and Balance Section
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // شکل دایره‌ای
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2), // سایه سفید
                        blurRadius: 100, // محوشدگی سایه
                        spreadRadius: 20, // گسترش سایه
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), // فاصله داخلی برای تنظیم بهتر تصویر
                    child: Image.asset(
                      'assets/images/bank.png', // تصویر شما
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: CustomBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// void showLoanDetailsModule(BuildContext context, Map<String, dynamic> loanData) {
//   showModalBottomSheet(
//     context: context,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//     ),
//     isScrollControlled: true,
//     builder: (context) => LoanDetailsDialog(loanData: loanData),
//   );
// }