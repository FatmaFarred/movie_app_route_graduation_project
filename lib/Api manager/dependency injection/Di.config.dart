// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_sources/remote_data_sources/Login_Remote_DataSource_impl.dart'
    as _i944;
import '../../data/data_sources/remote_data_sources/Register_remote_datasource_impl.dart'
    as _i282;
import '../../data/repositries/Login_repositry_impl.dart' as _i109;
import '../../data/repositries/Register_Repositry_impl.dart' as _i713;
import '../../domain/repositries/data_sources/remote_data_sources/Login_remote_datasource.dart'
    as _i965;
import '../../domain/repositries/data_sources/remote_data_sources/Register_remote_datasource.dart'
    as _i398;
import '../../domain/repositries/reposotries/auth_repositry.dart' as _i1048;
import '../../domain/repositries/reposotries/Login_repositry.dart' as _i699;
import '../../domain/use_cases/Login_useCase.dart' as _i467;
import '../../domain/use_cases/Register_usecase.dart' as _i147;
import '../../features/auth/login/login_cubit/login_view_model.dart' as _i301;
import '../../features/auth/Reigster/Register_cubit/register_view_model.dart'
    as _i225;
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
    gh.factory<_i398.Register_remote_data_source>(() =>
        _i282.Register_remote_datasource_impl(
            apiManager: gh<_i681.ApiManager>()));
    gh.factory<_i699.LoginRepositry>(() => _i109.LoginRepositryImpl(
        loginRemoteDatasource: gh<_i965.LoginRemoteDatasource>()));
    gh.factory<_i1048.RegisterRepositry>(() => _i713.Register_repositry_impl(
        register_remote_data_source: gh<_i398.Register_remote_data_source>()));
    gh.factory<_i147.RegisterUseCase>(() => _i147.RegisterUseCase(
        registerRepositry: gh<_i1048.RegisterRepositry>()));
    gh.factory<_i467.LoginUseCase>(
        () => _i467.LoginUseCase(loginRepositry: gh<_i699.LoginRepositry>()));
    gh.factory<_i225.RegisterViewModel>(() =>
        _i225.RegisterViewModel(registerUseCase: gh<_i147.RegisterUseCase>()));
    gh.factory<_i301.LoginViewModel>(
        () => _i301.LoginViewModel(useCase: gh<_i467.LoginUseCase>()));
    return this;
  }
}
