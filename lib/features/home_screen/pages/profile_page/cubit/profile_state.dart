part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitialState extends ProfileState {}

final class ProfileLoadingState extends ProfileState {
  final String? loadingMessage;
  ProfileLoadingState({this.loadingMessage});
}

final class ProfileSuccessState extends ProfileState {
  final ProfileEntity? profileData;
  final List<MovieModel>? favoritesList;
  final List<MovieModel>? historyList;
  ProfileSuccessState({this.profileData, this.favoritesList, this.historyList});
}

final class ProfileErrorState extends ProfileState {
  final Failure error;
  ProfileErrorState({required this.error});
}
