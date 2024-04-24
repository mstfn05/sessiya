import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/bloc/userbloc_event.dart';
import 'package:flutter_application_1/bloc/userbloc_state.dart';
import 'package:flutter_application_1/repository/repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc(this.repository) : super(UserInitial()) {
    on<FetchUsers>(_onFetchPosts);
  }

  Future<void> _onFetchPosts(FetchUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final posts = await repository.getPosts();
      emit(UserLoaded(posts));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
