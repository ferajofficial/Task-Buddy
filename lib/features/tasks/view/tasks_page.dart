import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:task_buddy/features/tasks/contants/custom_tiles.dart';
import 'package:task_buddy/shared/custom_button.dart';
import 'package:task_buddy/shared/custom_font.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TaskView();
  }
}

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const CustomText(
            text: 'Create Task', fontSize: 20, fontWeight: FontWeight.w500),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
                text: 'Task Title : ',
                fontSize: 15,
                fontWeight: FontWeight.w500),
            5.heightBox,
            const TaskTiles(
              name: String.fromEnvironment('title'),
              labelTask: 'Task Title',
              hintText: 'Enter Task Title',
              prefixicon: Icons.task_alt_rounded,
            ),
            10.heightBox,
            const CustomText(
                text: 'Task Description : ',
                fontSize: 15,
                fontWeight: FontWeight.w500),
            5.heightBox,
            const TaskTiles(
              name: String.fromEnvironment('description'),
              labelTask: 'Description',
              hintText: 'Enter Task Description',
              maxLength: 150,
              maxLines: 5,
              prefixicon: Icons.description_rounded,
            ),
            // 10.heightBox,
            const CustomText(
                text: 'Start Date : ',
                fontSize: 15,
                fontWeight: FontWeight.w500),
            5.heightBox,
            TaskTiles(
              enabled: false,
              dateController: TextEditingController(text: formattedDate),
              name: const String.fromEnvironment('startDate'),
              labelTask: 'Start Date',
              hintText: 'Date',
              prefixicon: Icons.calendar_month_rounded,
            ),
            10.heightBox,
            const CustomText(
                text: 'End Date: ', fontSize: 15, fontWeight: FontWeight.w500),
            5.heightBox,
            TaskTiles(
              name: const String.fromEnvironment('endDate'),
              dateController: dateController,
              labelTask: 'End Date',
              hintText: 'Choose Date',
              suffixicon: Icons.calendar_month_rounded,
              onPressed: selectDate,
            ),
            10.heightBox,
            const CustomText(
                text: 'Priority : ', fontSize: 15, fontWeight: FontWeight.w500),
            5.heightBox,
            Row(
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: CustomText(
                          textAlign: TextAlign.center,
                          text: 'Priority $index',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ).pOnly(right: 10);
                    },
                  ).h(35),
                ),
              ],
            ),
            10.heightBox,
            const CustomText(
                text: 'Shared Task : ',
                fontSize: 15,
                fontWeight: FontWeight.w500),
            5.heightBox,
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      shape: BoxShape.circle),
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
                  label: const CustomText(text: 'Person 1'),
                  onDeleted: () {},
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  avatar: const CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 25,
                    // child: Icon(Icons.person),
                  ),
                )
              ],
            ),
            15.heightBox,
            CustomButton(
                width: double.infinity,
                height: 50,
                buttonTxt: 'Create Task',
                onPressed: () {
                  // context.read<TaskBuddyBloc>().add(const AddTasks(
                  //       'Task',
                  //     ));
                  context.router.pop();
                }),
          ],
        ).p12()),
      ),
    );
  }
}
