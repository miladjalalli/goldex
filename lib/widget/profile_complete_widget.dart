import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goldex/theme/theme.dart';

import '../presentation/assets.dart';

class ProfileCompletionWidget extends StatelessWidget {
  final int completedFields;
  final int totalFields;

  const ProfileCompletionWidget({
    Key? key,
    required this.completedFields,
    required this.totalFields,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = (completedFields / totalFields).clamp(0.0, 1.0);
    int percentage = (progress * 100).toInt();
    int completedSteps = (percentage / 20).ceil(); // Fix to show the exact completed step

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Row(
            children: List.generate(5, (index) {
              bool isCompleted = index < completedSteps;
              return Expanded(
                child: Column(
                  children: [
                    isCompleted
                        ? Text(
                      "${(index + 1) * 20}%",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: colorGreen,
                      ),
                    ) : SizedBox(height: 48),
                    SizedBox(height: 4),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      height: 3,
                      decoration: BoxDecoration(
                        color: isCompleted ? colorGreen : Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    if (!isCompleted) SizedBox(height: 20),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
