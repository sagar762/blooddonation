import 'package:equatable/equatable.dart';

import '../user_model.dart';

abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  UserLoadedState(this.users);
  final List<UserModel> users;

  List<Object?> get props => [users];
}

class UserErrorState extends UserState {
  UserErrorState(this.error);
  final String error;

  List<Object?> get props => [error];
}
