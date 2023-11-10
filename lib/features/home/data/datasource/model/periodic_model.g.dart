// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'periodic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PeriodicModelImpl _$$PeriodicModelImplFromJson(Map<String, dynamic> json) =>
    _$PeriodicModelImpl(
      atomicNumber: json['AtomicNumber'] as int?,
      name: json['Name'] as String?,
      symbol: json['Symbol'] as String?,
      category: json['Category'] as String?,
      block: json['Block'] as String?,
      metalic: json['Metalic'],
      electron: json['Electron'],
      proton: json['Proton'],
      notron: json['Notron'],
      disscoveryBy: json['DisscoveryBy'],
      discoveryYear: json['DiscoveryYear'],
      cASNumber: json['CASNumber'],
      atomicWeight: json['AtomicWeight'],
      standardState: json['StandardState'],
      electronicconfiguration: json['Electronicconfiguration'] as String?,
      period: json['Period'],
      group: json['Group'],
      oxidationStates: json['OxidationStates'],
      paulingScale: json['PaulingScale'],
      atomicradiusVanderWaals: json['AtomicradiusVanderWaals'],
      ionizationEnergy: json['IonizationEnergy'],
      electronAffinity: json['ElectronAffinity'],
      cMeltingpoint: json['CMeltingpoint'],
      kMeltingpoint: json['KMeltingpoint'],
      fMeltingpoint: json['FMeltingpoint'],
      cBoilingpoint: json['CBoilingpoint'],
      kBoilingpoint: json['KBoilingpoint'],
      fBoilingpoint: json['FBoilingpoint'],
    );

Map<String, dynamic> _$$PeriodicModelImplToJson(_$PeriodicModelImpl instance) =>
    <String, dynamic>{
      'AtomicNumber': instance.atomicNumber,
      'Name': instance.name,
      'Symbol': instance.symbol,
      'Category': instance.category,
      'Block': instance.block,
      'Metalic': instance.metalic,
      'Electron': instance.electron,
      'Proton': instance.proton,
      'Notron': instance.notron,
      'DisscoveryBy': instance.disscoveryBy,
      'DiscoveryYear': instance.discoveryYear,
      'CASNumber': instance.cASNumber,
      'AtomicWeight': instance.atomicWeight,
      'StandardState': instance.standardState,
      'Electronicconfiguration': instance.electronicconfiguration,
      'Period': instance.period,
      'Group': instance.group,
      'OxidationStates': instance.oxidationStates,
      'PaulingScale': instance.paulingScale,
      'AtomicradiusVanderWaals': instance.atomicradiusVanderWaals,
      'IonizationEnergy': instance.ionizationEnergy,
      'ElectronAffinity': instance.electronAffinity,
      'CMeltingpoint': instance.cMeltingpoint,
      'KMeltingpoint': instance.kMeltingpoint,
      'FMeltingpoint': instance.fMeltingpoint,
      'CBoilingpoint': instance.cBoilingpoint,
      'KBoilingpoint': instance.kBoilingpoint,
      'FBoilingpoint': instance.fBoilingpoint,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PeriodicModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
