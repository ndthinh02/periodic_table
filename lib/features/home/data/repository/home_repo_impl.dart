import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core/base/network/errors/error.dart';
import 'package:flutter_core/base/network/errors/extension.dart';
import 'package:flutter_core/features/home/data/datasource/model/periodic_model.dart';
import 'package:flutter_core/features/home/data/repository/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<BaseError, List<PeriodicModel>>> getListPeriodic() async {
    try {
      final res = await rootBundle.loadString("assets/json/data.json");
      final data = Data.fromJson(jsonDecode(res));
      return right(data.data!);
    } on DioError catch (e) {
      return left(e.baseError);
    }
  }
}
