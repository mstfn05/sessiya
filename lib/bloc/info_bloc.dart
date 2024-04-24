import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/model/Info.dart';
import 'package:flutter_application_1/repository/info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final InfoRepository infoRepository;

  InfoBloc({required this.infoRepository}) : super(InfoInitial()) {
    on<GetInfoEvent>((event, emit) async {
      try {
        emit(InfoLoading());
        final info = await infoRepository.getPost();
        emit(InfoLoaded(info));
      } catch (error) {
        emit(InfoError("Error fetching post"));
      }
    });
  }
}
