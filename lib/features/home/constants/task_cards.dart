import 'package:flutter/material.dart';
import 'package:task_buddy/shared/global_font.dart';
import 'package:velocity_x/velocity_x.dart';

class TaskCards extends StatefulWidget {
  final String taskTitle;
  final String? taskDescription;
  final String? dueDate;
  final String? priority;
  const TaskCards({
    super.key,
    required this.taskTitle,
    required this.taskDescription,
    required this.dueDate,
    required this.priority,
  });

  @override
  State<TaskCards> createState() => _TaskCardsState();
}

class _TaskCardsState extends State<TaskCards> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GlobalText(
                text: widget.taskTitle,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              Checkbox(
                  activeColor: Colors.blue,
                  side: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                  shape: const CircleBorder(),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  }),
            ],
          ),
          GlobalText(
            text: widget.taskDescription!,
            fontSize: 14,
          ),
          10.heightBox,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 15,
                    ),
                    5.widthBox,
                    GlobalText(
                      text: widget.dueDate!,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
              20.widthBox,
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GlobalText(
                  text: widget.priority!,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    ).pOnly(left: 12, right: 12);
  }
}
