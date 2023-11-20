import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_theme/app_colors.dart';
import '../../../../common/app_theme/app_styles.dart';
import '../../../../common/enum/menu_drawer_enum.dart';

class OptionWidget extends StatefulWidget {
  OptionWidget({super.key, this.option, this.callBack, this.index, this.selectedIndex});

  final MenuDrawerEnum? option;
  final Function(int? index)? callBack;
  final int? index;
  int? selectedIndex;

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.callBack?.call(widget.index);
        setState(() {
          // if (selectedIndex == -1) {
          //
          // } else {
          //   selectedIndex = -1;
          // }
          widget.selectedIndex = widget.index ?? 0;
        });
      },
      child: Container(
        height: 48.h,
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 24.w,
              height: 24.h,
              child: widget.option?.icon ?? const SizedBox.shrink(),
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              widget.option?.name ?? ' ',
              style: AppStyles.button1.copyWith(
                fontSize: 14.sp,
                height: 24 / 14,
                color: widget.selectedIndex == widget.index ? AppColors.color101828 : AppColors.color979797,
              ),
            )
          ],
        ),
      ),
    );
  }
}
