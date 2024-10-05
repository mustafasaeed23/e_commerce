import 'package:dio/dio.dart';
import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/error/expception.dart';
import 'package:e_commerce/featuers/home/Data/data_sources/remote/home_remote_data_source.dart';
import 'package:e_commerce/featuers/home/Data/models/brands_response.dart';
import 'package:e_commerce/featuers/home/Data/models/categoreis_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeApiRemoteDataSource implements HomeRemoteDataSource {
  // final _dio = Dio(
  //   BaseOptions(
  //     baseUrl: APIConstants.baseUrl,
  //     receiveDataWhenStatusError: true,
  //   ),
  // );
  final Dio _dio;
  const HomeApiRemoteDataSource(this._dio);

  @override
  Future<BrandsResponse> getBrands() async {
    try {
      final response = await _dio.get(APIConstants.brandsEndPoint);
      final brandsResponse = BrandsResponse.fromJson(response.data);
      return brandsResponse;
    } catch (_) {
      throw RemoteException("Filled to get Brands");
    }
  }

  @override
  Future<CategoriesResponse> getCategories() async {
    try {
      final response = await _dio.get(APIConstants.categoriesEndPoint);
      final categoriesResponse = CategoriesResponse.fromJson(response.data);
      return categoriesResponse;
    } catch (_) {
      throw RemoteException("Filled to get Categories");
    }
  }
}
