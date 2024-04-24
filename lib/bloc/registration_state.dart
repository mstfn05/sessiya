import 'package:equatable/equatable.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object?> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {
  final String name;
  final String phoneNumber;
  final String email;
  final String country;

  RegistrationSuccess({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.country,
  });

  @override
  List<Object?> get props => [name, phoneNumber, email, country];
}

class RegistrationFailure extends RegistrationState {
  final String error;

  const RegistrationFailure(this.error);

  @override
  List<Object?> get props => [error];
}
