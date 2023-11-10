import 'package:dio/dio.dart';
import 'package:flutter_core/base/network/dio/dio_builder.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  Dio get dio => DioBuilder().getDio();
}
