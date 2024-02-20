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
        centerTitle: false,
        elevation: 0,
        title: const CustomText(
          text: 'Hello Buddy 👋',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        leading: CircleAvatar(
          // radius: 25,
          backgroundColor: Colors.purple[200],
          child: const Icon(
            Icons.person,
            // size: 35,
            color: Colors.black,
          ),
        ).pOnly(left: 10),
      ),
      // bottomNavigationBar:
      body: SafeArea(
        bottom: false,
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Stack(children: [
                SingleChildScrollView(
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        primary: false,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return const ChoiceChip(
                            // surfaceTintColor: Colors.green,
                            showCheckmark: true,
                            // disabledColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            avatar: Icon(Icons.task_alt),
                            label: CustomText(text: 'My Tasks'),
                            selected: false,
                          ).p8().centered();
                        },
                      ).h(50).w(double.infinity),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: 'My Tasks',
                            fontSize: 18,
                            textAlign: TextAlign.left,
                          ).pOnly(left: 12, top: 10),
                          const CustomText(
                            text: 'Scroll-up to view more >>',
                            fontSize: 14,
                            textAlign: TextAlign.right,
                            color: Colors.grey,
                          ).pOnly(right: 12, top: 10),
                        ],
                      ),
                      10.heightBox,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: 'Task Title $index',
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
                                        value: false,
                                        onChanged: (bool? value) {}),
                                  ],
                                ),
                                CustomText(
                                  text: 'Task Description $index',
                                  fontSize: 14,
                                ),
                                10.heightBox,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
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
                                          const CustomText(
                                            text: 'Due Date',
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
                                      child: const CustomText(
                                        text: 'Priority',
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
                        },
                      ),
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
