// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../base/bloc/index.dart';
// import '../../../app_theme/index.dart';
//
// class AppButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String title;
//   final double? width;
//   final double? height;
//   final TextStyle? textStyle;
//   final double? borderRadius;
//   final Color? backgroundColor;
//   final Widget? trailingIcon;
//   final Widget? leadingIcon;
//   final bool isDisable;
//   final double? horizontalPadding;
//   final double? verticalPadding;
//   final Color? textColor;
//   final bool? isOutlined;
//   final BaseStateStatus? status;
//   const AppButton(
//       {Key? key,
//       required this.onPressed,
//       this.textColor,
//       this.textStyle,
//       this.trailingIcon,
//       this.leadingIcon,
//       this.isDisable = false,
//       this.horizontalPadding,
//       this.verticalPadding,
//       this.backgroundColor = AppColors.color3E374D,
//       this.borderRadius,
//       required this.title,
//       this.width,
//       this.isOutlined,
//       this.height,
//       this.status})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: isDisable ? null : onPressed,
//       style: (isOutlined ?? false)
//           ? OutlinedButton.styleFrom(
//               side: const BorderSide(color: AppColors.color3E374D),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
//               ),
//               padding: EdgeInsets.zero,
//             )
//           : ButtonStyle(
//               backgroundColor: MaterialStateProperty.all(
//                 isDisable ? AppColors.color3E374D : backgroundColor,
//               ),
//               padding: MaterialStateProperty.all(EdgeInsets.zero),
//               shape: MaterialStateProperty.all<OutlinedBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
//                 ),
//               ),
//             ),
//       child: Container(
//         height: height,
//         width: width ?? 1.sw,
//         padding: EdgeInsets.symmetric(
//           horizontal: horizontalPadding ?? 0,
//           vertical: verticalPadding ?? 14.h,
//         ),
//         child: Center(
//           child: Wrap(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(right: 6.0.w),
//                 child: leadingIcon ?? const SizedBox.shrink(),
//               ),
//               status == BaseStateStatus.loading
//                   ? Platform.isIOS
//                       ? const CupertinoActivityIndicator()
//                       : const CircularProgressIndicator()
//                   : Text(
//                       title,
//                       textAlign: TextAlign.center,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: textStyle?.copyWith(color: textColor) ??
//                           AppStyles.t16m.copyWith(
//                             color: (isOutlined ?? false)
//                                 ? AppColors.color3E374D
//                                 : AppColors.white,
//                           ),
//                     ),
//               Padding(
//                 padding: EdgeInsets.only(left: 4.0.w),
//                 child: trailingIcon ?? const SizedBox.shrink(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
