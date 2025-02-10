import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goldex/core/theme/theme.dart';
import '../presentation/assets.dart';

class CounterWidget extends StatefulWidget {
  final Function(int) onQuantityChanged;

  const CounterWidget({super.key, required this.onQuantityChanged});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int quantity = 0;

  void updateQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
    widget.onQuantityChanged(quantity);
  }

  void increment() => updateQuantity(quantity + 1);

  void decrement() {
    if (quantity > 0) updateQuantity(quantity - 1);
  }

  void delete() => updateQuantity(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
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
              icon: quantity == 1
                  ? SvgPicture.asset(Asset.delete)
                  : Icon(Icons.remove),
              onPressed: quantity == 1 ? delete : decrement,
              color: quantity == 1 ? Theme.of(context).colorScheme.onSurface : Theme.of(context).primaryColor,
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
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
