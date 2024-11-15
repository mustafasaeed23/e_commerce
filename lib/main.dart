import 'package:e_commerce/core/app_bloc_observer.dart';
import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/ecommerce_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const ECommerceApp());
}
