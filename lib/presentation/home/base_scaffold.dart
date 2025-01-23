// import 'package:flutter/material.dart';
//
// import '../../widget/custom_bottom_bar.dart';
// import 'home_screen.dart';
//
// class BaseScaffold extends StatelessWidget {
//   final Widget body; // محتوای هر صفحه
//   final int currentIndex; // ایندکس صفحه جاری
//
//   const BaseScaffold({
//     Key? key,
//     required this.body,
//     this.currentIndex = 0,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: body,
//       floatingActionButton: CustomBottomBar(
//         currentIndex: currentIndex,
//         onItemSelected: (int index) {
//           switch (index) {
//             case 0:
//               // Navigator.pushReplacement(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => ProfileScreen()),
//               // );
//               break;
//             case 1:
//               // Navigator.pushReplacement(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => GroupScreen()),
//               // );
//               break;
//             case 2:
//               // Navigator.pushReplacement(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => WalletScreen()),
//               // );
//               break;
//             case 3:
//               showDetailsModule(context);
//               break;
//           }
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }
