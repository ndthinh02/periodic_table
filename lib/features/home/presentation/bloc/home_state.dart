part of "home_bloc.dart";

@CopyWith()
class HomeState extends BaseBlocState {
  const HomeState({
    required super.status,
    this.listPeriodic,
  });

  final List<PeriodicModel>? listPeriodic;

  factory HomeState.init() => const HomeState(status: BaseStateStatus.init);

  @override
  List get props => [
        listPeriodic,
      ];
}
