// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:boilerplate/data/remote/user/user_remote_source.dart' as _i828;
import 'package:boilerplate/domain/repository/user/user_repository.dart'
    as _i713;
import 'package:boilerplate/domain/usecase/user/user_usecase.dart' as _i787;
import 'package:boilerplate/presentation/user/bloc/user_bloc.dart' as _i89;
import 'package:boilerplate/shared/core/alice/appalice.dart' as _i188;
import 'package:boilerplate/shared/core/core_module.dart' as _i993;
import 'package:boilerplate/shared/core/network/network_util.dart' as _i949;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
    final coreModule = _$CoreModule();
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => coreModule.navigatorKey);
    gh.singleton<_i188.AppAlice>(
        () => _i188.AppAlice(gh<_i409.GlobalKey<_i409.NavigatorState>>()));
    gh.lazySingleton<_i949.DioProvider>(
        () => _i949.DioProvider(gh<_i188.AppAlice>()));
    gh.lazySingleton<_i949.ApiClient>(
        () => _i949.ApiClient(gh<_i949.DioProvider>()));
    gh.factory<_i828.UserRemoteSource>(
        () => _i828.UserRemoteSource(gh<_i949.ApiClient>()));
    gh.lazySingleton<_i713.UserRepository>(
        () => _i713.UserRepositoryImpl(gh<_i828.UserRemoteSource>()));
    gh.factory<_i787.UserUsecase>(
        () => _i787.UserUsecase(gh<_i713.UserRepository>()));
    gh.factory<_i89.UserBloc>(() => _i89.UserBloc(gh<_i787.UserUsecase>()));
    return this;
  }
}

class _$CoreModule extends _i993.CoreModule {}
