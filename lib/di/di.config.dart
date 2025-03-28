// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/api_manager.dart' as _i1047;
import '../data/data_sources/carousel_online_date_source.dart' as _i810;
import '../data/data_sources/change_password_online_data_source.dart' as _i416;
import '../data/data_sources/favorites_online_data_source.dart' as _i997;
import '../data/data_sources/genre_online_data_source.dart' as _i422;
import '../data/data_sources/google_login_online_data_source.dart' as _i639;
import '../data/data_sources/history_offline_data_source.dart' as _i964;
import '../data/data_sources/offline_data_source/history_offline_data_source_impl.dart'
    as _i820;
import '../data/data_sources/profile_online_data_source.dart' as _i779;
import '../data/data_sources/remote_data_sources/carousel_movies_online_data_source_impl.dart'
    as _i599;
import '../data/data_sources/remote_data_sources/change_password_online_data_source_impl.dart'
    as _i402;
import '../data/data_sources/remote_data_sources/favorites_online_data_source_impl.dart'
    as _i375;
import '../data/data_sources/remote_data_sources/genre_online_data_source_impl.dart'
    as _i374;
import '../data/data_sources/remote_data_sources/google_login_online_data_source_impl.dart'
    as _i1020;
import '../data/data_sources/remote_data_sources/login_remote_data_source_impl.dart'
    as _i380;
import '../data/data_sources/remote_data_sources/movie_details_remote_data_source_impl.dart'
    as _i1057;
import '../data/data_sources/remote_data_sources/profile_online_data_source_impl.dart'
    as _i379;
import '../data/data_sources/remote_data_sources/register_remote_data_source_impl.dart'
    as _i226;
import '../data/data_sources/remote_data_sources/search_online_data_source_impl.dart'
    as _i513;
import '../data/data_sources/search_online_data_source.dart' as _i996;
import '../data/repositries/carousel_repo_impl.dart' as _i118;
import '../data/repositries/change_password_repo_impl.dart' as _i471;
import '../data/repositries/favorites_repo_impl.dart' as _i1060;
import '../data/repositries/genre_repo_impl.dart' as _i971;
import '../data/repositries/google_login_repo_impl.dart' as _i834;
import '../data/repositries/history_repo_impl.dart' as _i325;
import '../data/repositries/login_repository_impl.dart' as _i714;
import '../data/repositries/movie_details_repository_impl.dart' as _i217;
import '../data/repositries/profile_repo_impl.dart' as _i410;
import '../data/repositries/register_repository_impl.dart' as _i119;
import '../data/repositries/search_repo_impl.dart' as _i969;
import '../domain/repositries/carousel_repo.dart' as _i35;
import '../domain/repositries/change_password_repo.dart' as _i325;
import '../domain/repositries/data_sources/remote_data_sources/login_remote_data_source.dart'
    as _i772;
import '../domain/repositries/data_sources/remote_data_sources/movie_details_data_source.dart'
    as _i415;
import '../domain/repositries/data_sources/remote_data_sources/register_remote_data_source.dart'
    as _i857;
import '../domain/repositries/favorites_repo.dart' as _i474;
import '../domain/repositries/genre_repo.dart' as _i596;
import '../domain/repositries/google_login_repo.dart' as _i376;
import '../domain/repositries/history_repo.dart' as _i540;
import '../domain/repositries/profile_repo.dart' as _i47;
import '../domain/repositries/reposotries/auth_repositry.dart' as _i538;
import '../domain/repositries/reposotries/login_repository.dart' as _i702;
import '../domain/repositries/reposotries/movie_details_repositry.dart'
    as _i998;
import '../domain/repositries/search_repo.dart' as _i402;
import '../domain/use_cases/add_to_favorite_use_case.dart' as _i594;
import '../domain/use_cases/add_to_history_use_case.dart' as _i895;
import '../domain/use_cases/change_password_use_case.dart' as _i851;
import '../domain/use_cases/delete_profile_use_case.dart' as _i885;
import '../domain/use_cases/get_all_favorites_use_case.dart' as _i172;
import '../domain/use_cases/get_genre_use_case.dart' as _i988;
import '../domain/use_cases/get_movie_from_history_use_case.dart' as _i294;
import '../domain/use_cases/get_movie_is_favorite_use_case.dart' as _i584;
import '../domain/use_cases/get_movies_carousel_use_case.dart' as _i525;
import '../domain/use_cases/get_profile_use_case.dart' as _i570;
import '../domain/use_cases/get_search_use_case.dart' as _i589;
import '../domain/use_cases/google_login_use_case.dart' as _i653;
import '../domain/use_cases/login_use_case.dart' as _i826;
import '../domain/use_cases/movie_deatils_use_case.dart' as _i661;
import '../domain/use_cases/movie_suggestion_use_case.dart' as _i540;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../domain/use_cases/remove_from_favorite_use_case.dart' as _i687;
import '../domain/use_cases/update_profile_use_case.dart' as _i403;
import '../features/auth/change/cubit/change_password_cubit.dart' as _i108;
import '../features/auth/login/login_cubit/login_view_model.dart' as _i868;
import '../features/auth/register/register_cubit/register_view_model.dart'
    as _i102;
import '../features/home_screen/pages/explore_page/cubit/explore_cubit.dart'
    as _i563;
import '../features/home_screen/pages/home_page/cubit/home_cubit.dart' as _i324;
import '../features/home_screen/pages/profile_page/cubit/profile_cubit.dart'
    as _i423;
import '../features/home_screen/pages/search_page/cubit/search_cubit.dart'
    as _i881;
import '../features/homescreen/MovieDetails/MovieDetailsViewModel.dart' as _i70;
import '../features/homescreen/MovieDetails/MovieSuggetion/MovieSuggetionViewModel.dart'
    as _i705;
import '../features/update_profile/cubit/update_profile_cubit.dart' as _i848;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i415.MovieDetailsDataSource>(() =>
        _i1057.MovieDetailsRemoteDataSourceImpl(
            apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i772.LoginRemoteDataSource>(() =>
        _i380.LoginRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i964.HistoryOfflineDataSource>(
        () => _i820.HistoryOfflineDataSourceImpl());
    gh.factory<_i639.GoogleLoginOnlineDataSource>(
        () => _i1020.GoogleLoginOnlineDataSourceImpl());
    gh.factory<_i857.RegisterRemoteDataSource>(() =>
        _i226.RegisterRemoteDataSourceImpl(
            apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i998.MovieDetailsRepository>(() =>
        _i217.MovieDetailsRepositoryImpl(
            movieDetailsDataSource: gh<_i415.MovieDetailsDataSource>()));
    gh.factory<_i997.FavoritesOnlineDataSource>(
        () => _i375.FavoritesOnlineDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i661.MovieDetailsUseCase>(() => _i661.MovieDetailsUseCase(
        movieDetailsRepositry: gh<_i998.MovieDetailsRepository>()));
    gh.factory<_i540.MovieSuggestionUseCase>(() => _i540.MovieSuggestionUseCase(
        movieDetailsRepositry: gh<_i998.MovieDetailsRepository>()));
    gh.factory<_i416.ChangePasswordOnlineDataSource>(() =>
        _i402.ChangePasswordOnlineDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i996.SearchOnlineDataSource>(
        () => _i513.SearchOnlineDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i705.MovieSuggetionViewModel>(() =>
        _i705.MovieSuggetionViewModel(
            movieSuggetionUseCase: gh<_i540.MovieSuggestionUseCase>()));
    gh.factory<_i540.HistoryRepo>(
        () => _i325.HistoryRepoImpl(gh<_i964.HistoryOfflineDataSource>()));
    gh.factory<_i779.ProfileOnlineDataSource>(
        () => _i379.ProfileOnlineDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i422.GenreOnlineDataSource>(
        () => _i374.GenreOnlineDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i474.FavoritesRepo>(
        () => _i1060.FavoritesRepoImpl(gh<_i997.FavoritesOnlineDataSource>()));
    gh.factory<_i810.CarouselOnlineDataSource>(
        () => _i599.CarouselOnlineDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i376.GoogleLoginRepo>(() =>
        _i834.GoogleLoginRepoImpl(gh<_i639.GoogleLoginOnlineDataSource>()));
    gh.factory<_i538.RegisterRepositry>(() => _i119.RegisterRepositoryImpl(
        register_remote_data_source: gh<_i857.RegisterRemoteDataSource>()));
    gh.factory<_i325.ChangePasswordRepo>(() => _i471.ChangePasswordRepoImpl(
        gh<_i416.ChangePasswordOnlineDataSource>()));
    gh.factory<_i596.GenreRepo>(
        () => _i971.GenreRepoImpl(gh<_i422.GenreOnlineDataSource>()));
    gh.factory<_i702.LoginRepository>(() => _i714.LoginRepositoryImpl(
        loginRemoteDatasource: gh<_i772.LoginRemoteDataSource>()));
    gh.factory<_i653.GoogleLoginUseCase>(
        () => _i653.GoogleLoginUseCase(gh<_i376.GoogleLoginRepo>()));
    gh.factory<_i988.GetGenreUseCase>(
        () => _i988.GetGenreUseCase(gh<_i596.GenreRepo>()));
    gh.factory<_i47.ProfileRepo>(
        () => _i410.ProfileRepoImpl(gh<_i779.ProfileOnlineDataSource>()));
    gh.factory<_i772.RegisterUseCase>(() => _i772.RegisterUseCase(
        registerRepositry: gh<_i538.RegisterRepositry>()));
    gh.factory<_i35.CarouselRepo>(
        () => _i118.CarouselRepoImpl(gh<_i810.CarouselOnlineDataSource>()));
    gh.factory<_i402.SearchRepo>(
        () => _i969.SearchRepoImpl(gh<_i996.SearchOnlineDataSource>()));
    gh.factory<_i563.ExploreCubit>(
        () => _i563.ExploreCubit(gh<_i988.GetGenreUseCase>()));
    gh.factory<_i895.AddToHistoryUseCase>(
        () => _i895.AddToHistoryUseCase(gh<_i540.HistoryRepo>()));
    gh.factory<_i294.GetMovieFromHistoryUseCase>(
        () => _i294.GetMovieFromHistoryUseCase(gh<_i540.HistoryRepo>()));
    gh.factory<_i102.RegisterViewModel>(() =>
        _i102.RegisterViewModel(registerUseCase: gh<_i772.RegisterUseCase>()));
    gh.factory<_i589.GetSearchUseCase>(
        () => _i589.GetSearchUseCase(gh<_i402.SearchRepo>()));
    gh.factory<_i594.AddToFavoriteUseCase>(
        () => _i594.AddToFavoriteUseCase(gh<_i474.FavoritesRepo>()));
    gh.factory<_i172.GetAllFavoritesUseCase>(
        () => _i172.GetAllFavoritesUseCase(gh<_i474.FavoritesRepo>()));
    gh.factory<_i584.GetMovieIsFavoriteUseCase>(
        () => _i584.GetMovieIsFavoriteUseCase(gh<_i474.FavoritesRepo>()));
    gh.factory<_i687.RemoveFromFavoriteUseCase>(
        () => _i687.RemoveFromFavoriteUseCase(gh<_i474.FavoritesRepo>()));
    gh.factory<_i851.ChangePasswordUseCase>(
        () => _i851.ChangePasswordUseCase(gh<_i325.ChangePasswordRepo>()));
    gh.factory<_i826.LoginUseCase>(
        () => _i826.LoginUseCase(loginRepositry: gh<_i702.LoginRepository>()));
    gh.factory<_i525.GetCarouselMoviesUseCase>(
        () => _i525.GetCarouselMoviesUseCase(gh<_i35.CarouselRepo>()));
    gh.factory<_i885.DeleteProfileUseCase>(
        () => _i885.DeleteProfileUseCase(gh<_i47.ProfileRepo>()));
    gh.factory<_i570.GetProfileUseCase>(
        () => _i570.GetProfileUseCase(gh<_i47.ProfileRepo>()));
    gh.factory<_i403.UpdateProfileUseCase>(
        () => _i403.UpdateProfileUseCase(gh<_i47.ProfileRepo>()));
    gh.factory<_i848.UpdateProfileCubit>(() => _i848.UpdateProfileCubit(
          gh<_i570.GetProfileUseCase>(),
          gh<_i403.UpdateProfileUseCase>(),
          gh<_i885.DeleteProfileUseCase>(),
        ));
    gh.factory<_i108.ChangePasswordCubit>(
        () => _i108.ChangePasswordCubit(gh<_i851.ChangePasswordUseCase>()));
    gh.factory<_i868.LoginViewModel>(() => _i868.LoginViewModel(
          useCase: gh<_i826.LoginUseCase>(),
          googleUseCase: gh<_i653.GoogleLoginUseCase>(),
          registerUseCase: gh<_i772.RegisterUseCase>(),
        ));
    gh.factory<_i70.MovieDetailsViewModel>(() => _i70.MovieDetailsViewModel(
          movieDetailsUseCase: gh<_i661.MovieDetailsUseCase>(),
          addToHistoryUseCase: gh<_i895.AddToHistoryUseCase>(),
          getMovieFromHistoryUseCase: gh<_i294.GetMovieFromHistoryUseCase>(),
          addToFavoriteUseCase: gh<_i594.AddToFavoriteUseCase>(),
          getMovieIsFavoriteUseCase: gh<_i584.GetMovieIsFavoriteUseCase>(),
          removeFromFavoriteUseCase: gh<_i687.RemoveFromFavoriteUseCase>(),
        ));
    gh.factory<_i423.ProfileCubit>(() => _i423.ProfileCubit(
          gh<_i570.GetProfileUseCase>(),
          gh<_i172.GetAllFavoritesUseCase>(),
          gh<_i294.GetMovieFromHistoryUseCase>(),
        ));
    gh.factory<_i881.SearchCubit>(
        () => _i881.SearchCubit(gh<_i589.GetSearchUseCase>()));
    gh.factory<_i324.HomeCubit>(() => _i324.HomeCubit(
          gh<_i525.GetCarouselMoviesUseCase>(),
          gh<_i988.GetGenreUseCase>(),
        ));
    return this;
  }
}
