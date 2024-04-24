import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/userbloc_bloc.dart';
import 'package:flutter_application_1/bloc/userbloc_event.dart';
import 'package:flutter_application_1/bloc/userbloc_state.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postBloc = UserBloc(UserRepository());

    return BlocProvider(
      create: (context) => postBloc,
      child: Scaffold(
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserInitial) {
              postBloc.add(FetchUsers());
              return CircularProgressIndicator();
            } else if (state is UserLoading) {
              return CircularProgressIndicator();
            } else if (state is UserLoaded) {
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.users[index].title),
                    subtitle: Text(state.users[index].body),
                  );
                },
              );
            } else if (state is UserError) {
              return Text('Error: ${state.error}');
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
