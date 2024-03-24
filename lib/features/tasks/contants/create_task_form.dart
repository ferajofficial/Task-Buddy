import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:task_buddy/features/tasks/contants/priority_chips.dart';
import 'package:task_buddy/features/tasks/contants/task_sharing_chips.dart';
import 'package:task_buddy/features/tasks/contants/task_fields.dart';
import 'package:task_buddy/shared/global_button.dart';
import 'package:task_buddy/shared/global_font.dart';
import 'package:velocity_x/velocity_x.dart';

class CreateTaskForm extends StatefulWidget {
  const CreateTaskForm({Key? key}) : super(key: key);

  @override
  State<CreateTaskForm> createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  TextEditingController dateController = TextEditingController();

  final currentDate = DateTime.now();

  final formattedDate =
      "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDatePickerMode: DatePickerMode.day,
    );

    if (picked != null) {
      setState(() {
        dateController.text = "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FormBuilder(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlobalText(
              text: 'Task Title : ', fontSize: 15, fontWeight: FontWeight.w500),
          5.heightBox,
          const TaskFields(
            name: '',
            labelTask: 'Task Title',
            hintText: 'Enter Task Title',
            prefixicon: Icons.task_alt_rounded,
          ),
          10.heightBox,
          const GlobalText(
              text: 'Task Description : ',
              fontSize: 15,
              fontWeight: FontWeight.w500),
          5.heightBox,
          const TaskFields(
            name: '',
            labelTask: 'Description',
            hintText: 'Enter Task Description',
            maxLength: 150,
            maxLines: 5,
            prefixicon: Icons.description_rounded,
          ),
          // 10.heightBox,
          const GlobalText(
              text: 'Start Date : ', fontSize: 15, fontWeight: FontWeight.w500),
          5.heightBox,
          TaskFields(
            enabled: false,
            dateController: TextEditingController(text: formattedDate),
            name: 'startDate',
            labelTask: 'Start Date',
            hintText: 'Date',
            prefixicon: Icons.calendar_month_rounded,
          ),
          10.heightBox,
          const GlobalText(
              text: 'End Date: ', fontSize: 15, fontWeight: FontWeight.w500),
          5.heightBox,
          TaskFields(
            name: '',
            dateController: dateController,
            labelTask: 'End Date',
            hintText: 'Choose Date',
            suffixicon: Icons.calendar_month_rounded,
            onPressed: selectDate,
          ),
          10.heightBox,
          const GlobalText(
              text: 'Priority : ', fontSize: 15, fontWeight: FontWeight.w500),
          5.heightBox,
          const PriorityChips(),
          10.heightBox,
          const GlobalText(
              text: 'Shared Task : ',
              fontSize: 15,
              fontWeight: FontWeight.w500),
          5.heightBox,
          const TaskSharingChips(),
          15.heightBox,
          GlobalButton(
              width: double.infinity,
              height: 50,
              buttonTxt: 'Create Task',
              onPressed: () {
                context.maybePop();
              }),
        ],
      ).p12()),
    );
  }
}
