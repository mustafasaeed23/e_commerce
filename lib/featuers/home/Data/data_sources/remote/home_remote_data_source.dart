import 'package:e_commerce/featuers/home/Data/models/brands_response.dart';
import 'package:e_commerce/featuers/home/Data/models/categoreis_response.dart';

abstract class HomeRemoteDataSource {

 Future<CategoriesResponse> getCategories();


Future<BrandsResponse> getBrands();

}
