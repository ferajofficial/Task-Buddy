import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_buddy/const/router/router.gr.dart';
import 'package:task_buddy/shared/global_font.dart';
import 'package:task_buddy/shared/navbar.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: const GlobalText(
                  text: 'My Tasks',
                  fontSize: 18,
                  textAlign: TextAlign.left,
                ).pOnly(left: 20, top: 10),
              ),
              10.heightBox,
              // return const TaskCards();
              // ListView.builder(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     // itemCount:tasks.length,
              //     itemBuilder: (context, index) {
              //       return const TaskCards(
              //           taskTitle: 'title',
              //           taskDescription: 'description',
              //           dueDate: 'date',
              //           priority: 'priority');
              //     })
            ],
          ),
        ),
        Navbar(
          onPressed: () {
            context.navigateTo(const CreateTasksRoute());
          },
        ).h(100).objectBottomCenter()
      ]),
    );
  }
}
