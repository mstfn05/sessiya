part of 'info_bloc.dart';

abstract class InfoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetInfoEvent extends InfoEvent {}
