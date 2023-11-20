import 'package:freezed_annotation/freezed_annotation.dart';

part 'periodic_model.freezed.dart';

part 'periodic_model.g.dart';

@freezed
class PeriodicModel with _$PeriodicModel {
  const factory PeriodicModel({
    int? xpos,
    int? ypos,
    int? wxpos,
    int? wypos,
    @JsonKey(name: "AtomicNumber") int? atomicNumber,
    @JsonKey(name: "Name") String? name,
    @JsonKey(name: "Symbol") String? symbol,
    @JsonKey(name: "Category") String? category,
    @JsonKey(name: "Block") String? block,
    @JsonKey(name: "Metalic") dynamic? metalic,
    @JsonKey(name: "Electron") dynamic? electron,
    @JsonKey(name: "Proton") dynamic? proton,
    @JsonKey(name: "Notron") dynamic? notron,
    @JsonKey(name: "DisscoveryBy") dynamic? disscoveryBy,
    @JsonKey(name: "DiscoveryYear") dynamic? discoveryYear,
    @JsonKey(name: "CASNumber") dynamic? cASNumber,
    @JsonKey(name: "AtomicWeight") dynamic? atomicWeight,
    @JsonKey(name: "StandardState") dynamic? standardState,
    @JsonKey(name: "Electronicconfiguration") String? electronicconfiguration,
    @JsonKey(name: "Period") dynamic? period,
    @JsonKey(name: "Group") dynamic? group,
    @JsonKey(name: "OxidationStates") dynamic? oxidationStates,
    @JsonKey(name: "PaulingScale") dynamic? paulingScale,
    @JsonKey(name: "Atomicradius(vanderWaals)") dynamic? atomicradiusVanderWaals,
    @JsonKey(name: "IonizationEnergy") dynamic? ionizationEnergy,
    @JsonKey(name: "ElectronAffinity") dynamic? electronAffinity,
    @JsonKey(name: "CMeltingpoint") dynamic? cMeltingpoint,
    @JsonKey(name: "KMeltingpoint") dynamic? kMeltingpoint,
    @JsonKey(name: "FMeltingpoint") dynamic? fMeltingpoint,
    @JsonKey(name: "CBoilingpoint") dynamic? cBoilingpoint,
    @JsonKey(name: "KBoilingpoint") dynamic? kBoilingpoint,
    @JsonKey(name: "FBoilingpoint") dynamic? fBoilingpoint,
  }) = _PeriodicModel;

  factory PeriodicModel.fromJson(Map<String, dynamic> json) => _$PeriodicModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    List<PeriodicModel>? data,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
