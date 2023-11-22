import 'package:flutter/material.dart';
import 'package:flutter_core/features/home/data/datasource/model/periodic_model.dart';
import 'package:flutter_core/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_theme/app_colors.dart';
import '../../../../common/app_theme/app_styles.dart';

class ElementBottomWidget extends StatelessWidget {
  const ElementBottomWidget({
    super.key,
    required this.periodicModel,
    this.onTap,
  });

  final PeriodicModel periodicModel;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 44.w,
        right: 14.w,
        top: 26.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            periodicModel.name ?? '',
            style: AppStyles.button1.copyWith(
              fontSize: 24.sp,
              height: 14 / 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          singleItem(
            subName: periodicModel.category,
            name: 'Category',
          ),
          singleItem(
            name: 'Metalic',
            subName: periodicModel.metalic,
          ),
          singleItem(
            name: 'Atomic Weight',
            subName: '${periodicModel.atomicWeight} g/mol',
          ),
          singleItem(
            name: 'Group',
            subName: periodicModel.group,
          ),
          singleItem(
            name: 'Pauling Scale',
            subName: periodicModel.paulingScale,
          ),
          singleItem(
            name: 'Oxidation States',
            subName: periodicModel.oxidationStates,
          ),
          singleItem(
            name: 'Electronic \nConfiguration',
            subName: periodicModel.electronicconfiguration,
          ),
          InkWell(
            onTap: () => onTap?.call(),
            child: Row(
              children: [
                Text(
                  "See more",
                  style: AppStyles.subTitle1.copyWith(
                    fontSize: 16.sp,
                    height: 14 / 16,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Assets.svg.arrowChevronBack1.svg()
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  Widget singleItem({
    String? name,
    String? subName,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name ?? '',
            style: AppStyles.button1.copyWith(
              fontSize: 14.sp,
              height: 14 / 14,
              fontWeight: FontWeight.w600,
              color: AppColors.color344054,
            ),
          ),
        ),
        Text(
          subName ?? '',
          style: AppStyles.button1.copyWith(
            fontSize: 14.sp,
            height: 14 / 14,
            fontWeight: FontWeight.w600,
            color: AppColors.color667085,
          ),
        ),
        SizedBox(
          width: 10.w,
        )
      ],
    );
  }
}
