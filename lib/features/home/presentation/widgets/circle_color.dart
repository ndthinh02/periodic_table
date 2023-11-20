import 'package:flutter/material.dart';
import 'package:flutter_core/common/app_theme/app_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_theme/app_colors.dart';
import 'commom.dart';

class CircleColor extends StatelessWidget {
  const CircleColor({
    super.key,
    required this.content,
    this.color,
    this.width,
    this.height,
  });

  final String content;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: Row(
        children: [
          SizedBox(
            width: width ?? 24,
            height: height ?? 24,
            child: CircleAvatar(
              backgroundColor: color,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            content,
            style: AppStyles.display.copyWith(
              fontSize: 14.sp,
              color: AppColors.color000000,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    this.index,
  });

  final int? index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      width: 600,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        clipBehavior: Clip.none,
        shrinkWrap: true,
        itemCount: index == 1
            ? listBlock.length
            : index == 2
                ? listMetalic.length
                : listCate.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: index == 1 || index == 2 ? 16 : 7,
          crossAxisCount: index == 1 || index == 2 ? 1 : 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 0.1,
        ),
        itemBuilder: (context, i) => index == 1
            ? CircleColor(
                content: listBlock[i].content,
                color: listBlock[i].color,
              )
            : index == 2
                ? CircleColor(
                    content: listMetalic[i].content,
                    color: listMetalic[i].color,
                  )
                : CircleColor(
                    content: listCate[i].content,
                    color: listCate[i].color,
                  ),
      ),
    );
  }
}
