// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../common/local_data/shared_pref.dart' as _i8;
import '../common/logger/logger.dart' as _i9;
import '../common/notification/local_notification_helper.dart' as _i7;
import '../common/notification/push_notification_helper.dart' as _i10;
import '../common/utils/snack_bar/snack_bar_helper.dart' as _i11;
import '../features/home/data/repository/home_repo.dart' as _i5;
import '../features/home/data/repository/home_repo_impl.dart' as _i6;
import '../features/home/presentation/bloc/home_bloc.dart' as _i12;
import '../routes/app_pages.dart' as _i3;
import 'app_module.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.singleton<_i3.AppPages>(_i3.AppPages());
  gh.singleton<_i4.Dio>(appModule.dio);
  gh.factory<_i5.HomeRepo>(() => _i6.HomeRepoImpl());
  gh.singleton<_i7.LocalNotificationHelper>(_i7.LocalNotificationHelper());
  gh.factory<_i8.LocalStorage>(() => _i8.LocalStorageImpl());
  gh.singleton<_i9.LogUtils>(_i9.LogUtils());
  gh.singleton<_i10.PushNotificationHelper>(_i10.PushNotificationHelper());
  gh.singleton<_i11.SnackBarHelper>(_i11.SnackBarHelper());
  gh.factory<_i12.HomeBloc>(() => _i12.HomeBloc(get<_i5.HomeRepo>()));
  return get;
}

class _$AppModule extends _i13.AppModule {}
