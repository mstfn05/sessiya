import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/bloc/data_event.dart';
import 'package:flutter_application_1/bloc/data_state.dart';
import 'package:flutter_application_1/repository/data_repository.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final DataApi api;

  DataBloc(this.api) : super(DataLoading()) {
    on<LoadData>((event, emit) async {
      try {
        final data = await api.getPosts();
        emit(DataLoaded(data));
      } catch (e) {
        emit(DataError());
      }
    });
  }
}
