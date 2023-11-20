import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_theme/app_colors.dart';
import '../../../../common/app_theme/app_styles.dart';
import '../../data/datasource/model/periodic_model.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({
    super.key,
    required this.periodicModel,
  });

  final PeriodicModel periodicModel;

  @override
  Widget build(BuildContext context) {
    String formatMeltingOrBoilingPoint(String value) {
      return value == null || value == "N/A" ? value : double.parse(value).toStringAsFixed(3);
    }

    final cMeltingpoint = formatMeltingOrBoilingPoint(periodicModel.cMeltingpoint.toString());
    final kMeltingpoint = formatMeltingOrBoilingPoint(periodicModel.kMeltingpoint.toString());
    final fMeltingpoint = formatMeltingOrBoilingPoint(periodicModel.fMeltingpoint.toString());
    final cBoilingpoint = formatMeltingOrBoilingPoint(periodicModel.cBoilingpoint.toString());
    final kBoilingpoint = formatMeltingOrBoilingPoint(periodicModel.kBoilingpoint.toString());
    final fBoilingpoint = formatMeltingOrBoilingPoint(periodicModel.fBoilingpoint.toString());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _reusableRow(name: "English name", subName: periodicModel.name.toString()),
        _reusableRow(name: "Discovery By", subName: periodicModel.disscoveryBy.toString()),
        _reusableRow(name: "Discovery Year", subName: '${periodicModel.discoveryYear}'),
        _reusableRow(name: "CAS Number", subName: periodicModel.cASNumber.toString()),
        SizedBox(
          height: 24.h,
        ),
        Text(
          "Atomic \nProperties",
          style: AppStyles.subTitle1.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            height: 20 / 20,
            color: AppColors.color000000,
          ),
        ),
        _reusableRow(
          name: "Standard State",
          subName: periodicModel.standardState.toString(),
        ),
        _reusableRow(
          name: "Atomic Weight",
          subName: '${periodicModel.atomicWeight.toString()} (g/mol)',
        ),
        _reusableRow(
          name: "Electronic \nConfiguration",
          subName: '${periodicModel.electron}',
        ),
        _reusableRow(
          name: "Period",
          subName: periodicModel.period.toString(),
        ),
        _reusableRow(
          name: "Oxidation States",
          subName: periodicModel.oxidationStates.toString(),
        ),
        _reusableRow(
          name: "Group",
          subName: periodicModel.group.toString(),
        ),
        _reusableRow(
          name: "Block",
          subName: periodicModel.block.toString(),
        ),
        _reusableRow(
          name: "Pauling Scale",
          subName: periodicModel.paulingScale.toString(),
        ),
        _reusableRow(
          name: "Atomic Radius \n (van der Waals)",
          subName: '${periodicModel.atomicradiusVanderWaals} pm',
        ),
        _reusableRow(
          name: "Ionization Energy",
          subName: periodicModel.ionizationEnergy.toString(),
        ),
        _reusableRow(
          name: "Electron Affinity",
          subName: periodicModel.electronAffinity.toString(),
        ),
        _reusableRow(
          name: "Melting point",
          subName: '$cMeltingpoint°C = $kMeltingpoint°K = \n $fMeltingpoint°F',
        ),
        _reusableRow(
          name: "Boiling point",
          subName: '$cBoilingpoint°C = $kBoilingpoint°K = \n $fBoilingpoint°F',
        ),
      ],
    );
  }

  Container _reusableRow({
    String? name,
    String? subName,
  }) =>
      Container(
        margin: EdgeInsets.only(
          top: 20.h,
          right: 10.w,
          bottom: 20.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                name ?? '',
                style: AppStyles.subTitle1.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 20 / 20,
                  color: AppColors.color344054,
                ),
              ),
            ),
            Expanded(
              child: Text(
                subName ?? '',
                style: AppStyles.subTitle1.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  height: 20 / 20,
                  color: AppColors.color344054,
                ),
              ),
            ),
          ],
        ),
      );
}
