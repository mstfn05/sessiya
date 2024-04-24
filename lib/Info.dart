import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/info_bloc.dart';
import 'package:flutter_application_1/repository/info_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => InfoBloc(infoRepository: InfoRepository(Dio())),
        child: InfoPage(),
      ),
    );
  }
}

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<InfoBloc>().add(GetInfoEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<InfoBloc, InfoState>(
          builder: (context, state) {
            if (state is InfoLoading) {
              return CircularProgressIndicator();
            }
            if (state is InfoLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(state.info.title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Text(state.info.body, style: TextStyle(fontSize: 18)),
                  ),
                ],
              );
            }
            if (state is InfoError) {
              return Text(state.message);
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
