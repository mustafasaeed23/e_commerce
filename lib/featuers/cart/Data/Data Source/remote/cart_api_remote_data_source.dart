import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/error/expception.dart';
import 'package:e_commerce/featuers/cart/Data/Data%20Source/remote/cart_remote_data_source.dart';
import 'package:e_commerce/featuers/cart/Data/Models/get_cart_response/cart_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartApiRemoteDataSource implements CartRemoteDataSource {
  final Dio _dio;
  CartApiRemoteDataSource(this._dio);

  /// ADD TO CART
  @override
  Future addToCart(String productId) async {
    try {
      await _dio.post(
        APIConstants.cartEndPoint,
        data: {
          "productId": productId,
        },
      );
    } catch (_) {
      throw RemoteException("Failed to add product to cart");
    }
  }

  /// GET CART
  @override
  Future<CartResponse> getCart() async {
    try {
      final response = await _dio.get(
        APIConstants.cartEndPoint,
      );
      return CartResponse.fromJson(response.data);
    } catch (exception) {
      if (exception is DioException &&
          exception.response?.statusCode == HttpStatus.notFound &&
          exception.response?.statusCode == HttpStatus.noContent &&
          exception.response?.statusCode == HttpStatus.unauthorized) {
        throw RemoteException("Cart is empty");
      }
      throw RemoteException("Failed to get Cart");
    }
  }

  /// UPDATE CART
  @override
  Future<CartResponse> updateToCart(String productId, int quantity) async {
    throw UnimplementedError();
  }

  /// DELETE FROM CART
  @override
  Future<CartResponse> deleteFromCart(String productId) async {
    throw UnimplementedError();
  }
}
