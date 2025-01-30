import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goldex/app_localizations.dart';

import '../../theme/theme.dart';
import '../../widget/custom_button.dart';
import '../../widget/profile_complete_widget.dart';
import '../assets.dart';
import 'cubit/profile_cubit.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = context.read<ProfileCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                color: colorGreenBack,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(Asset.support),
                  SizedBox(width: 8),
                  Text(context.translate('support'),
                    style: TextStyle(fontSize: 16, color: colorGreen),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 51),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                Asset.person,
                fit: BoxFit.cover,
                height: 78,
                width: 78,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Scott Williams', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: colorLightGreyModal)),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ProfileCompletionWidget(completedFields: 1, totalFields: 5),
                ) // This widget should display progress
              ],
            ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: cubit.documents.length,
          itemBuilder: (context, index) {
            var document = cubit.documents[index];
            return _buildDocumentItem(document, context);
          },
        )
        ],
        ),
      ),
    );
  }
}

Widget _buildDocumentItem(Map<String, dynamic> document, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1.0)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildDocumentTitle(document),
            if (document['completed']) _buildEditButton(document),
          ],
        ),
        if (document['completed']) _buildCompletedIcon(),
        if (!document['completed']) _buildVerifyButton(context),
      ],
    ),
  );
}

Widget _buildDocumentTitle(Map<String, dynamic> document) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        document['title'],
        style: TextStyle(
          fontSize: 18,
          color: document['completed'] ? Colors.black : colorRed,
        ),
      ),
    ],
  );
}

Widget _buildCompletedIcon() {
  return Row(
    children: [
      SvgPicture.asset(Asset.complete),
      SizedBox(width: 40,)
    ],
  );
}

Widget _buildEditButton(Map<String, dynamic> document) {
  return IconButton(
    icon: SvgPicture.asset(Asset.edit),
    onPressed: () {},
  );
}

Widget _buildVerifyButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 2.0),
    child: CustomButton(
      text: context.translate('verify'),
      backgroundColor: colorGreen,
      textColor: Colors.white,
      height: 34,
      width: 109,
      borderColor: colorGreen,
      borderRadius: BorderRadius.circular(25),
      textStyle: TextStyle(fontSize: 16, color: Colors.white),
      onPressed: () {},
    ),
  );
}
