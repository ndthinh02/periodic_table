part of "home_bloc.dart";

@CopyWith()
class HomeState extends BaseBlocState {
  const HomeState({
    required super.status,
    this.listPeriodic,
    this.listSearchPeriodic,
    this.isSearch,
  });

  final List<PeriodicModel>? listPeriodic;
  final List<PeriodicModel>? listSearchPeriodic;
  final bool? isSearch;

  factory HomeState.init() => const HomeState(status: BaseStateStatus.init);

  @override
  List get props => [
        listPeriodic,
        listSearchPeriodic,
        isSearch,
      ];
}
