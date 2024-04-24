import 'package:equatable/equatable.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];
}

class SaveUserData extends RegistrationEvent {
  final String name, email, phoneNumber, country;

  const SaveUserData({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.country,
  });
}
