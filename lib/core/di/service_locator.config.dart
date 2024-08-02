// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:e_commerce/featuers/auth/Data/data_sources/local/auth_local_data_source.dart'
    as _i3;
import 'package:e_commerce/featuers/auth/Data/data_sources/local/auth_shared_pref_auth_local_data_source.dart'
    as _i4;
import 'package:e_commerce/featuers/auth/Data/data_sources/remote/auth_api_data_source.dart'
    as _i6;
import 'package:e_commerce/featuers/auth/Data/data_sources/remote/auth_remote_data_source.dart'
    as _i5;
import 'package:e_commerce/featuers/auth/Data/repository/auth_repository_impl.dart'
    as _i8;
import 'package:e_commerce/featuers/auth/domain/repository/auth_repository.dart'
    as _i7;
import 'package:e_commerce/featuers/auth/domain/use_cases/login.dart' as _i9;
import 'package:e_commerce/featuers/auth/domain/use_cases/register.dart'
    as _i10;
import 'package:e_commerce/featuers/auth/presentation/cubit/auth_cubit.dart'
    as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AuthLocalDataSource>(
        () => _i4.AuthSharedPrefLocalDataSource());
    gh.singleton<_i5.AuthRemoteDataSource>(() => _i6.AuthApiDataSource());
    gh.singleton<_i7.AuthRepository>(() => _i8.AuthRepositoryImpl(
          gh<_i5.AuthRemoteDataSource>(),
          gh<_i3.AuthLocalDataSource>(),
        ));
    gh.singleton<_i9.Login>(() => _i9.Login(gh<_i7.AuthRepository>()));
    gh.singleton<_i10.Register>(() => _i10.Register(gh<_i7.AuthRepository>()));
    gh.singleton<_i11.AuthCubit>(() => _i11.AuthCubit(
          gh<_i9.Login>(),
          gh<_i10.Register>(),
        ));
    return this;
  }
}
