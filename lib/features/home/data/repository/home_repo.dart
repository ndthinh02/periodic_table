import 'package:dartz/dartz.dart';
import 'package:flutter_core/base/network/errors/error.dart';
import 'package:flutter_core/features/home/data/datasource/model/periodic_model.dart';

abstract class HomeRepo{
  Future<Either<BaseError, List<PeriodicModel>>> getListPeriodic();
}