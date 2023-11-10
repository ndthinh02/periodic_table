import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFiled extends StatefulWidget {
  const AppTextFiled({super.key});

  @override
  State<AppTextFiled> createState() => _AppTextFiledState();
}

class _AppTextFiledState extends State<AppTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 296.w,
      height: 42.h,
      decoration: BoxDecoration(),
    );
  }
}
