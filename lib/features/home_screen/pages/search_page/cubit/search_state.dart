part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitialState extends SearchState {}

final class SearchLoadingState extends SearchState {
  final String? loadingMessage;
  SearchLoadingState({this.loadingMessage});
}

final class SearchSuccessState extends SearchState {
  final List<MovieModel>? searchList;
  SearchSuccessState({required this.searchList});
}

final class SearchErrorState extends SearchState {
  final Failure error;
  SearchErrorState({required this.error});
}
