import 'package:flutter/material.dart';
import 'package:flutter_core/features/home/data/datasource/model/periodic_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_theme/app_colors.dart';
import '../../../../common/app_theme/app_styles.dart';
import 'header_cell_widget.dart';

class ElementTile extends StatelessWidget {
  final PeriodicModel? element;
  final double cellSize;
  final Function? callBack;
  final int? index;
  final Function? onLongPress;

  const ElementTile({
    super.key,
    required this.element,
    required this.cellSize,
    this.callBack,
    this.index,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    String subName(int id) {
      return {
            3: element?.atomicWeight.toString(),
            4: element?.electronicconfiguration.toString(),
            5: element?.discoveryYear.toString(),
            6: element?.cASNumber.toString(),
          }[id] ??
          '';
    }

    final BoxDecoration containerDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: colorContainer(
            value: index == 1
                ? element?.block
                : index == 2
                    ? element?.metalic
                    : element?.category));

    final TextStyle commonTextStyle = AppStyles.button2.copyWith(
      color: colorText(
          value: index == 1
              ? element?.block
              : index == 2
                  ? element?.metalic
                  : element?.category),
    );

    final TextStyle symbolTextStyle = commonTextStyle.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
    );

    final TextStyle nameTextStyle = commonTextStyle.copyWith(
      fontSize: index == 3 || index == 4 || index == 5 || index == 6 ? 8.sp : 10.sp,
      height: index == 3 || index == 4 || index == 5 || index == 6 ? 0 : 14 / 10,
    );

    return InkWell(
      onTap: () => callBack?.call(),
      onLongPress: () => onLongPress?.call(),
      child: Container(
        width: cellSize,
        height: cellSize,
        margin: cellEdgeInsets,
        padding: EdgeInsets.only(top: 4.h, left: 4.w),
        decoration: containerDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${element?.atomicNumber}',
              style: commonTextStyle,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                element?.symbol ?? 'null',
                style: symbolTextStyle,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                element?.name ?? 'null',
                textAlign: TextAlign.center,
                style: nameTextStyle,
              ),
            ),
            if (index == 3 || index == 4 || index == 5 || index == 6)
              Align(
                alignment: Alignment.center,
                child: Text(
                  subName(index ?? 0),
                  textAlign: TextAlign.center,
                  style: commonTextStyle.copyWith(fontSize: 6.sp),
                ),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

Color? colorContainer({String? value}) {
  Color? color;
  switch (value) {
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
    case "s Block ":
      color = AppColors.colorF1E8FB;
      break;
    case "d Block":
      color = AppColors.colorFBE8E7;
      break;
    case "f Block":
      color = AppColors.colorE3F2FE;
      break;
    case "p Block":
      color = AppColors.colorE4EEFD;
      break;
    case "Metal":
      color = AppColors.colorEFF18E;
      break;
    case "Metalloid":
      color = AppColors.colorB4F5C2;
      break;
    case "Nonmetal":
      color = AppColors.colorF1E8FB;
      break;
  }
  return color;
}

Color? colorText({String? value}) {
  Color? color;
  switch (value) {
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
    case "s Block ":
      color = AppColors.color5A3EE3;
      break;
    case "d Block":
      color = AppColors.colorC4292E;
      break;
    case "f Block":
      color = AppColors.color113352;
      break;
    case "p Block":
      color = AppColors.color2163E7;
      break;
    case "Metal":
      color = AppColors.color747703;
      break;
    case "Metalloid":
      color = AppColors.color106B24;
      break;
    case "Nonmetal":
      color = AppColors.color5A3EE3;
      break;
  }
  return color;
}
