import 'package:flutter/material.dart';
import 'package:task_buddy/shared/custom_font.dart';
import 'package:velocity_x/velocity_x.dart';

class TaskCounts extends StatelessWidget {
  const TaskCounts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: Colors.grey.withOpacity(0.5),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 5,
                )
              ]),
          child: Column(
            children: [
              const CustomText(text: 'Pending Tasks', fontSize: 15),
              35.heightBox,
              const CustomText(
                text: '_________',
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ).h(100).w(150),
        40.widthBox,
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: Colors.grey.withOpacity(0.5),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 5,
                )
              ]),
          child: Column(
            children: [
              const CustomText(text: 'Completed Tasks', fontSize: 15),
              15.heightBox,
              const CustomText(
                text: '_________',
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ).h(100).w(150),
      ],
    );
  }
}
