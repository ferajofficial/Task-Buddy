import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_buddy/bloc/app/app_bloc.dart';
import 'package:task_buddy/const/router/router.dart';

class TaskBuddy extends StatefulWidget {
  const TaskBuddy({super.key});

  @override
  State<TaskBuddy> createState() => _TaskBuddyState();
}

class _TaskBuddyState extends State<TaskBuddy> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AppBloc()),
          // BlocProvider(
          //     create: (context) => AuthenticationBloc(const AuthenticationState(
          //         authStatus: AuthenticationStatus.loading))),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
        ));
  }
}
