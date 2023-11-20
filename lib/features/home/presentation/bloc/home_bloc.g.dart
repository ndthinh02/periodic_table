// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeStateCWProxy {
  HomeState listPeriodic(List<PeriodicModel>? listPeriodic);

  HomeState listSearchPeriodic(List<PeriodicModel>? listSearchPeriodic);

  HomeState status(BaseStateStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeState call({
    List<PeriodicModel>? listPeriodic,
    List<PeriodicModel>? listSearchPeriodic,
    BaseStateStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomeState.copyWith.fieldName(...)`
class _$HomeStateCWProxyImpl implements _$HomeStateCWProxy {
  final HomeState _value;

  const _$HomeStateCWProxyImpl(this._value);

  @override
  HomeState listPeriodic(List<PeriodicModel>? listPeriodic) =>
      this(listPeriodic: listPeriodic);

  @override
  HomeState listSearchPeriodic(List<PeriodicModel>? listSearchPeriodic) =>
      this(listSearchPeriodic: listSearchPeriodic);

  @override
  HomeState status(BaseStateStatus status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeState call({
    Object? listPeriodic = const $CopyWithPlaceholder(),
    Object? listSearchPeriodic = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return HomeState(
      listPeriodic: listPeriodic == const $CopyWithPlaceholder()
          ? _value.listPeriodic
          // ignore: cast_nullable_to_non_nullable
          : listPeriodic as List<PeriodicModel>?,
      listSearchPeriodic: listSearchPeriodic == const $CopyWithPlaceholder()
          ? _value.listSearchPeriodic
          // ignore: cast_nullable_to_non_nullable
          : listSearchPeriodic as List<PeriodicModel>?,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BaseStateStatus,
    );
  }
}

extension $HomeStateCopyWith on HomeState {
  /// Returns a callable class that can be used as follows: `instanceOfHomeState.copyWith(...)` or like so:`instanceOfHomeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeStateCWProxy get copyWith => _$HomeStateCWProxyImpl(this);
}
