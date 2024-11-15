import 'package:dio/dio.dart';
import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/error/expception.dart';
import 'package:e_commerce/featuers/products/Data/Data%20Source/products_remote_data_source.dart';
import 'package:e_commerce/featuers/products/Data/Models/products_respone/products_respone.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRemoteDataSource)
class ProductsRemoteApiDataSource implements ProductsRemoteDataSource {
  final Dio dio;

  ProductsRemoteApiDataSource(this.dio);
  @override
  Future<ProductsRespone> getProducts() async {
    try {
      final response = await dio.get(APIConstants.productsEndPoint);
      return ProductsRespone.fromJson(response.data);
    } catch (e) {
      print(e);
      throw RemoteException("failed to get products");
    }
  }
}
