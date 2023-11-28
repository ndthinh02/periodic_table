import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/base/bloc/index.dart';
import 'package:flutter_core/common/index.dart';
import 'package:flutter_core/features/home/data/repository/home_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/datasource/model/periodic_model.dart';

part 'home_bloc.freezed.dart';

part 'home_bloc.g.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends BaseBloc<HomeEvent, HomeState> with BaseCommonMethodMixin {
  HomeBloc(this._giftRepo) : super(HomeState.init()) {
    on<HomeEvent>((HomeEvent event, Emitter<HomeState> emit) async {
      await event.when(
        init: () => _onInit(emit),
        search: (String? value) {
          _onSearch(value, emit);
        },
        checkIsSearch: () => _onCheckIsSearch(emit),
      );
    });
  }

  final HomeRepo _giftRepo;
  List<PeriodicModel> _list = [];

  _onInit(Emitter emit) async {
    emit(state.copyWith(
      status: BaseStateStatus.loading,
    ));
    final res = await _giftRepo.getListPeriodic();
    res.fold((l) => null, (r) {
      _list = r;
      emit(
        state.copyWith(
          listPeriodic: _list,
          status: BaseStateStatus.success,
        ),
      );
    });
  }

  _onSearch(String? value, Emitter emit) {
    List<PeriodicModel> listSearch = [];
    if (value?.isEmpty == true) {
      listSearch = _list;
    } else {
      listSearch = _list.where((element) => (element.name ?? '').toLowerCase().contains(value ?? ''.toLowerCase())).toList();
    }
    emit(
      state.copyWith(
        listSearchPeriodic: listSearch,
        isSearch: false,
      ),
    );
  }

  _onCheckIsSearch(Emitter emit) {
    emit(state.copyWith(isSearch: true));
  }
}
