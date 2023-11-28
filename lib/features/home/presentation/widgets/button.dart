import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_theme/app_colors.dart';
import '../../../../common/app_theme/app_styles.dart';
import '../../../../gen/assets.gen.dart';

class ButtonLeftWidget extends StatelessWidget {
  const ButtonLeftWidget({
    super.key,
    this.btnLeft,
    this.name,
    this.index,
  });

  final Function? btnLeft;
  final String? name;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        btnLeft?.call();
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 20.h,
        ),
        width: 148.w,
        height: 34.h,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            8.r,
          ),
          border: Border.all(
            width: 0.5.w,
            color: AppColors.color344054,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Assets.svg.arrowLeft.svg(),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: SizedBox(
                width: 100.w,
                child: Text(
                  '$index. $name',
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.subTitle1.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    height: 20 / 12,
                    color: AppColors.color344054,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonRightWidget extends StatelessWidget {
  const ButtonRightWidget({
    super.key,
    this.btnRight,
    this.name,
    this.index,
    this.last,
  });

  final Function? btnRight;
  final String? name;
  final int? index;
  final int? last;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        btnRight?.call();
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.h, right: 24.w),
        width: 148.w,
        height: 34.h,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            8.r,
          ),
          border: Border.all(
            width: 0.5.w,
            color: AppColors.color344054,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '$index. $name',
                style: AppStyles.subTitle1.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  height: 20 / 12,
                  color: AppColors.color344054,
                ),
              ),
            ),
            Assets.svg.arrowRight.svg(),
          ],
        ),
      ),
    );
  }
}
