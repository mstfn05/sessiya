import 'package:flutter_application_1/model/data.dart';

abstract class DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final List<Data> data;
  DataLoaded(this.data);
}

class DataError extends DataState {}
