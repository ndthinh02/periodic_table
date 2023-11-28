import 'package:flutter/material.dart';
import 'package:flutter_core/features/home/data/datasource/model/periodic_model.dart';
import 'package:flutter_core/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_core/features/home/presentation/pages/detail_screen.dart';
import 'package:flutter_core/features/home/presentation/widgets/item_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../base/base_widget.dart';
import '../../../../common/app_theme/app_colors.dart';
import '../../../../common/app_theme/app_styles.dart';
import '../../../../gen/assets.gen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.bloc,
  });

  final HomeBloc bloc;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends BaseShareState<SearchScreen, HomeEvent, HomeState, HomeBloc> {
  int? selectedItemIndex;
  bool animation = false;

  @override
  HomeBloc provideBloc(BuildContext context) => widget.bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(const HomeEvent.search(''));
    Future.delayed(const Duration(seconds: 2), () {
      animation = true;
    });

    // FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget renderUI(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 14.h,
            ),
            _textFiledWidget(context),
            SizedBox(
              height: 32.h,
            ),
            blocBuilder(
              (c, s) => Expanded(
                child: Container(
                  color: AppColors.colorF9FAFE,
                  child: Scrollbar(
                    radius: Radius.circular(
                      8.r,
                    ),
                    thickness: 7.w,
                    isAlwaysShown: true,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        int index = (s.listPeriodic ?? []).indexOf(s.listSearchPeriodic?[i] ?? const PeriodicModel());
                        return ItemSearch(
                          element: s.listSearchPeriodic?[i],
                          callBack: () {
                            Navigator.of(context)
                                .push(
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: DetailScreen(
                                      periodicModel: s.listSearchPeriodic ?? [],
                                      index: i,
                                    ),
                                  ),
                                )
                                .whenComplete(() => bloc.add(const HomeEvent.checkIsSearch()));
                          },
                          index: i,
                          animation: true,
                        );
                      },
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount: (s.listSearchPeriodic?.length ?? 0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textFiledWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 19.w,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Assets.svg.arrowChevronBack.svg(
              width: 24.w,
              height: 24.h,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 19.w,
              top: 4.h,
            ),
            width: 311.w,
            height: 42.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.colorECEEF9,
            ),
            child: Row(
              children: [
                Assets.svg.search.svg(
                  color: AppColors.color98A2B3,
                  width: 24.h,
                  height: 24.h,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  width: 14.w,
                ),
                Expanded(
                    child: TextField(
                  onChanged: (value) {
                    bloc.add(HomeEvent.search(value));
                  },
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
          )
        ],
      ),
    );
  }
}
