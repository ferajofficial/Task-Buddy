import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_buddy/bloc/app/app_event.dart';
import 'package:task_buddy/bloc/app/app_state.dart';
import 'package:task_buddy/utils/app_constants.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppInitialState()) {
    on<AppInitialEvent>(_onInitialEvent);
  }

  FutureOr<void> _onInitialEvent(
      AppInitialEvent event, Emitter<AppState> emit) async {
    emit(const AppLoadingState());

    await Future.delayed(const Duration(seconds: 3));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString(AppConstatns.userId);

    if (userId != null) {
      emit(const UserAuthenticatedState());
    } else {
      emit(const UserUnAuthenticatedState());
    }
    
  }
}
