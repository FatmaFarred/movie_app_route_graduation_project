import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../Api manager/errors/failure.dart';
import '../../../../../domain/use_cases/get_genre_use_case.dart';
import '../../../../../domain/use_cases/get_movies_carousel_use_case.dart';
import 'home_page_state.dart';

@injectable
class HomeCubit extends Cubit<HomePageState> {
  final GetCarouselMoviesUseCase _getCarouselMoviesUseCase;
  final GetGenreUseCase _getGenreUseCase;

  HomeCubit(this._getCarouselMoviesUseCase, this._getGenreUseCase)
      : super(HomePageInitialState());

  Future<void> getCarouselMovies() async {
    emit(HomePageLoadingCarouselState());
    try {
      var response = await _getCarouselMoviesUseCase.execute();
      emit(HomePageSuccessState(
        carouselMovies: response ?? [],
        genreActionMovies: state is HomePageSuccessState
            ? (state as HomePageSuccessState).genreActionMovies
            : [],
        genreComedyMovies: state is HomePageSuccessState
            ? (state as HomePageSuccessState).genreComedyMovies
            : [],
      ));
    } catch (e) {
      if (e is Failure) {
        emit(HomePageErrorState(error: e));
      } else {
        emit(HomePageErrorState(error: serverError(errorMessage: e.toString())));
      }
    }
  }

  Future<void> getActionGenre(String genre) async {
    emit(HomePageLoadingGenreState());
    try {
      var response = await _getGenreUseCase(genre);
      emit(HomePageSuccessState(
        carouselMovies: state is HomePageSuccessState
            ? (state as HomePageSuccessState).carouselMovies
            : [],
        genreActionMovies: response ?? [],
        genreComedyMovies: state is HomePageSuccessState
            ? (state as HomePageSuccessState).genreComedyMovies
            : [], // Preserve existing Comedy movies
      ));
    } catch (e) {
      if (e is Failure) {
        emit(HomePageErrorState(error: e));
      } else {
        emit(HomePageErrorState(error: serverError(errorMessage: e.toString())));
      }
    }
  }

  Future<void> getComedyGenre(String genre) async {
    emit(HomePageLoadingGenreState());
    try {
      var response = await _getGenreUseCase(genre);
      emit(HomePageSuccessState(
        carouselMovies: state is HomePageSuccessState
            ? (state as HomePageSuccessState).carouselMovies
            : [],
        genreActionMovies: state is HomePageSuccessState
            ? (state as HomePageSuccessState).genreActionMovies
            : [], // Preserve existing Action movies
        genreComedyMovies: response ?? [],
      ));
    } catch (e) {
      if (e is Failure) {
        emit(HomePageErrorState(error: e));
      } else {
        emit(HomePageErrorState(error: serverError(errorMessage: e.toString())));
      }
    }
  }
}
