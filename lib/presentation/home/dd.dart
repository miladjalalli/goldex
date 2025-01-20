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


                SizedBox(height: 16),
                Text(
                  '\$1430.5',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '123.4 gr',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // Action Buttons
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionButton(
                  icon: Icons.arrow_downward,
                  label: 'Buy Gold',
                  onPressed: () {},
                ),
                ActionButton(
                  icon: Icons.arrow_upward,
                  label: 'Sell Gold',
                  onPressed: () {},
                ),
                ActionButton(
                  icon: Icons.swap_horiz,
                  label: 'Transfer',
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Transactions Section
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Transactions',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        TransactionTile(
                          name: 'Adam West',
                          amount: '+10 gr',
                          isPositive: true,
                        ),
                        TransactionTile(
                          name: 'Jane Doe',
                          amount: '-5 gr',
                          isPositive: false,
                        ),
                        // Add more transactions as needed
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(), backgroundColor: Colors.green,
            padding: EdgeInsets.all(16),
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String name;
  final String amount;
  final bool isPositive;

  const TransactionTile({
    required this.name,
    required this.amount,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(Icons.person, color: Colors.black),
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        amount,
        style: TextStyle(
          color: isPositive ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}