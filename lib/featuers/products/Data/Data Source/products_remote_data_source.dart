import 'package:e_commerce/featuers/products/Data/Models/products_respone/products_respone.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsRespone> getProducts();
}
