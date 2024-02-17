import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_buddy/shared/custom_font.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          centerTitle: true,
          title: const CustomText(
            text: "Profile",
            fontSize: 20,
            fontWeight: FontWeight.w500,
          )),
      body: const Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
