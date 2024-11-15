// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:e_commerce/core/di/register_module.dart' as _i257;
import 'package:e_commerce/featuers/auth/Data/data_sources/local/auth_local_data_source.dart'
    as _i754;
import 'package:e_commerce/featuers/auth/Data/data_sources/local/auth_shared_pref_auth_local_data_source.dart'
    as _i572;
import 'package:e_commerce/featuers/auth/Data/data_sources/remote/auth_api_data_source.dart'
    as _i1040;
import 'package:e_commerce/featuers/auth/Data/data_sources/remote/auth_remote_data_source.dart'
    as _i596;
import 'package:e_commerce/featuers/auth/Data/repository/auth_repository_impl.dart'
    as _i975;
import 'package:e_commerce/featuers/auth/domain/repository/auth_repository.dart'
    as _i527;
import 'package:e_commerce/featuers/auth/domain/use_cases/login.dart' as _i566;
import 'package:e_commerce/featuers/auth/domain/use_cases/register.dart'
    as _i1003;
import 'package:e_commerce/featuers/auth/presentation/cubit/auth_cubit.dart'
    as _i230;
import 'package:e_commerce/featuers/cart/Data/Data%20Source/remote/cart_api_remote_data_source.dart'
    as _i555;
import 'package:e_commerce/featuers/cart/Data/Data%20Source/remote/cart_remote_data_source.dart'
    as _i811;
import 'package:e_commerce/featuers/cart/Data/Imply%20Repo/cart_imply_repo.dart'
    as _i181;
import 'package:e_commerce/featuers/cart/Domain/Contract%20Repo/cart_contract_repo.dart'
    as _i698;
import 'package:e_commerce/featuers/cart/Domain/Use%20Cases/add_to_cart_use_case.dart'
    as _i497;
import 'package:e_commerce/featuers/cart/Domain/Use%20Cases/get_cart_use_case.dart'
    as _i560;
import 'package:e_commerce/featuers/cart/Presentation/cubit/cart_cubit.dart'
    as _i257;
import 'package:e_commerce/featuers/home/Data/data_sources/remote/home_API_remote_data_source.dart'
    as _i612;
import 'package:e_commerce/featuers/home/Data/data_sources/remote/home_remote_data_source.dart'
    as _i62;
import 'package:e_commerce/featuers/home/Data/repository/home_repository_impl.dart'
    as _i630;
import 'package:e_commerce/featuers/home/Domain/contract_repository/home_contract_repository.dart'
    as _i679;
import 'package:e_commerce/featuers/home/Domain/use_cases/get_brands_use_case.dart'
    as _i174;
import 'package:e_commerce/featuers/home/Domain/use_cases/get_categoreis_use_case.dart'
    as _i128;
import 'package:e_commerce/featuers/home/presentation/cubit/home_cubit.dart'
    as _i584;
import 'package:e_commerce/featuers/products/Data/Data%20Source/products_remote_API_data_source.dart'
    as _i459;
import 'package:e_commerce/featuers/products/Data/Data%20Source/products_remote_data_source.dart'
    as _i801;
import 'package:e_commerce/featuers/products/Data/Repository/products_repo_impl.dart'
    as _i696;
import 'package:e_commerce/featuers/products/Domain/Contract%20Repository/products_contarct_repo.dart'
    as _i1062;
import 'package:e_commerce/featuers/products/Domain/Use%20Cases/get_products_use_case.dart'
    as _i866;
import 'package:e_commerce/featuers/products/presentation/cubit/products_cubit.dart'
    as _i557;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPref,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i801.ProductsRemoteDataSource>(
        () => _i459.ProductsRemoteApiDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i62.HomeRemoteDataSource>(
        () => _i612.HomeApiRemoteDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i679.HomeContractRepository>(
        () => _i630.HomeRepositoryImpl(gh<_i62.HomeRemoteDataSource>()));
    gh.lazySingleton<_i811.CartRemoteDataSource>(
        () => _i555.CartApiRemoteDataSource(gh<_i361.Dio>()));
    gh.singleton<_i596.AuthRemoteDataSource>(
        () => _i1040.AuthApiDataSource(gh<_i361.Dio>()));
    gh.singleton<_i754.AuthLocalDataSource>(() =>
        _i572.AuthSharedPrefLocalDataSource(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i174.GetBrandsUseCase>(
        () => _i174.GetBrandsUseCase(gh<_i679.HomeContractRepository>()));
    gh.lazySingleton<_i128.GetCategoreisUseCase>(
        () => _i128.GetCategoreisUseCase(gh<_i679.HomeContractRepository>()));
    gh.lazySingleton<_i1062.ProductsContarctRepo>(
        () => _i696.ProductsRepoImpl(gh<_i801.ProductsRemoteDataSource>()));
    gh.singleton<_i527.AuthRepository>(() => _i975.AuthRepositoryImpl(
          gh<_i596.AuthRemoteDataSource>(),
          gh<_i754.AuthLocalDataSource>(),
        ));
    gh.singleton<_i566.Login>(() => _i566.Login(gh<_i527.AuthRepository>()));
    gh.singleton<_i1003.Register>(
        () => _i1003.Register(gh<_i527.AuthRepository>()));
    gh.lazySingleton<_i698.CartContractRepo>(
        () => _i181.CartImplyRepo(gh<_i811.CartRemoteDataSource>()));
    gh.singleton<_i230.AuthCubit>(() => _i230.AuthCubit(
          gh<_i566.Login>(),
          gh<_i1003.Register>(),
        ));
    gh.lazySingleton<_i866.GetProductsUseCase>(
        () => _i866.GetProductsUseCase(gh<_i1062.ProductsContarctRepo>()));
    gh.lazySingleton<_i497.AddToCartUseCase>(
        () => _i497.AddToCartUseCase(gh<_i698.CartContractRepo>()));
    gh.factory<_i557.ProductsCubit>(
        () => _i557.ProductsCubit(gh<_i866.GetProductsUseCase>()));
    gh.factory<_i584.HomeCubit>(() => _i584.HomeCubit(
          gh<_i128.GetCategoreisUseCase>(),
          gh<_i174.GetBrandsUseCase>(),
        ));
    gh.lazySingleton<_i560.GetCartUseCase>(
        () => _i560.GetCartUseCase(gh<_i698.CartContractRepo>()));
    gh.factory<_i257.CartCubit>(() => _i257.CartCubit(
          gh<_i560.GetCartUseCase>(),
          gh<_i497.AddToCartUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i257.RegisterModule {}
