import 'package:flutter/material.dart';
import 'package:flutter_core/features/block/block_screen.dart';
import 'package:flutter_core/features/home/data/datasource/model/periodic_model.dart';
import 'package:flutter_core/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_core/features/home/presentation/widgets/option_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../base/base_widget.dart';
import '../../../base/bloc/bloc_status.dart';
import '../../../common/app_theme/app_colors.dart';
import '../../../common/app_theme/app_styles.dart';
import '../../../common/enum/menu_drawer_enum.dart';
import '../../../gen/assets.gen.dart';
import '../../category/category_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const kRowCount = 10;

const kContentSize = 64.0;
const kGutterWidth = 2.0;

const kGutterInset = EdgeInsets.all(kGutterWidth);

class _HomePageState extends BaseShareState<HomePage, HomeEvent, HomeState, HomeBloc> {
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
  List<Widget> listNavigationDrawer = [
    const CategoryScreen(),
    const BlockScreen(),
  ];
  int selectedIndex = 0;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(const HomeEvent.init());
  }

  @override
  Widget renderUI(BuildContext context) {
    // TODO: implement renderUI
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: _textFiledWidget(),
          leading: Builder(builder: (context) {
            return InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Assets.svg.bullets.svg(
                width: 24.w,
                height: 24.h,
                fit: BoxFit.scaleDown,
              ),
            );
          }),
        ),
        drawer: _drawerWidget(),
        floatingActionButton: Container(
          width: 131.w,
          height: 40.h,
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 2.h,
          ),
          child: FloatingActionButton(
              isExtended: true,
              backgroundColor: AppColors.colorECEEF9,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Assets.svg.actionsPlus.svg(
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "Zoom out",
                    style: AppStyles.button1.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      height: 20 / 14,
                      color: AppColors.color000000,
                    ),
                  )
                ],
              ),
              onPressed: () {}),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                _elementGroupWidget(),
                SizedBox(
                  height: 22.h,
                ),
                blocBuilder(
                  (c, s) => s.status == BaseStateStatus.loading
                      ? const CircularProgressIndicator()
                      : _numberWidget(elements: s.listPeriodic),
                )
              ],
            ),
          ),
        ));
  }

  Widget _drawerWidget() {
    return SizedBox(
      width: 210.w,
      child: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Periodic Table',
                style: AppStyles.subTitle1.copyWith(
                  height: 20 / 18,
                  fontSize: 18.sp,
                  color: AppColors.color000000,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              _drawerCategory(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawerCategory() {
    return Column(children: [
      ...(MenuDrawerEnum.values)
          .map((e) => InkWell(
                onTap: () {},
                child: OptionWidget(
                  option: e,
                ),
              ))
          .toList()
    ]);
  }

  Widget _buildTable(List<PeriodicModel> elements) {
    final tiles = elements.map((element) => element != null ? ElementTile(element) : Container(color: Colors.black38)).toList();

    return SingleChildScrollView(
      child: SizedBox(
        height: kRowCount * (kContentSize + (kGutterWidth * 2)),
        child: GridView.count(
          crossAxisCount: kRowCount,
          children: tiles,
          scrollDirection: Axis.horizontal,
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
          child: _buildTable(elements ?? []),
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

  Widget _textFiledWidget() {
    return Container(
      width: 296.w,
      height: 42.h,
      padding: EdgeInsets.only(
        left: 24.w,
        top: 4.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.colorECEEF9,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Assets.svg.search.svg(
            color: AppColors.color98A2B3,
          ),
          SizedBox(
            width: 14.w,
          ),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: 0,
                left: 0,
                right: 0,
                bottom: 10.h,
              ),
              hintText: "Search",
              hintStyle: AppStyles.display.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                height: 24 / 16,
                color: AppColors.color98A2B3,
              ),
              border: InputBorder.none,
            ),
          ))
        ],
      ),
    );
  }
}

class ElementTile extends StatelessWidget implements PreferredSizeWidget {
  const ElementTile(this.element, {super.key, this.isLarge = false});

  final PeriodicModel element;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.h,
      margin: EdgeInsets.all(2.w),
      padding: EdgeInsets.only(
        top: 4.h,
        left: 4.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: colorContainer(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${element.atomicNumber}',
            style: AppStyles.button2.copyWith(
              color: colorText(),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              element.symbol ?? 'null',
              style: AppStyles.button2.copyWith(
                color: colorText(),
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                // height: 37 / 20,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              element.name ?? 'null',
              textAlign: TextAlign.center,
              style: AppStyles.button2.copyWith(
                color: colorText(),
                fontSize: 8.sp,
                height: 14 / 8,
              ),
            ),
          )
        ],
      ),
    );
  }

  Color? colorContainer() {
    Color? color;
    switch (element.category) {
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

  Color? colorText() {
    Color? color;
    switch (element.category) {
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

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
