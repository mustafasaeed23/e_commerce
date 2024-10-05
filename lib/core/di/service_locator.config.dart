// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:e_commerce/core/di/register_module.dart' as _i21;
import 'package:e_commerce/featuers/auth/Data/data_sources/local/auth_local_data_source.dart'
    as _i5;
import 'package:e_commerce/featuers/auth/Data/data_sources/local/auth_shared_pref_auth_local_data_source.dart'
    as _i6;
import 'package:e_commerce/featuers/auth/Data/data_sources/remote/auth_api_data_source.dart'
    as _i12;
import 'package:e_commerce/featuers/auth/Data/data_sources/remote/auth_remote_data_source.dart'
    as _i11;
import 'package:e_commerce/featuers/auth/Data/repository/auth_repository_impl.dart'
    as _i16;
import 'package:e_commerce/featuers/auth/domain/repository/auth_repository.dart'
    as _i15;
import 'package:e_commerce/featuers/auth/domain/use_cases/login.dart' as _i17;
import 'package:e_commerce/featuers/auth/domain/use_cases/register.dart'
    as _i18;
import 'package:e_commerce/featuers/auth/presentation/cubit/auth_cubit.dart'
    as _i19;
import 'package:e_commerce/featuers/home/Data/data_sources/remote/home_API_remote_data_source.dart'
    as _i8;
import 'package:e_commerce/featuers/home/Data/data_sources/remote/home_remote_data_source.dart'
    as _i7;
import 'package:e_commerce/featuers/home/Data/repository/home_repository_impl.dart'
    as _i10;
import 'package:e_commerce/featuers/home/Domain/contract_repository/home_contract_repository.dart'
    as _i9;
import 'package:e_commerce/featuers/home/Domain/use_cases/get_brands_use_case.dart'
    as _i13;
import 'package:e_commerce/featuers/home/Domain/use_cases/get_categoreis_use_case.dart'
    as _i14;
import 'package:e_commerce/featuers/home/presentation/cubit/home_cubit.dart'
    as _i20;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => registerModule.sharedPref,
      preResolve: true,
    );
    gh.lazySingleton<_i4.Dio>(() => registerModule.dio);
    gh.singleton<_i5.AuthLocalDataSource>(
        () => _i6.AuthSharedPrefLocalDataSource(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i7.HomeRemoteDataSource>(
        () => _i8.HomeApiRemoteDataSource(gh<_i4.Dio>()));
    gh.lazySingleton<_i9.HomeContractRepository>(
        () => _i10.HomeRepositoryImpl(gh<_i7.HomeRemoteDataSource>()));
    gh.singleton<_i11.AuthRemoteDataSource>(
        () => _i12.AuthApiDataSource(gh<_i4.Dio>()));
    gh.lazySingleton<_i13.GetBrandsUseCase>(
        () => _i13.GetBrandsUseCase(gh<_i9.HomeContractRepository>()));
    gh.lazySingleton<_i14.GetCategoreisUseCase>(
        () => _i14.GetCategoreisUseCase(gh<_i9.HomeContractRepository>()));
    gh.singleton<_i15.AuthRepository>(() => _i16.AuthRepositoryImpl(
          gh<_i11.AuthRemoteDataSource>(),
          gh<_i5.AuthLocalDataSource>(),
        ));
    gh.singleton<_i17.Login>(() => _i17.Login(gh<_i15.AuthRepository>()));
    gh.singleton<_i18.Register>(() => _i18.Register(gh<_i15.AuthRepository>()));
    gh.singleton<_i19.AuthCubit>(() => _i19.AuthCubit(
          gh<_i17.Login>(),
          gh<_i18.Register>(),
        ));
    gh.factory<_i20.HomeCubit>(() => _i20.HomeCubit(
          gh<_i14.GetCategoreisUseCase>(),
          gh<_i13.GetBrandsUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i21.RegisterModule {}
