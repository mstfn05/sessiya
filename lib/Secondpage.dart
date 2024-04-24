import 'package:flutter/material.dart';
import 'package:flutter_application_1/Info.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/qr_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/bloc/registration_bloc.dart';
import 'package:flutter_application_1/bloc/registration_state.dart';
import 'package:flutter_application_1/generated/locale_keys.g.dart';
import 'package:flutter_application_1/insta.dart';
import 'package:flutter_application_1/jsonfile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bottom extends StatefulWidget {
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  bool userAlreadyLoggedIn = false;
  int _currentIndex = 0;
  String name = "Default Name";
  String phoneNumber = "Default Phone";
  String email = "Default Email";
  String country = "Default Country";

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      name = prefs.getString('name') ?? "Default Name";
      phoneNumber = prefs.getString('phoneNumber') ?? "Default Phone";
      email = prefs.getString('email') ?? "Default Email";
      country = prefs.getString('country') ?? "Default Country";
    }

    setState(() {
      userAlreadyLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
          if (state is RegistrationSuccess || userAlreadyLoggedIn) {
            List<Widget> _pages = [
              QRScanner(),
              User(),
              Data(),
              Insta(),
              Info(),
              UserDetails(
                name: name,
                phoneNumber: phoneNumber,
                email: email,
                country: country,
              ),
            ];
            return _pages[_currentIndex];
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'qr'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Insta'),
        BottomNavigationBarItem(icon: Icon(Icons.animation), label: 'flower'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'insta'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.deepPurple,
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String email;
  final String country;

  const UserDetails({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.nam.tr(), style: TextStyle(fontSize: 16)),
          Text(name, style: TextStyle(fontSize: 18.0)),
          SizedBox(height: 10.0),
          Text(LocaleKeys.phon.tr(), style: TextStyle(fontSize: 16)),
          Text(phoneNumber, style: TextStyle(fontSize: 18.0)),
          SizedBox(height: 10.0),
          Text(LocaleKeys.ma.tr(), style: TextStyle(fontSize: 16)),
          Text(email, style: TextStyle(fontSize: 18.0)),
          SizedBox(height: 10.0),
          Text(LocaleKeys.coun.tr(), style: TextStyle(fontSize: 16)),
          Text(country, style: TextStyle(fontSize: 18.0)),
        ],
      ),
    );
  }
}
