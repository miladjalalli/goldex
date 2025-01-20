

import 'package:flutter/cupertino.dart';

class DetailsDialog extends StatelessWidget {
  DetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return buildDetailsContent(context);
  }

  Widget buildDetailsContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        height: MediaQuery.of(context).size.height * 0.8,
        child: Text('test')
      ),
    );
  }


}