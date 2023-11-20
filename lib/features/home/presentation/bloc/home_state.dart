part of "home_bloc.dart";

@CopyWith()
class HomeState extends BaseBlocState {
  const HomeState({
    required super.status,
    this.listPeriodic,
    this.listSearchPeriodic,
  });

  final List<PeriodicModel>? listPeriodic;
  final List<PeriodicModel>? listSearchPeriodic;

  factory HomeState.init() => const HomeState(status: BaseStateStatus.init);

  @override
  List get props => [
        listPeriodic,
        listSearchPeriodic,
      ];
}
