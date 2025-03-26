part of 'explore_cubit.dart';

@immutable
sealed class ExploreState {}

final class ExploreInitialState extends ExploreState {}
final class ExploreLoadingState extends ExploreState {
  final String? loadingMessage;
  ExploreLoadingState({this.loadingMessage});
}
final class ExploreSuccessState extends ExploreState {
  final List<MovieModel>? moviesList;
  ExploreSuccessState({required this.moviesList});
}
final class ExploreErrorState extends ExploreState {
  final Failure error;
  ExploreErrorState({required this.error});
}
