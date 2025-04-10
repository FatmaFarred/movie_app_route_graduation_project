part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitialState extends ChangePasswordState {}

final class ChangePasswordLoadingState extends ChangePasswordState {
  final String? loadingMessage;

  ChangePasswordLoadingState({this.loadingMessage});
}

final class ChangePasswordSuccessState extends ChangePasswordState {
  final CommonResponse? response;

  ChangePasswordSuccessState({this.response});
}

final class ChangePasswordErrorState extends ChangePasswordState {
  final Failure error;

  ChangePasswordErrorState({required this.error});
}
