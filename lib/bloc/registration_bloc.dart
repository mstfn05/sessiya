import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'registration_event.dart';
import 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<SaveUserData>(_onSaveUserData);
  }

  Future<void> _onSaveUserData(
      SaveUserData event, Emitter<RegistrationState> emit) async {
    emit(RegistrationLoading());
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', event.name);
      await prefs.setString('email', event.email);
      await prefs.setString('phoneNumber', event.phoneNumber);
      await prefs.setString('country', event.country);
      emit(RegistrationSuccess(
          name: event.name,
          phoneNumber: event.phoneNumber,
          email: event.email,
          country: event.country));
    } catch (e) {
      emit(RegistrationFailure(e.toString()));
    }
  }
}
