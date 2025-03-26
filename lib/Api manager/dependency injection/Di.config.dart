// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_sources/change_password_online_data_source.dart'
    as _i222;
import '../../data/data_sources/favorites_online_data_source.dart' as _i908;
import '../../data/data_sources/history_offline_data_source.dart' as _i78;
import '../../data/data_sources/offline_data_source/history_offline_data_source_impl.dart'
    as _i584;
import '../../data/data_sources/profile_online_data_source.dart' as _i525;
import '../../data/data_sources/remote_data_sources/change_password_online_data_source_impl.dart'
    as _i557;
import '../../data/data_sources/remote_data_sources/favorites_online_data_source_impl.dart'
    as _i148;
import '../../data/data_sources/remote_data_sources/Login_Remote_DataSource_impl.dart'
    as _i944;
import '../../data/data_sources/remote_data_sources/Movie_Deatils_Remote_Data_Source_impl.dart'
    as _i315;
import '../../data/data_sources/remote_data_sources/profile_online_data_source_impl.dart'
    as _i150;
import '../../data/data_sources/remote_data_sources/Register_remote_datasource_impl.dart'
    as _i282;
import '../../data/data_sources/remote_data_sources/search_online_data_source_impl.dart'
    as _i278;
import '../../data/data_sources/search_online_data_source.dart' as _i456;
import '../../data/repositries/change_password_repo_impl.dart' as _i667;
import '../../data/repositries/favorites_repo_impl.dart' as _i509;
import '../../data/repositries/history_repo_impl.dart' as _i870;
import '../../data/repositries/Login_repositry_impl.dart' as _i109;
import '../../data/repositries/Movie_Deatils_repositry_impl.dart' as _i329;
import '../../data/repositries/profile_repo_impl.dart' as _i688;
import '../../data/repositries/Register_Repositry_impl.dart' as _i713;
import '../../data/repositries/search_repo_impl.dart' as _i61;
import '../../domain/repositries/change_password_repo.dart' as _i874;
import '../../domain/repositries/data_sources/remote_data_sources/Login_remote_datasource.dart'
    as _i965;
import '../../domain/repositries/data_sources/remote_data_sources/Movie%20_Details_data_source.dart'
    as _i910;
import '../../domain/repositries/data_sources/remote_data_sources/Register_remote_datasource.dart'
    as _i398;
import '../../domain/repositries/favorites_repo.dart' as _i414;
import '../../domain/repositries/history_repo.dart' as _i356;
import '../../domain/repositries/profile_repo.dart' as _i649;
import '../../domain/repositries/reposotries/auth_repositry.dart' as _i1048;
import '../../domain/repositries/reposotries/Login_repositry.dart' as _i699;
import '../../domain/repositries/reposotries/movie_details_repositry.dart'
    as _i691;
import '../../domain/repositries/search_repo.dart' as _i1021;
import '../../domain/use_cases/add_to_favorite_use_case.dart' as _i851;
import '../../domain/use_cases/add_to_history_use_case.dart' as _i889;
import '../../domain/use_cases/change_password_use_case.dart' as _i838;
import '../../domain/use_cases/delete_profile_use_case.dart' as _i980;
import '../../domain/use_cases/get_all_favorites_use_case.dart' as _i847;
import '../../domain/use_cases/get_movie_from_history_use_case.dart' as _i538;
import '../../domain/use_cases/get_movie_is_favorite_use_case.dart' as _i802;
import '../../domain/use_cases/get_profile_use_case.dart' as _i305;
import '../../domain/use_cases/get_search_use_case.dart' as _i659;
import '../../domain/use_cases/Login_useCase.dart' as _i467;
import '../../domain/use_cases/Movie%20_suggetion_use_case.dart' as _i768;
import '../../domain/use_cases/movie_deatils_use_case.dart' as _i729;
import '../../domain/use_cases/Register_usecase.dart' as _i147;
import '../../domain/use_cases/remove_from_favorite_use_case.dart' as _i90;
import '../../domain/use_cases/update_profile_use_case.dart' as _i557;
import '../../features/auth/change/cubit/change_password_cubit.dart' as _i1063;
import '../../features/auth/login/login_cubit/login_view_model.dart' as _i301;
import '../../features/auth/Reigster/Register_cubit/register_view_model.dart'
    as _i225;
import '../../features/home_screen/pages/profile_page/cubit/profile_cubit.dart'
    as _i978;
import '../../features/home_screen/pages/search_page/cubit/search_cubit.dart'
    as _i91;
import '../../features/homescreen/MovieDetails/MovieDetailsViewModel.dart'
    as _i334;
import '../../features/homescreen/MovieDetails/MovieSuggetion/MovieSuggetionViewModel.dart'
    as _i291;
import '../../features/update_profile/cubit/update_profile_cubit.dart' as _i854;
import '../Api_manager.dart' as _i681;

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
    gh.singleton<_i681.ApiManager>(() => _i681.ApiManager());
    gh.factory<_i965.LoginRemoteDatasource>(() =>
        _i944.LoginRemoteDataSourceImpl(apiManager: gh<_i681.ApiManager>()));
    gh.factory<_i910.MovieDetailsDataSource>(() =>
        _i315.MovieDetailsRemoteDataSourceImpl(
            apiManager: gh<_i681.ApiManager>()));
    gh.factory<_i78.HistoryOfflineDataSource>(
        () => _i584.HistoryOfflineDataSourceImpl());
    gh.factory<_i398.Register_remote_data_source>(() =>
        _i282.Register_remote_datasource_impl(
            apiManager: gh<_i681.ApiManager>()));
    gh.factory<_i699.LoginRepositry>(() => _i109.LoginRepositryImpl(
        loginRemoteDatasource: gh<_i965.LoginRemoteDatasource>()));
    gh.factory<_i456.SearchOnlineDataSource>(
        () => _i278.SearchOnlineDataSourceImpl(gh<_i681.ApiManager>()));
    gh.factory<_i222.ChangePasswordOnlineDataSource>(
        () => _i557.ChangePasswordOnlineDataSourceImpl(gh<_i681.ApiManager>()));
    gh.factory<_i908.FavoritesOnlineDataSource>(
        () => _i148.FavoritesOnlineDataSourceImpl(gh<_i681.ApiManager>()));
    gh.factory<_i691.MovieDetailsRepositry>(() =>
        _i329.MovieDetailsRepositryImpl(
            movieDetailsDataSource: gh<_i910.MovieDetailsDataSource>()));
    gh.factory<_i356.HistoryRepo>(
        () => _i870.HistoryRepoImpl(gh<_i78.HistoryOfflineDataSource>()));
    gh.factory<_i414.FavoritesRepo>(
        () => _i509.FavoritesRepoImpl(gh<_i908.FavoritesOnlineDataSource>()));
    gh.factory<_i525.ProfileOnlineDataSource>(
        () => _i150.ProfileOnlineDataSourceImpl(gh<_i681.ApiManager>()));
    gh.factory<_i874.ChangePasswordRepo>(() => _i667.ChangePasswordRepoImpl(
        gh<_i222.ChangePasswordOnlineDataSource>()));
    gh.factory<_i768.MovieSuggetionUseCaseUseCase>(() =>
        _i768.MovieSuggetionUseCaseUseCase(
            movieDetailsRepositry: gh<_i691.MovieDetailsRepositry>()));
    gh.factory<_i729.MovieDetailsUseCase>(() => _i729.MovieDetailsUseCase(
        movieDetailsRepositry: gh<_i691.MovieDetailsRepositry>()));
    gh.factory<_i1048.RegisterRepositry>(() => _i713.Register_repositry_impl(
        register_remote_data_source: gh<_i398.Register_remote_data_source>()));
    gh.factory<_i649.ProfileRepo>(
        () => _i688.ProfileRepoImpl(gh<_i525.ProfileOnlineDataSource>()));
    gh.factory<_i147.RegisterUseCase>(() => _i147.RegisterUseCase(
        registerRepositry: gh<_i1048.RegisterRepositry>()));
    gh.factory<_i467.LoginUseCase>(
        () => _i467.LoginUseCase(loginRepositry: gh<_i699.LoginRepositry>()));
    gh.factory<_i1021.SearchRepo>(
        () => _i61.SearchRepoImpl(gh<_i456.SearchOnlineDataSource>()));
    gh.factory<_i334.MovieDetailsViewModel>(() => _i334.MovieDetailsViewModel(
        movieDetailsUseCase: gh<_i729.MovieDetailsUseCase>()));
    gh.factory<_i225.RegisterViewModel>(() =>
        _i225.RegisterViewModel(registerUseCase: gh<_i147.RegisterUseCase>()));
    gh.factory<_i889.AddToHistoryUseCase>(
        () => _i889.AddToHistoryUseCase(gh<_i356.HistoryRepo>()));
    gh.factory<_i538.GetMovieFromHistoryUseCase>(
        () => _i538.GetMovieFromHistoryUseCase(gh<_i356.HistoryRepo>()));
    gh.factory<_i659.GetSearchUseCase>(
        () => _i659.GetSearchUseCase(gh<_i1021.SearchRepo>()));
    gh.factory<_i851.AddToFavoriteUseCase>(
        () => _i851.AddToFavoriteUseCase(gh<_i414.FavoritesRepo>()));
    gh.factory<_i847.GetAllFavoritesUseCase>(
        () => _i847.GetAllFavoritesUseCase(gh<_i414.FavoritesRepo>()));
    gh.factory<_i802.GetMovieIsFavoriteUseCase>(
        () => _i802.GetMovieIsFavoriteUseCase(gh<_i414.FavoritesRepo>()));
    gh.factory<_i90.RemoveFromFavoriteUseCase>(
        () => _i90.RemoveFromFavoriteUseCase(gh<_i414.FavoritesRepo>()));
    gh.factory<_i838.ChangePasswordUseCase>(
        () => _i838.ChangePasswordUseCase(gh<_i874.ChangePasswordRepo>()));
    gh.factory<_i301.LoginViewModel>(
        () => _i301.LoginViewModel(useCase: gh<_i467.LoginUseCase>()));
    gh.factory<_i291.MovieSuggetionViewModel>(() =>
        _i291.MovieSuggetionViewModel(
            movieSuggetionUseCase: gh<_i768.MovieSuggetionUseCaseUseCase>()));
    gh.factory<_i980.DeleteProfileUseCase>(
        () => _i980.DeleteProfileUseCase(gh<_i649.ProfileRepo>()));
    gh.factory<_i305.GetProfileUseCase>(
        () => _i305.GetProfileUseCase(gh<_i649.ProfileRepo>()));
    gh.factory<_i557.UpdateProfileUseCase>(
        () => _i557.UpdateProfileUseCase(gh<_i649.ProfileRepo>()));
    gh.factory<_i854.UpdateProfileCubit>(() => _i854.UpdateProfileCubit(
          gh<_i305.GetProfileUseCase>(),
          gh<_i557.UpdateProfileUseCase>(),
          gh<_i980.DeleteProfileUseCase>(),
        ));
    gh.factory<_i1063.ChangePasswordCubit>(
        () => _i1063.ChangePasswordCubit(gh<_i838.ChangePasswordUseCase>()));
    gh.factory<_i978.ProfileCubit>(() => _i978.ProfileCubit(
          gh<_i305.GetProfileUseCase>(),
          gh<_i847.GetAllFavoritesUseCase>(),
          gh<_i538.GetMovieFromHistoryUseCase>(),
        ));
    gh.factory<_i91.SearchCubit>(
        () => _i91.SearchCubit(gh<_i659.GetSearchUseCase>()));
    return this;
  }
}
