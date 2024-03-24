import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_buddy/features/home/constants/home_body.dart';
import 'package:task_buddy/shared/global_font.dart';
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
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GlobalText(
                text: ' Hello Buddy 👋',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
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
                    label: GlobalText(text: 'My Tasks'),
                    selected: true,
                  ).p4();
                },
              ).h(50),
            ],
          ),
          leading: const CircleAvatar(
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ).pOnly(left: 10),
          toolbarHeight: 100,
        ),
        body: const HomeBody());
  }
}
