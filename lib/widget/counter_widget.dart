import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goldex/theme/theme.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int quantity = 0;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
  }

  void delete() {
    setState(() {
      quantity = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(90),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (quantity > 0)
            IconButton(
              icon: quantity == 1 ? SvgPicture.asset('assets/icons/delete.svg') : Icon(Icons.remove),
              onPressed: quantity == 1 ? delete : decrement,
              color: quantity == 1 ? Colors.black : colorGreen ,
            ),
          if (quantity > 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                quantity.toString(),
                style: TextStyle(fontSize: 18),
              ),
            ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: increment,
            color: colorGreen,
          ),
        ],
      ),
    );
  }
}