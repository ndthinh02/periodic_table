import 'package:flutter/material.dart';
import 'package:flutter_core/common/app_theme/app_styles.dart';
import 'package:flutter_core/features/home/data/datasource/model/periodic_model.dart';
import 'package:flutter_core/features/home/presentation/widgets/overview_widget.dart';
import 'package:flutter_core/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/app_theme/app_colors.dart';
import '../widgets/button.dart';
import '../widgets/item_search.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({
    super.key,
    required this.periodicModel,
    this.index,
  });

  final List<PeriodicModel> periodicModel;
  int? index;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 34.h,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Assets.svg.arrowChevronBack.svg(),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    "Detail",
                    style: AppStyles.subTitle1.copyWith(
                      color: AppColors.color000000,
                      fontWeight: FontWeight.w700,
                      height: 1,
                      fontSize: 24.sp,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Container(
                      height: 250.h,
                      padding: EdgeInsets.only(
                        top: 13.h,
                        left: 13.w,
                      ),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/svg/image.png'),
                          fit: BoxFit.cover,
                        ),
                        color: AppColors.colorFBE8E7,
                        borderRadius: BorderRadius.circular(
                          8.r,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                  top: 3.h,
                                  // left: 6.w,
                                ),
                                width: 94.w,
                                height: 87.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    8.r,
                                  ),
                                  color: colorContainer(widget.periodicModel![widget.index ?? 0]),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      '${widget.periodicModel?[widget.index ?? 0].atomicNumber}',
                                      style: AppStyles.subTitle1.copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        height: 28 / 16,
                                        color: colorText(widget.periodicModel[widget.index ?? 0]),
                                      ),
                                    ),
                                    Text(
                                      '${widget.periodicModel?[widget.index ?? 0].symbol}',
                                      style: AppStyles.subTitle1.copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        height: 24 / 16,
                                        color: colorText(widget.periodicModel[widget.index ?? 0]),
                                      ),
                                    ),
                                    Text(
                                      '${widget.periodicModel?[widget.index ?? 0].name}',
                                      style: AppStyles.subTitle1.copyWith(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 11.5 / 10,
                                        color: colorText(widget.periodicModel[widget.index ?? 0]),
                                      ),
                                    ),
                                    Text(
                                      '${widget.periodicModel?[widget.index ?? 0].atomicWeight}',
                                      style: AppStyles.subTitle1.copyWith(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        height: 11.5 / 10,
                                        color: colorText(widget.periodicModel[widget.index ?? 0]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 19.w,
                              ),
                              Column(
                                children: [
                                  Text(
                                    widget.periodicModel?[widget.index ?? 0]?.name ?? '',
                                    style: AppStyles.subTitle1.copyWith(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                      height: 24 / 24,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    widget.periodicModel?[widget.index ?? 0]?.category ?? '',
                                    style: AppStyles.subTitle1.copyWith(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      height: 24 / 14,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 46.h,
                          ),
                          Row(
                            children: [
                              _reusableContainer(
                                title: "Electron",
                                subTitle: '${widget.periodicModel?[widget.index ?? 0].electron}',
                              ),
                              SizedBox(
                                width: 21.w,
                              ),
                              _reusableContainer(
                                title: "Proton",
                                subTitle: '${widget.periodicModel?[widget.index ?? 0].proton}',
                              ),
                              SizedBox(
                                width: 21.w,
                              ),
                              _reusableContainer(
                                title: "Notron",
                                subTitle: '${widget.periodicModel?[widget.index ?? 0].notron}',
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 24.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.colorF9FAFE,
                        borderRadius: BorderRadius.circular(
                          8.r,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ButtonLeftWidget(
                                btnLeft: () {
                                  setState(() {
                                    if (widget.index == 0) {
                                      widget.index = (widget.periodicModel.length) - 1;
                                    } else {
                                      widget.index = (widget.index ?? 0) - 1;
                                    }
                                  });
                                },
                                index: widget.index == 0 ? (widget.periodicModel.length) : (widget.index ?? 0 - 1),
                                name: widget
                                    .periodicModel[
                                        widget.index == 0 ? (widget.periodicModel.length) - 1 : (widget.index ?? 0) - 1]
                                    .name,
                              ),
                              ButtonRightWidget(
                                btnRight: () => setState(
                                  () {
                                    if (widget.index == widget.periodicModel.length - 1) {
                                      widget.index = 0;
                                    } else {
                                      widget.index = (widget.index ?? 0) + 1;
                                    }
                                  },
                                ),
                                index: widget.index == widget.periodicModel.length - 1 ? 1 : (widget.index ?? 0) + 2,
                                name: widget.index == widget.periodicModel.length - 1
                                    ? "Hydrogen"
                                    : widget.periodicModel[(widget.index ?? 0) + 1].name,
                                last: widget.periodicModel.length - 1,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          Text(
                            "Overview",
                            style: AppStyles.subTitle1.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              height: 20 / 20,
                              color: AppColors.color000000,
                            ),
                          ),
                          SizedBox(
                            height: 26.h,
                          ),
                          OverviewWidget(
                            periodicModel: widget.periodicModel[widget.index ?? 0],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Container _reusableContainer({
    String? title,
    String? subTitle,
  }) =>
      Container(
        padding: EdgeInsets.only(
          top: 3.h,
          // left: 6.w,
        ),
        width: 94.w,
        height: 87.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8.r,
          ),
          color: colorContainer(widget.periodicModel[widget.index ?? 0]),
        ),
        child: Column(
          children: [
            Text(
              title ?? '',
              style: AppStyles.subTitle1.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                height: 28 / 14,
                color: colorText(widget.periodicModel[widget.index ?? 0]),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              subTitle ?? '',
              style: AppStyles.subTitle1.copyWith(
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
                height: 24 / 32,
                color: colorText(widget.periodicModel[widget.index ?? 0]),
              ),
            ),
          ],
        ),
      );
}
