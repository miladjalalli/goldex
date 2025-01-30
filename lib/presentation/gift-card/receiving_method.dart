import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/theme/theme.dart';
import 'package:goldex/widget/custom_button.dart';
import '../../widget/counter_widget.dart';
import '../assets.dart';
import 'cubit/gift_card_cubit.dart';

class ReceivingMethodScreen extends StatefulWidget {
  const ReceivingMethodScreen({super.key});

  @override
  _ReceivingMethodScreenState createState() => _ReceivingMethodScreenState();
}

class _ReceivingMethodScreenState extends State<ReceivingMethodScreen> {

  @override
  Widget build(BuildContext context) {
    GiftCardCubit cubit = context.read<GiftCardCubit>();
    return BlocConsumer<GiftCardCubit, GiftCardState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                Asset.back,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'Receiving Method',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: colorLightGreyModal),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 34, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                expandableList(cubit)
              ],
            ),
          ),
          bottomNavigationBar: Visibility(
            visible: cubit.totalQuantity > 0,
            child: Padding(
                padding: EdgeInsets.fromLTRB(64,0,64,32),
                child: CustomButton(
                  text: "Continue",
                  backgroundColor: colorGreen,
                  textColor: Colors.white,
                  height: 50,
                  width: 300,
                  borderColor: colorGreen,
                  borderRadius: BorderRadius.circular(25),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );*/
                  },
                )
            ),
          ),
        );
      },
    );
  }
}

Widget expandableList(GiftCardCubit cubit) {
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
                    onTap: () {
                      cubit.toggleExpanded(index);
                    },
                    child: ListTile(
                      leading: SvgPicture.asset(
                        items[index]['icon'],
                        width: 17,
                        height: 17,
                        color: cubit.expandedState[index] ? Colors.black : Colors.grey,
                      ),
                      title: Text(
                        items[index]['title'],
                        style: TextStyle(
                          fontSize: 16,
                          color: cubit.expandedState[index] ? Colors.black : Colors.grey,
                        ),
                      ),
                      trailing: Icon(
                        cubit.expandedState[index] ? Icons.expand_less : Icons.expand_more,
                        color: cubit.expandedState[index] ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              if (cubit.expandedState[index])
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(items[index]['content']),
                ),
              if (cubit.expandedState[index])
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

