import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/anim.dart';
import 'package:flutter_application_1/bloc/data_bloc.dart';
import 'package:flutter_application_1/bloc/data_event.dart';
import 'package:flutter_application_1/bloc/data_state.dart';
import 'package:flutter_application_1/repository/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (context) => DataBloc(DataApi(Dio())),
          child: DataWidget(),
        ),
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<DataBloc>().add(LoadData());
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        if (state is DataLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DataLoaded) {
          return AnimatedFlower(); // Используйте ваш виджет анимации цветка здесь
        } else if (state is DataError) {
          return Center(
            child: Text("Произошла ошибка при загрузке данных"),
          );
        } else {
          return Center(
            child: Text("Неизвестное состояние"),
          );
        }
      },
    );
  }
}