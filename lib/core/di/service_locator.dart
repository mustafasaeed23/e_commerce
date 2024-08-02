// ignore_for_file: unused_local_variable

import 'package:e_commerce/core/di/service_locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt serviceLocator = GetIt.instance;

@InjectableInit()  
void configureDependencies() => serviceLocator.init(); 
