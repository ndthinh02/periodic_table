import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_theme/app_colors.dart';
import '../app_theme/app_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.leading,
    required this.title,
    required this.subTitle,
    this.backGrColor,
    this.animation,
    this.index,
  });

  final Widget leading;
  final String title;
  final String subTitle;
  final Color? backGrColor;
  final bool? animation;
  final int? index;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      color: backGrColor,
      width: width,
      height: 72.h,
      padding: EdgeInsets.only(
        left: 22.w,
        top: 16.h,
        bottom: 16.h,
      ),
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + ((index ?? 0) * 200)),
      transform: Matrix4.translationValues((animation ?? false) ? 0 : width, 0, 0),
      child: Row(
        children: [
          leading,
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.caption.copyWith(
                  fontSize: 16.sp,
                  height: 16 / 20,
                  color: AppColors.color000000,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subTitle,
                style: AppStyles.caption.copyWith(
                  fontSize: 14.sp,
                  height: 14 / 20,
                  color: AppColors.color000000,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
