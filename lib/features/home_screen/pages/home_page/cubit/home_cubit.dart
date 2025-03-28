import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_route_graduation_project/core/utils/app_constants.dart';
import '../../../../../api/errors/failure.dart';
import '../../../../../data/model/movie/movie_model.dart';
import '../../../../../domain/use_cases/get_genre_use_case.dart';
import '../../../../../domain/use_cases/get_movies_carousel_use_case.dart';
import 'home_page_state.dart';

@injectable
class HomeCubit extends Cubit<HomePageState> {
  final GetCarouselMoviesUseCase _getCarouselMoviesUseCase;
  final GetGenreUseCase _getGenreUseCase;
  List<List<MovieModel>> genresLists = [];

  HomeCubit(this._getCarouselMoviesUseCase, this._getGenreUseCase)
      : super(HomePageInitialState());

  Future<void> getCarouselMovies() async {
    emit(HomePageLoadingCarouselState());
    try {
      var response = await _getCarouselMoviesUseCase.execute();
      emit(HomePageSuccessState(
        carouselMovies: response ?? [],
        genresLists: genresLists,
      ));
    } catch (e) {
      if (e is Failure) {
        emit(HomePageErrorState(error: e));
      } else {
        emit(HomePageErrorState(error: ServerError(errorMessage: e.toString())));
      }
    }
  }

  Future<void> getGenres() async {
    try {
      for (var genre in AppConstants.genresList) {
        var response = await _getGenreUseCase(genre, 1);
        genresLists.add(response?.data?.movies
            ?.map((moviesDto) => moviesDto.toMovieModel())
            .toList() ??
            []);

        var currentState = state;
        if (currentState is HomePageSuccessState) {
          emit(currentState.copyWith(
            carouselMovies: currentState.carouselMovies,
            genresLists: genresLists,
          ));
        }
      }
    } catch (e) {
      if (e is Failure) {
        //emit(HomePageErrorState(error: e));
      } else {
        //emit(HomePageErrorState(error: ServerError(errorMessage: e.toString())));
      }
    }
  }
}
