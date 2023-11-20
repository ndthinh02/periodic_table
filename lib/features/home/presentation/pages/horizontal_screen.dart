import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_core/features/home/data/datasource/model/periodic_model.dart';
import 'package:flutter_core/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../base/base_widget.dart';
import '../../../../base/bloc/bloc_status.dart';
import '../../../../common/app_theme/app_colors.dart';
import '../../../../common/app_theme/app_styles.dart';
import '../../../../gen/assets.gen.dart';
import '../home_page.dart';

class HorizontalScreen extends StatefulWidget {
  const HorizontalScreen({super.key});

  @override
  State<HorizontalScreen> createState() => _HomePageState();
}

const kRowCount = 10;

const kContentSize = 64.0;
const kGutterWidth = 2.0;

const kGutterInset = EdgeInsets.all(kGutterWidth);

class _HomePageState extends BaseShareState<HorizontalScreen, HomeEvent, HomeState, HomeBloc> {
  List<String> elementGroup = [
    "IA",
    "IIA",
    "IIIB",
    "IVB",
    "VB",
    "VIB",
    "VIIB",
    "VIIIB",
    "IB",
    "IIB",
    "IIIA",
    "IVA",
    "VA",
    "VIA",
    "VIIA",
    "VIIIA",
  ];

  int selectedIndex = 0;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(const HomeEvent.init());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget renderUI(BuildContext context) {
    // TODO: implement renderUI
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            left: 16.w,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Assets.svg.arrowChevronBack.svg(
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.scaleDown,
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: blocBuilder(
                        (c, s) => s.status == BaseStateStatus.loading
                        ? const CircularProgressIndicator()
                        : _numberWidget(elements: s.listPeriodic),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _numberWidget({List<PeriodicModel>? elements}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 24.w,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: 7,
            itemBuilder: (context, index) => Container(
              alignment: Alignment.center,
              width: 24.w,
              height: 80.h,
              margin: EdgeInsets.only(left: 1.w),
              decoration: BoxDecoration(
                color: AppColors.colorECEEF9,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(index == 0 ? 8.r : 0),
                  topRight: Radius.circular(index == 0 ? 8.r : 0),
                ),
                border: Border.all(
                  width: 0.5,
                  color: AppColors.colorD0D5DD,
                ),
              ),
              child: Text(
                '${index + 1}',
                style: AppStyles.caption.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  height: 20 / 12,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: TableCreator(
              groupCount: 18,
              periodCount: 11,
              elements: elements ?? [],
              cellSize: 20.w,
            ),
          ),
        ),
      ],
    );
  }

  Widget _elementGroupWidget() {
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          elementGroup.length,
          (index) => Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 25.w : 0,
            ),
            alignment: Alignment.center,
            width: 80.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: AppColors.colorECEEF9,
              border: Border.all(
                width: 0.5.w,
                color: AppColors.colorD0D5DD,
              ),
            ),
            child: Text(
              elementGroup[index],
              style: AppStyles.subTitle3.copyWith(
                fontSize: 12.sp,
                height: 20 / 12,
                color: AppColors.color000000,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
