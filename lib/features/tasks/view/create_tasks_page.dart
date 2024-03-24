import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_buddy/features/tasks/contants/create_task_form.dart';
import 'package:task_buddy/shared/global_font.dart';

@RoutePage()
class CreateTasksPage extends StatelessWidget {
  const CreateTasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CreateTaskView();
  }
}

class CreateTaskView extends StatefulWidget {
  const CreateTaskView({super.key});

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              context.router.maybePop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          title: const GlobalText(
              text: 'Create Task', fontSize: 20, fontWeight: FontWeight.w500),
        ),
        body: const CreateTaskForm());
  }
}
