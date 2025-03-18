part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitialState extends ProfileState {}

final class ProfileLoadingState extends ProfileState {
  final String? loadingMessage;

  ProfileLoadingState({this.loadingMessage});
}

final class ProfileSuccessState extends ProfileState {
  final Profile? profileData;

  ProfileSuccessState({this.profileData});
}

final class ProfileErrorState extends ProfileState {
  final Failure error;
  ProfileErrorState({required this.error});
}

final class UpdateProfileLoadingState extends ProfileState{
  final String? loadingMessage;

  UpdateProfileLoadingState({this.loadingMessage});
}

final class UpdateProfileSuccessState extends ProfileState {
  final UpdateProfile? updateProfile;

  UpdateProfileSuccessState({this.updateProfile});
}

final class UpdateProfileErrorState extends ProfileState {
  final Failure error;
  UpdateProfileErrorState({required this.error});
}

final class DeleteProfileLoadingState extends ProfileState{
  final String? loadingMessage;

  DeleteProfileLoadingState({this.loadingMessage});
}

final class DeleteProfileSuccessState extends ProfileState {
  final DeleteProfile? deleteProfile;

  DeleteProfileSuccessState({this.deleteProfile});
}

final class DeleteProfileErrorState extends ProfileState {
  final Failure error;
  DeleteProfileErrorState({required this.error});
}