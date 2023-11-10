import 'package:flutter/widgets.dart';

import '../../gen/assets.gen.dart';

enum MenuDrawerEnum {
  category(0),
  block(1),
  metallic(2),
  atomicWeight(3),
  electionConfiguration(4),
  discoveryYear(5),
  casNumber(6);

  final int id;

  const MenuDrawerEnum(this.id);

  factory MenuDrawerEnum.fromId(id) {
    switch (id) {
      case 0:
        return MenuDrawerEnum.category;
      case 1:
        return MenuDrawerEnum.block;
      case 2:
        return MenuDrawerEnum.metallic;
      case 3:
        return MenuDrawerEnum.atomicWeight;
      case 4:
        return MenuDrawerEnum.electionConfiguration;
      case 5:
        return MenuDrawerEnum.discoveryYear;
      case 6:
        return MenuDrawerEnum.casNumber;
      default:
        return MenuDrawerEnum.casNumber;
    }
  }
}

extension SettingExt on MenuDrawerEnum {
  int get id => index + 1;

  String get name {
    switch (this) {
      case MenuDrawerEnum.category:
        return 'Category';
      case MenuDrawerEnum.block:
        return 'Block';
      case MenuDrawerEnum.metallic:
        return 'Metallic';
      case MenuDrawerEnum.atomicWeight:
        return 'Atomic Weight';
      case MenuDrawerEnum.electionConfiguration:
        return 'Election \n Configuration';
      case MenuDrawerEnum.discoveryYear:
        return 'Discovery Year';
      case MenuDrawerEnum.casNumber:
        return 'CAS Number';
      default:
        return '';
    }
  }

  Widget get icon {
    switch (this) {
      case MenuDrawerEnum.category:
        return Assets.svg.gridFeedCards.svg();
      case MenuDrawerEnum.block:
        return Assets.svg.mass.svg();
      case MenuDrawerEnum.metallic:
        return Assets.svg.metallic.svg();
      case MenuDrawerEnum.atomicWeight:
        return Assets.svg.pressureLight.svg();
      case MenuDrawerEnum.electionConfiguration:
        return Assets.svg.electron.svg();
      case MenuDrawerEnum.discoveryYear:
        return Assets.svg.vector.svg();
      case MenuDrawerEnum.casNumber:
        return Assets.svg.toxic.svg();
      default:
        return const SizedBox.shrink();
    }
  }
}
