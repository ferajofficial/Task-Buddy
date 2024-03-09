import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_buddy/const/router/router.gr.dart';
import 'package:task_buddy/shared/custom_font.dart';
import 'package:task_buddy/shared/custom_navbar.dart';
import 'package:velocity_x/velocity_x.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false; // Set isLoading to false after the delay
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        centerTitle: false,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: ' Hello Buddy 👋',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            // 5.heightBox,
            ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return const ChoiceChip(
                  showCheckmark: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  avatar: Icon(Icons.task_alt),
                  label: CustomText(text: 'My Tasks'),
                  selected: true,
                ).p4();
              },
            ).h(50),
          ],
        ),
        leading: const CircleAvatar(
          // radius: 30,
          // backgroundColor: Colors.purple[200],
          child: Icon(
            Icons.person,
            color: Colors.black,
          ),
        ).pOnly(left: 10),
        toolbarHeight: 100,
      ),
      // bottomNavigationBar:
      body: SafeArea(
        bottom: false,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Stack(children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: const CustomText(
                          text: 'My Tasks',
                          fontSize: 18,
                          textAlign: TextAlign.left,
                        ).pOnly(left: 20, top: 10),
                      ),
                      10.heightBox,
                      // BlocBuilder<TaskBuddyBloc, TaskBuddyState>(
                      //   builder: (context, state) {
                      //     if (state.tasks.isEmpty) {
                      //       return const Center(
                      //         child: CustomText(
                      //           text: 'No Task found',
                      //           fontSize: 15,
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ).pOnly(top: 300);
                      //     } else if (state.tasks.isNotEmpty) {
                      //       // return const TaskCards();
                      //       return ListView.builder(
                      //           shrinkWrap: true,
                      //           physics: const NeverScrollableScrollPhysics(),
                      //           itemCount: state.tasks.length,
                      //           itemBuilder: (context, index) {
                      //             return TaskCards(
                      //                 taskTitle: state.tasks[index],
                      //                 taskDescription: 'description',
                      //                 dueDate: 'date',
                      //                 priority: 'priority');
                      //           });
                      //     } else {
                      //       return const Center(
                      //         child: CircularProgressIndicator(),
                      //       ).pOnly(top: 300);
                      //     }
                      //   },
                      // ),
                      
                    ],
                  ),
                ),
                CustomNavbar(
                  onPressed: () {
                    context.navigateTo(const TasksRoute());
                  },
                ).h(100).objectBottomCenter()
              ]),
      ),
    );
  }
}
