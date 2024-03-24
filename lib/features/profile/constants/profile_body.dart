import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_buddy/bloc/authentication/authentication_bloc.dart';
import 'package:task_buddy/bloc/authentication/authentication_event.dart';
import 'package:task_buddy/features/profile/constants/task_status.dart';
import 'package:task_buddy/shared/global_button.dart';
import 'package:task_buddy/shared/global_font.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
    required this.authenticationBloc,
  });

  final AuthenticationBloc authenticationBloc;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              20.heightBox,
              Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
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
                      title: GlobalText(
                        textAlign: TextAlign.start,
                        text: 'Page $index',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                      onTap: () {},
                    ),
                  );
                },
              ),
              35.heightBox,
              const Align(
                alignment: Alignment.centerLeft,
                child: GlobalText(text: 'Date Joined:__________', fontSize: 12),
              ).pOnly(left: 12),
              // 8.heightBox,
              GlobalButton(
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
    );
  }
}
