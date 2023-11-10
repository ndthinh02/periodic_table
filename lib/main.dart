import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/routes/app_pages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/index.dart';
import 'common/notification/local_notification_helper.dart';
import 'common/notification/push_notification_helper.dart';
import 'di/di_setup.dart';
import 'firebase_options.dart';
import 'gen/fonts.gen.dart';

String envConfig(String flavor) {
  switch (flavor) {
    case 'dev':
      return 'assets/env/.env_dev';
    case 'staging':
      return 'assets/env/.env_staging';
    case 'production':
      return 'assets/env/.env_production';
    default:
      return 'assets/env/.env_dev';
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
  const flavor = String.fromEnvironment('flavor', defaultValue: 'dev');
  log("flavor: $flavor");
  await dotenv.load(
    fileName: envConfig(flavor),
  );
  await EasyLocalization.ensureInitialized();
  configureDependencies();
  await getIt<PushNotificationHelper>().initialize();
  await getIt<LocalNotificationHelper>().init();
  runApp(
    DevicePreview(
      enabled: false, // !kReleaseMode,
      builder: (context) {
        return EasyLocalization(
          supportedLocales: LocalizationConstants.availableLocales,
          startLocale: LocalizationConstants.viLocale,
          path: LocalizationConstants.path,
          fallbackLocale: LocalizationConstants.viLocale,
          child: MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRoute = getIt<AppPages>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(
          ScreenUtilsConfig.designWidth,
          ScreenUtilsConfig.designHeight,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: AppColors.color3E374D,
              fontFamily: FontFamily.sVNGilroy,
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: AppColors.color3E374D,
                    displayColor: AppColors.color3E374D,
                    fontFamily: FontFamily.sVNGilroy,
                  ),
              tabBarTheme: Theme.of(context).tabBarTheme.copyWith(
                    labelStyle:
                        Theme.of(context).tabBarTheme.labelStyle?.copyWith(
                              fontFamily: FontFamily.sVNGilroy,
                            ),
                  ),
            ),
            routerDelegate: _appRoute.delegate(),
            routeInformationParser: _appRoute.defaultRouteParser(),
            // routerDelegate: ,
          );
        });
  }
}
