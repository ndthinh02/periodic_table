import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_theme/app_colors.dart';
import '../../../../common/app_theme/app_styles.dart';
import '../../../../common/widgets/custom_list_tile.dart';
import '../../data/datasource/model/periodic_model.dart';

class ItemSearch extends StatelessWidget {
  const ItemSearch({
    super.key,
    this.element,
    this.callBack,
    this.animation,
    this.index,
  });

  final PeriodicModel? element;
  final Function? callBack;
  final bool? animation;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callBack?.call(),
      child: CustomListTile(
        index: index,
        animation: animation,
        backGrColor: AppColors.colorF9FAFE,
        leading: CircleAvatar(
          backgroundColor: colorContainer(element ?? const PeriodicModel()),
          child: Text(
            element?.symbol ?? 'null',
            style: AppStyles.caption.copyWith(
              color: colorText(
                element ?? const PeriodicModel(),
              ),
              fontSize: 16.sp,
              height: 20 / 14,
            ),
          ),
        ),
        title: element?.name ?? '',
        subTitle: '${element?.atomicWeight} (g/mol)',
      ),
    );
  }
}

Color? colorText(PeriodicModel element) {
  Color? color;
  switch (element?.category) {
    case "Alkali Metals ":
      color = AppColors.colorC4292E;
      break;
    case "Alkali Earth Metals":
      color = AppColors.colorE95C30;
      break;
    case "Transition Metals ":
      color = AppColors.color7747703;
      break;
    case "Post Transition Metals ":
      color = AppColors.color106B24;
      break;
    case "Lanthanides":
      color = AppColors.colorFB2472;
      break;
    case "Actinides":
      color = AppColors.color820D38;
      break;
    case "Metalloids":
      color = AppColors.color8C591D;
      break;
    case "Other Nonmetals":
      color = AppColors.color667085;
      break;
    case "Halogens":
      color = AppColors.color246581;
      break;
    case "Noble Gases ":
      color = AppColors.color5A3EE3;
      break;
    case "Unknown Properties":
      color = AppColors.color3E374D;
      break;
  }
  return color;
}

Color? colorContainer(PeriodicModel element) {
  Color? color;
  switch (element?.category) {
    case "Alkali Metals ":
      color = AppColors.colorFBE8E7;
      break;
    case "Alkali Earth Metals":
      color = AppColors.colorFEC5B2;
      break;
    case "Transition Metals ":
      color = AppColors.colorEFF18E;
      break;
    case "Post Transition Metals ":
      color = AppColors.colorB4F5C2;
      break;
    case "Lanthanides":
      color = AppColors.colorFEBCD4;
      break;
    case "Actinides":
      color = AppColors.colorFB84AF;
      break;
    case "Metalloids":
      color = AppColors.colorFDF7E2;
      break;
    case "Other Nonmetals":
      color = AppColors.colorBBC1E2;
      break;
    case "Halogens":
      color = AppColors.color90DEFF;
      break;
    case "Noble Gases ":
      color = AppColors.colorF1E8FB;
      break;
    case "Unknown Properties":
      color = AppColors.colorE7E7EA;
      break;
  }
  return color;
}
