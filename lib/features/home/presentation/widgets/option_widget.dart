import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_theme/app_colors.dart';
import '../../../../common/app_theme/app_styles.dart';
import '../../../../common/enum/menu_drawer_enum.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    this.option,
  });

  final MenuDrawerEnum? option;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: option?.icon ?? const SizedBox.shrink(),
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            option?.name ?? ' ',
            style: AppStyles.button1.copyWith(
              fontSize: 14.sp,
              height: 24 / 14,
              color: AppColors.color979797,
            ),
          )
        ],
      ),
    );
  }
}
