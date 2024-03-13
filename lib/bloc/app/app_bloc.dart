import 'package:bloc/bloc.dart';

import 'package:task_buddy/bloc/app/app_event.dart';
import 'package:task_buddy/bloc/app/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  
  AppBloc() : super(const AppInitialState()) {
    on<AppInitialEvent>(_onInitialEvent);
  }
}

void _onInitialEvent(AppInitialEvent event, Emitter<AppState> emit) async {
  emit(const AppLoadingState());

  await Future.delayed(const Duration(seconds: 2));
  emit(const AppLoadedState());

  await Future.delayed(const Duration(seconds: 1));
  emit(const AppSuccessState());
}
