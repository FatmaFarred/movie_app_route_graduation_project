part of 'update_profile_cubit.dart';

@immutable
sealed class UpdateProfileState {}

final class ProfileInitialState extends UpdateProfileState {}

final class ProfileLoadingState extends UpdateProfileState {
  final String? loadingMessage;

  ProfileLoadingState({this.loadingMessage});
}

final class ProfileSuccessState extends UpdateProfileState {
  final Profile? profileData;

  ProfileSuccessState({this.profileData});
}

final class ProfileErrorState extends UpdateProfileState {
  final Failure error;
  ProfileErrorState({required this.error});
}

final class UpdateProfileLoadingState extends UpdateProfileState{
  final String? loadingMessage;

  UpdateProfileLoadingState({this.loadingMessage});
}

final class UpdateProfileSuccessState extends UpdateProfileState {
  final UpdateProfile? updateProfile;

  UpdateProfileSuccessState({this.updateProfile});
}

final class UpdateProfileErrorState extends UpdateProfileState {
  final Failure error;
  UpdateProfileErrorState({required this.error});
}

final class DeleteProfileLoadingState extends UpdateProfileState{
  final String? loadingMessage;

  DeleteProfileLoadingState({this.loadingMessage});
}

final class DeleteProfileSuccessState extends UpdateProfileState {
  final DeleteProfile? deleteProfile;

  DeleteProfileSuccessState({this.deleteProfile});
}

final class DeleteProfileErrorState extends UpdateProfileState {
  final Failure error;
  DeleteProfileErrorState({required this.error});
}