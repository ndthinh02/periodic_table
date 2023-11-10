import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/features/home/presentation/home_page.dart';
import 'package:flutter_core/routes/app_routes.dart';
import 'package:injectable/injectable.dart';

part 'app_pages.gr.dart';

@singleton
@MaterialAutoRouter(routes: [
  AutoRoute(path: AppRoutes.home, page: HomePage, initial: true),
])
class AppPages extends _$AppPages {}
