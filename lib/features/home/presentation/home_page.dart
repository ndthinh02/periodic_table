import 'package:flutter/material.dart';
import 'package:flutter_core/features/block/block_screen.dart';
import 'package:flutter_core/features/home/data/datasource/model/periodic_model.dart';
import 'package:flutter_core/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_core/features/home/presentation/pages/detail_screen.dart';
import 'package:flutter_core/features/home/presentation/pages/search_screen.dart';
import 'package:flutter_core/features/home/presentation/widgets/circle_color.dart';
import 'package:flutter_core/features/home/presentation/widgets/element_bottom_widget.dart';
import 'package:flutter_core/features/home/presentation/widgets/element_title_widget.dart';
import 'package:flutter_core/features/home/presentation/widgets/header_cell_widget.dart';
import 'package:flutter_core/features/home/presentation/widgets/option_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zoom_widget/zoom_widget.dart';

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
  final _controller1 = ScrollController();
  final _controller2 = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(const HomeEvent.init());
    _controller1.addListener(listener1);
    _controller2.addListener(listener2);
  }

  var _flag1 = false;
  var _flag2 = false;

  void listener1() {
    if (_flag2) return;
    _flag1 = true;
    _controller2.jumpTo(_controller1.offset);
    _flag1 = false;
  }

  void listener2() {
    if (_flag1) return;
    _flag2 = true;
    _controller1.jumpTo(_controller2.offset);
    _flag2 = false;
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.removeListener(listener1);
    _controller2.removeListener(listener2);
    _controller1.dispose();
    _controller2.dispose();
  }

  @override
  Widget renderUI(BuildContext context) {
    // TODO: implement renderUI
    return Scaffold(
      backgroundColor: Colors.white,
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
      // floatingActionButton: Container(
      //   width: 131.w,
      //   height: 40.h,
      //   padding: EdgeInsets.symmetric(
      //     horizontal: 8.w,
      //     vertical: 2.h,
      //   ),
      //   child: FloatingActionButton(
      //     isExtended: true,
      //     backgroundColor: AppColors.colorECEEF9,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(8.r),
      //       ),
      //     ),
      //     child: Row(
      //       children: [
      //         SizedBox(
      //           width: 5.w,
      //         ),
      //         Assets.svg.actionsPlus.svg(
      //           width: 24.w,
      //           height: 24.h,
      //           fit: BoxFit.scaleDown,
      //         ),
      //         SizedBox(
      //           width: 10.w,
      //         ),
      //         Text(
      //           "Zoom out",
      //           style: AppStyles.button1.copyWith(
      //             fontWeight: FontWeight.w600,
      //             fontSize: 14.sp,
      //             height: 20 / 14,
      //             color: AppColors.color000000,
      //           ),
      //         )
      //       ],
      //     ),
      //     onPressed: () {
      //       // Navigator.of(context).push(
      //       //   PageTransition(
      //       //     type: PageTransitionType.fade,
      //       //     child: blocBuilder(
      //       //       (c, p1) => const HorizontalScreen(),
      //       //     ),
      //       //   ),
      //       // );
      //     },
      //   ),
      // ),
      body: SafeArea(
        child: Zoom(
          backgroundColor: Colors.white,
          scrollWeight: 0,
          colorScrollBars: Colors.transparent,
          maxZoomWidth: 1800,
          maxZoomHeight: 1000,
          initScale: 1,
          maxScale: 2,
          // initTotalZoomOut: true,
          onPanUpPosition: (p0) {},
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
              Expanded(
                child: blocBuilder(
                  (c, s) => s.status == BaseStateStatus.loading
                      ? const CircularProgressIndicator()
                      : SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: _numberWidget(elements: s.listPeriodic),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
    return Column(
      children: List.generate(
        MenuDrawerEnum.values.toList().length,
        (index) => OptionWidget(
          index: index,
          selectedIndex: selectedIndex,
          option: MenuDrawerEnum.values.toList()[index],
          callBack: (i) {
            setState(() {
              selectedIndex = i ?? 0;
            });
          },
        ),
      ),
    );
  }

  // Navigator _navigate(int? id) {
  //   switch (id) {
  //     case 1:
  //
  //       break;
  //   }
  // }

  Widget _numberWidget({
    List<PeriodicModel>? elements,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
                // color: AppColors.colorECEEF9,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(index == 0 ? 8.r : 0),
                  topRight: Radius.circular(index == 0 ? 8.r : 0),
                ),
                // border: Border.all(
                //   width: 0.5,
                //   color: AppColors.colorD0D5DD,
                // ),
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
            controller: _controller1,
            scrollDirection: Axis.horizontal,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  left: 200.w,
                  child: CustomGridView(
                    index: selectedIndex,
                  ),
                ),
                TableCreator(
                  index: selectedIndex,
                  groupCount: 18,
                  periodCount: 11,
                  elements: elements ?? [],
                  cellSize: 70.w,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _elementGroupWidget() {
    return SingleChildScrollView(
      controller: _controller2,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          elementGroup.length,
          (index) => Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 22.w : 0,
            ),
            alignment: Alignment.center,
            width: index == 7 ? 240.w : 80.w,
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
    return InkWell(
      onTap: () => Navigator.of(context).push(
        PageTransition(
          child: SearchScreen(
            bloc: bloc,
          ),
          type: PageTransitionType.bottomToTop,
        ),
      ),
      child: Container(
        width: 296.w,
        height: 42.h,
        padding: EdgeInsets.only(
          left: 24.w,
          top: 0.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.colorECEEF9,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.svg.search.svg(
              color: AppColors.color98A2B3,
            ),
            SizedBox(
              width: 14.w,
            ),
            Text(
              "Search",
              style: AppStyles.display.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                height: 24 / 16,
                color: AppColors.color98A2B3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TableCreator extends StatelessWidget {
  final int groupCount, periodCount;
  final double cellSize;
  final List<PeriodicModel> elements;
  final int? index;

  const TableCreator({
    Key? key,
    required this.groupCount,
    required this.periodCount,
    required this.elements,
    required this.cellSize,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myColumn = [];
    List<Widget> myRow = [];

    myRow.add(const _EmptyCell(
      cellSize: 0,
    ));
    for (int k = 0; k < groupCount; k++) {
      myRow.add(HeaderCell(text: (k + 1).toString()));
    }
    Widget rowWidget = Row(
      children: myRow,
    );
    myColumn.add(rowWidget);

    for (int i = 1; i < periodCount; i++) {
      List<Widget> myRow = [];
      myRow.add(
        i < 8
            ? HeaderCell(text: i.toString())
            : _EmptyCell(
                cellSize: cellSize,
              ),
      );
      for (int j = 0; j < groupCount; j++) {
        bool isEmpty = true;
        for (int a = 0; a < elements.length; a++) {
          if (elements[a].xpos == j + 1 && elements[a].ypos == i) {
            myRow.add(
              ElementTile(
                index: index,
                element: elements[a],
                cellSize: cellSize,
                callBack: () {
                  Navigator.of(context).push(
                    PageTransition(
                      child: DetailScreen(
                        periodicModel: elements,
                        index: a,
                      ),
                      type: PageTransitionType.fade,
                      duration: const Duration(
                        microseconds: 500,
                      ),
                    ),
                  );
                },
                onLongPress: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        topRight: Radius.circular(8.r),
                      ),
                    ),
                    builder: (context) {
                      return ElementBottomWidget(
                        onTap: () => Navigator.of(context)
                            .push(
                              PageTransition(
                                child: DetailScreen(
                                  periodicModel: elements,
                                  index: a,
                                ),
                                type: PageTransitionType.fade,
                                duration: const Duration(
                                  microseconds: 500,
                                ),
                              ),
                            )
                            .whenComplete(
                              () => Navigator.of(context).pop(),
                            ),
                        periodicModel: elements[a],
                      );
                    },
                  );
                },
              ),
            );
            isEmpty = false;
          }
        }
        if (isEmpty) {
          myRow.add(_EmptyCell(
            cellSize: cellSize,
          ));
        }
      }
      Widget rowWidget = Row(
        children: myRow,
      );
      myColumn.add(rowWidget);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: myColumn,
    );
  }
}

class _EmptyCell extends StatelessWidget {
  final double cellSize;

  const _EmptyCell({
    required this.cellSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: cellEdgeInsets,
      width: cellSize,
      height: cellSize,
    );
  }
}
