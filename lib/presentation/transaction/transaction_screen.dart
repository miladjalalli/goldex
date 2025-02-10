import 'package:flutter/material.dart';
import 'package:goldex/core/app_localizations.dart';
import '../../widget/modal_dialog.dart';
import '../assets.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> with SingleTickerProviderStateMixin {
  final DraggableScrollableController _draggableController = DraggableScrollableController();
  late AnimationController _overlayController;
  late Animation<double> _overlayAnimation;

  double _overlayHeight = 0.0;

  @override
  void initState() {
    super.initState();
    _overlayController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }


  @override
  void dispose() {
    _overlayController.dispose();
    _draggableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        elevation: 0,
        forceMaterialTransparency: true,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Asset.home,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            Asset.person,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${context.translate('hey')} Scott',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.surface,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              context.translate('welcomeBack'),
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
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ],
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            bottom: _overlayHeight * MediaQuery.of(context).size.height,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
            ),
          ),
          DraggableModalDialog(
            draggableController: _draggableController,
            onScroll: (overlayHeight) {
              setState(() {
                _overlayHeight = overlayHeight;
              });
            },
          ),
        ],
      ),
    );
  }
}
