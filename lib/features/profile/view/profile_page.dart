import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_event.dart';
import 'package:task_buddy/bloc/authentication/authentication_state.dart';
import 'package:task_buddy/const/router/router.gr.dart';
import 'package:task_buddy/features/profile/constants/task_status.dart';
import 'package:task_buddy/shared/custom_button.dart';
import 'package:task_buddy/shared/custom_font.dart';
import 'package:velocity_x/velocity_x.dart';

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
  bool isLoading = true;
  final authenticationBloc = AuthenticationBloc();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false; // Set isLoading to false after the delay
      });
    });
    // authenticationBloc.add(AuthenticationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      bloc: authenticationBloc,
      listenWhen: (previous, current) => current is AuthActionState,
      listener: (context, state) {
        if (state is AuthSignOutState) {
          log('state : $state');
          context.router.replaceAll([const SigninRoute()]);
          // pushAndPopUntil(
          //   const SigninRoute(),
          //   predicate: (route) => route.settings.name == HomeRoute.name,
          // );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.maybePop();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            centerTitle: true,
            title: const CustomText(
              text: "Profile",
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.light_rounded,
                    size: 30,
                  ),
                ).h(40).w(40),
              ),
            ],
          ),
          body:
              //  isLoading
              //     ? const Center(child: CircularProgressIndicator())
              //     :
              SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    20.heightBox,
                    Container(
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 8,
                          )
                        ]),
                        child: const CircleAvatar(
                          radius: 80,
                        )),
                    30.heightBox,
                    const TaskCounts(),
                    20.heightBox,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      itemCount: 2,
                      padding: const EdgeInsets.all(5),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                          elevation: 0,
                          child: ListTile(
                            // tileColor: Colors.blue.shade100,

                            leading: const Icon(Icons.task_alt),
                            title: CustomText(
                              textAlign: TextAlign.start,
                              text: 'Page $index',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                    35.heightBox,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                          text: 'Date Joined:__________', fontSize: 12),
                    ).pOnly(left: 12),
                    // 8.heightBox,
                    CustomButton(
                      width: double.infinity,
                      height: 50,
                      buttonTxt: 'Logout',
                      onPressed: () {
                        // ---> [ It Performs Logout and redirect to the SignIn Page ]
                        log('LogOut Button Pressed');
                        authenticationBloc.add(OnSignOutEvent());
                        // context.navigateTo(const SigninRoute());
                      },
                    ).p12(),
                  ],
                ).p12(),
              ),
            ),
          ),
        );
      },
    );
  }
}
