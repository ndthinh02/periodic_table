/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsEnvGen {
  const $AssetsEnvGen();

  /// File path: assets/env/.env_dev
  String get envDev => 'assets/env/.env_dev';

  /// File path: assets/env/.env_production
  String get envProduction => 'assets/env/.env_production';

  /// File path: assets/env/.env_staging
  String get envStaging => 'assets/env/.env_staging';

  /// List of all assets
  List<String> get values => [envDev, envProduction, envStaging];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/SVNGilroy-Bold.otf
  String get sVNGilroyBold => 'assets/fonts/SVNGilroy-Bold.otf';

  /// File path: assets/fonts/SVNGilroy-Light.otf
  String get sVNGilroyLight => 'assets/fonts/SVNGilroy-Light.otf';

  /// List of all assets
  List<String> get values => [sVNGilroyBold, sVNGilroyLight];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/icon/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/data.json
  String get data => 'assets/json/data.json';

  /// List of all assets
  List<String> get values => [data];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/Actions Plus.svg
  SvgGenImage get actionsPlus =>
      const SvgGenImage('assets/svg/Actions Plus.svg');

  /// File path: assets/svg/Arrow Chevron Back-1.svg
  SvgGenImage get arrowChevronBack1 =>
      const SvgGenImage('assets/svg/Arrow Chevron Back-1.svg');

  /// File path: assets/svg/Arrow Chevron Back.svg
  SvgGenImage get arrowChevronBack =>
      const SvgGenImage('assets/svg/Arrow Chevron Back.svg');

  /// File path: assets/svg/Bullets.svg
  SvgGenImage get bullets => const SvgGenImage('assets/svg/Bullets.svg');

  /// File path: assets/svg/Close X.svg
  SvgGenImage get closeX => const SvgGenImage('assets/svg/Close X.svg');

  /// File path: assets/svg/Grid Feed Cards.svg
  SvgGenImage get gridFeedCards =>
      const SvgGenImage('assets/svg/Grid Feed Cards.svg');

  /// File path: assets/svg/Metallic.svg
  SvgGenImage get metallic => const SvgGenImage('assets/svg/Metallic.svg');

  /// File path: assets/svg/Pressure_light.svg
  SvgGenImage get pressureLight =>
      const SvgGenImage('assets/svg/Pressure_light.svg');

  /// File path: assets/svg/Search.svg
  SvgGenImage get search => const SvgGenImage('assets/svg/Search.svg');

  /// File path: assets/svg/Toxic.svg
  SvgGenImage get toxic => const SvgGenImage('assets/svg/Toxic.svg');

  /// File path: assets/svg/Vector.svg
  SvgGenImage get vector => const SvgGenImage('assets/svg/Vector.svg');

  /// File path: assets/svg/electron.svg
  SvgGenImage get electron => const SvgGenImage('assets/svg/electron.svg');

  /// File path: assets/svg/mass.svg
  SvgGenImage get mass => const SvgGenImage('assets/svg/mass.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        actionsPlus,
        arrowChevronBack1,
        arrowChevronBack,
        bullets,
        closeX,
        gridFeedCards,
        metallic,
        pressureLight,
        search,
        toxic,
        vector,
        electron,
        mass
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en-US.json
  String get enUS => 'assets/translations/en-US.json';

  /// File path: assets/translations/vi-VN.json
  String get viVN => 'assets/translations/vi-VN.json';

  /// List of all assets
  List<String> get values => [enUS, viVN];
}

class Assets {
  Assets._();

  static const $AssetsEnvGen env = $AssetsEnvGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      // colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
