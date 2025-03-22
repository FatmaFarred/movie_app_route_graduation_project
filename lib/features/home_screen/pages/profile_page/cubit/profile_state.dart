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
  final List<Favorites>? favoritesList;
  ProfileSuccessState({this.profileData, this.favoritesList});

  ProfileSuccessState copyWith({
    Profile? profileData,
    List<Favorites>? favoritesList,
  }) {
    return ProfileSuccessState(
      profileData: profileData ?? this.profileData,
      favoritesList: favoritesList ?? this.favoritesList,
    );
  }
}

final class ProfileErrorState extends ProfileState {
  final Failure error;
  ProfileErrorState({required this.error});
}
