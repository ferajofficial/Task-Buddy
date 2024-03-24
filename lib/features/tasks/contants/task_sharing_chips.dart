import 'package:flutter/material.dart';
import 'package:task_buddy/shared/global_font.dart';
import 'package:velocity_x/velocity_x.dart';

class TaskSharingChips extends StatelessWidget {
  const TaskSharingChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3), shape: BoxShape.circle),
          child: IconButton(
            onPressed: () {
              debugPrint('Add Person');
            },
            icon: const Icon(
              Icons.add,
              size: 20,
            ),
          ),
        ).h(35).w(35),
        10.widthBox,
        InputChip(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
          label: const GlobalText(text: 'Person 1'),
          onDeleted: () {},
          backgroundColor: Colors.grey.withOpacity(0.3),
          avatar: const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 25,
            // child: Icon(Icons.person),
          ),
        )
      ],
    );
  }
}
